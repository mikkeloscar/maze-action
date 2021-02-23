#!/usr/bin/env bash

# set -x
set -euo pipefail

# UGNAME="builder"
repo="$1"
packages="$2"
token="$3"

# setup build dir
mkdir -p build
# sudo chown 1000:1000 -R build 

for pkg in $(echo "$packages" | jq -c '.aur[]'); do
    name="$(echo "$pkg" | jq -r '.name')"
    args=(
        "--repo"
        "$repo"
        "--origin"
        "aur"
        "--package"
        "$name"
        "--upload"
        "--token"
        "$token"
    )

    for key in $(echo "$pkg" | jq -r '. | select(.signing_keys!=null) | .signing_keys[]'); do
        args+=("--signing-key" "$key")
    done

    /usr/bin/maze-build "${args[@]}"
    # echo "${args[@]}"

    # clean build dir
    rm -rf build/*
done
