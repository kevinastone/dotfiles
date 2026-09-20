#!/usr/bin/env zx
/// <reference types="zx/globals" />

$.verbose = false;

interface ScriptArgs {
  i?: string | string[];
  ignore?: string | string[];
  _: string[];
}

const args = argv as unknown as ScriptArgs;

// 1. Parse CLI arguments
const ignoreList = [args.i, args.ignore]
  .flat()
  .filter((x): x is string => Boolean(x));
const targetDir = path.resolve(args._[0] || ".");

// 2. Find candidate videos (directories containing exactly 1 video file)
const ignorePatterns = ignoreList.flatMap((d) => {
  const trimmed = d.replace(/\/+$/, "");
  if (!trimmed) return [];
  const rel =
    path.isAbsolute(trimmed) && trimmed.startsWith(targetDir)
      ? path.relative(targetDir, trimmed)
      : trimmed;
  return [`${rel}/**`, rel];
});

const videoFiles = await glob("*/*.{mp4,mkv,avi,mov,wmv,flv,webm,m4v}", {
  cwd: targetDir,
  ignore: ignorePatterns,
  absolute: true,
  caseSensitiveMatch: false,
});

const candidates = Object.values(Object.groupBy(videoFiles, path.dirname))
  .filter((files): files is string[] => files?.length === 1)
  .map(([file]) => file);

if (candidates.length === 0) {
  console.log("No single video files found to unnest.");
  process.exit(0);
}

// 3. Helper to interactively choose items via gum
function gumChoose(items: string[], header?: string): string[] {
  try {
    const gumArgs = ["choose", "--no-limit", "--selected=*"];
    if (header) {
      gumArgs.push(`--header=${header}`);
    }
    const res = $.spawnSync("gum", gumArgs, {
      input: [...items, ""].join("\n"),
      stdio: ["pipe", "pipe", "inherit"],
      encoding: "utf-8",
    });
    if (res.status === 0 && res.stdout) {
      return res.stdout.trim().split("\n").filter(Boolean);
    }
  } catch {
    // gum exits with non-zero on escape or cancel
  }
  return [];
}

// 4. Prompt user to select which files to move
const selectedFiles = gumChoose(
  candidates,
  "Select which video files to unnest",
);

if (selectedFiles.length === 0) {
  console.log("No files selected. Aborting.");
  process.exit(0);
}

// 5. Move selected files to parent directory
console.log("Moving selected files...");
const movedDirs = await Promise.all(
  selectedFiles.map(async (videoFile) => {
    const sourceDir = path.dirname(videoFile);
    const parentDir = path.dirname(sourceDir);
    console.log(`Moving '${path.basename(videoFile)}' to '${parentDir}'`);
    await fs.move(videoFile, path.join(parentDir, path.basename(videoFile)), {
      overwrite: false,
    });
    return sourceDir;
  }),
);

// 6. Prompt user to clean up emptied source directories
if (movedDirs.length > 0) {
  const selectedDirs = gumChoose(
    movedDirs,
    "Select which directories to delete",
  );

  if (selectedDirs.length > 0) {
    console.log("Deleting selected directories...");
    await Promise.all(
      selectedDirs.map(async (dir) => {
        console.log(`Removing '${dir}'`);
        await fs.remove(dir);
      }),
    );
  } else {
    console.log("No directories selected for deletion.");
  }
}
