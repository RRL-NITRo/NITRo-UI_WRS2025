#!/bin/bash
set -eo pipefail

WS_ROOT=$(cd "$(dirname "$0")/.." && pwd)

echo "[Vcs import]"
mkdir -p "$WS_ROOT/wrs_ws/src"
vcs import "$WS_ROOT" < "$WS_ROOT/NITRo-UI.repos"
echo "[Import complete!!!]"
