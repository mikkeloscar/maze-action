#!/bin/env bash

set -euo pipefail

MAZE_REPO="${MAZE_REPO:-""}"
MAZE_TOKEN="${MAZE_TOKEN:-""}"

mkdir -p build
sudo chown 1000:1000 -R build

sudo -u builder /build.sh "$MAZE_REPO" "$@" "$MAZE_TOKEN" "$(pwd)/build"
