#!/usr/bin/env zx
/// <reference types="zx/globals" />

$.verbose = false;

interface ScriptArgs {
  i?: string | string[];
  ignore?: string | string[];
  n?: boolean;
  "dry-run"?: boolean;
  _: string[];
}

const args = argv as unknown as ScriptArgs;

// Parse CLI arguments: collect all -i / --ignore flags into a list
const ignoreList = [args.i, args.ignore]
  .flat()
  .filter((x): x is string => Boolean(x));

const targetDir = args._[0] || ".";
const dryRun = Boolean(args.n || args["dry-run"]);

const nuArgs = [targetDir, ...ignoreList];
if (dryRun) {
  nuArgs.push("--dry-run");
}

// Directly invoke unnest-video-file-nu binary: target followed by ignores varargs
const proc = $.spawnSync("unnest-video-file-nu", nuArgs, {
  stdio: "inherit",
});

process.exit(proc.status ?? 0);
