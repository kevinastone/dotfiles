#!/usr/bin/env zx

$.verbose = false;

// 1. Parse CLI arguments
const rawIgnore = argv.i ?? argv.ignore ?? [];
const ignoreList = Array.isArray(rawIgnore) ? rawIgnore : [rawIgnore];
const targetDir = path.resolve(argv._[0] || ".");

// 2. Find candidate videos (directories containing exactly 1 video file)
const ignorePatterns = ignoreList.flatMap((d) => {
  const trimmed = d.replace(/\/+$/, "");
  if (!trimmed) return [];
  if (trimmed.startsWith("/")) return [trimmed, `${trimmed}/**`];
  return [`**/${trimmed}/**`, `**/${trimmed}`, `${trimmed}/**`, `${trimmed}`];
});

const videoFiles = await glob("*/*.{mp4,mkv,avi,mov,wmv,flv,webm,m4v}", {
  cwd: targetDir,
  ignore: ignorePatterns,
  absolute: true,
  caseSensitiveMatch: false,
});

const byDir = new Map();
for (const file of videoFiles) {
  const dir = path.dirname(file);
  if (!byDir.has(dir)) byDir.set(dir, []);
  byDir.get(dir).push(file);
}

const candidates = [];
for (const [, files] of byDir) {
  if (files.length === 1) candidates.push(files[0]);
}

if (candidates.length === 0) {
  console.log("No single video files found to unnest.");
  process.exit(0);
}

// 3. Prompt user with gum to select which files to move
console.log(
  "Select which video files to unnest (Space to select/deselect, Enter to confirm):",
);
let selectedFiles = [];
try {
  const input = `${candidates.join("\n")}\n`;
  const res = $.spawnSync("gum", ["choose", "--no-limit", "--selected=*"], {
    input,
    stdio: ["pipe", "pipe", "inherit"],
    encoding: "utf-8",
  });
  if (res.status === 0 && res.stdout) {
    selectedFiles = res.stdout.trim().split("\n").filter(Boolean);
  }
} catch {
  // gum exits with non-zero on escape or cancel
}

if (selectedFiles.length === 0) {
  console.log("No files selected. Aborting.");
  process.exit(0);
}

// 4. Move selected files to parent directory
console.log("Moving selected files...");
const movedDirs = new Set();

for (const videoFile of selectedFiles) {
  const sourceDir = path.dirname(videoFile);
  const parentDir = path.dirname(sourceDir);
  console.log(`Moving '${path.basename(videoFile)}' to '${parentDir}'`);
  await fs.move(videoFile, path.join(parentDir, path.basename(videoFile)), {
    overwrite: false,
  });
  movedDirs.add(sourceDir);
}

// 5. Prompt user to clean up emptied source directories
if (movedDirs.size > 0) {
  console.log(
    "\nSelect which directories to delete (Space to select/deselect, Enter to confirm):",
  );
  const uniqueDirs = Array.from(movedDirs).sort();
  let selectedDirs = [];
  try {
    const input = `${uniqueDirs.join("\n")}\n`;
    const res = $.spawnSync("gum", ["choose", "--no-limit", "--selected=*"], {
      input,
      stdio: ["pipe", "pipe", "inherit"],
      encoding: "utf-8",
    });
    if (res.status === 0 && res.stdout) {
      selectedDirs = res.stdout.trim().split("\n").filter(Boolean);
    }
  } catch {
    // cancelled
  }

  if (selectedDirs.length > 0) {
    console.log("Deleting selected directories...");
    for (const dir of selectedDirs) {
      console.log(`Removing '${dir}'`);
      await fs.remove(dir);
    }
  } else {
    console.log("No directories selected for deletion.");
  }
}
