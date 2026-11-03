#!/bin/bash
set -eo pipefail

WS_ROOT=$(cd "$(dirname "$0")/.." && pwd)

add_bashrc() { grep -qxF "$1" "$HOME/.bashrc" || echo "$1" >> "$HOME/.bashrc"; }

add_bashrc "source /opt/Algoryx/AGX-2.40.0.0/setup_env.bash"

bash "$WS_ROOT/script/04_vcs_import.sh"

HAIRO_DIR="$WS_ROOT/wrs_ws/src/choreonoid/ext/hairo-world-plugin"
if [ ! -f "$HAIRO_DIR/CMakeLists.txt" ]; then
  echo "[Error] hairo-world-plugin was not found in $HAIRO_DIR"
  echo "Get hairo-world-plugin from the competition secretariat, place it there, and run this script again."
  exit 1
fi

echo "[Install Choreonoid requisites]"
bash "$WS_ROOT/wrs_ws/src/choreonoid/misc/script/install-requisites-ubuntu-22.04.sh"

bash "$WS_ROOT/script/10_ws_build.sh"

add_bashrc "source $WS_ROOT/wrs_ws/install/setup.bash"

echo "[Complete!!!]"
echo "Open a new terminal to apply the environment"
