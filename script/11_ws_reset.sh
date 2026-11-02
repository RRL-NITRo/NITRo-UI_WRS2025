#!/bin/bash
set -eo pipefail

WS_ROOT=$(cd "$(dirname "$0")/.." && pwd)

cd "$WS_ROOT/wrs_ws" || exit 1

echo "[Remove build/ install/ log/]"
read -p "Also remove src/? (uncommitted changes will be lost) [y/N]: " ans
rm -rf build/ install/ log/
if [ "$ans" = "y" ] || [ "$ans" = "Y" ]; then
    rm -rf src/
fi
