#!/usr/bin/env bash

set -euo pipefail

repo="$1"
package="$2"
signing_keys="$3"
token="$4"
build_dir="$5"

echo "args: repo:$repo, package:$package, signing_keys:$signing_keys"

cd "$build_dir"

args=("--repo" "$repo"
    "--origin" "aur"
    "--package" "$package"
    "--upload"
    "--token" "$token"
)

IFS="," read -r -a keys <<< "$signing_keys"
for key in "${keys[@]}"; do
    args+=("--signing-key" "$key")
done

/usr/bin/maze-build "${args[@]}"

# clean build dir (working dir)
rm -rf "repo/"
rm -rf "sources/"
