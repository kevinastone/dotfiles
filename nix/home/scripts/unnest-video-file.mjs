#!/usr/bin/env zx

$.verbose = false;

// 1. Parse CLI arguments
const ignoreList = [argv.i, argv.ignore].filter(Boolean).flat();
const targetDir = path.resolve(argv._[0] || ".");

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
  .filter((files) => files.length === 1)
  .map(([file]) => file);

if (candidates.length === 0) {
  console.log("No single video files found to unnest.");
  process.exit(0);
}

// 3. Helper to interactively choose items via gum
function gumChoose(items) {
  try {
    const res = $.spawnSync("gum", ["choose", "--no-limit", "--selected=*"], {
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
console.log(
  "Select which video files to unnest (Space to select/deselect, Enter to confirm):",
);
const selectedFiles = gumChoose(candidates);

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
  console.log(
    "\nSelect which directories to delete (Space to select/deselect, Enter to confirm):",
  );
  const selectedDirs = gumChoose(movedDirs);

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
