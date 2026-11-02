#!/bin/bash
set -eo pipefail

WS_ROOT=$(cd "$(dirname "$0")/.." && pwd)

add_bashrc() { grep -qxF "$1" "$HOME/.bashrc" || echo "$1" >> "$HOME/.bashrc"; }

add_bashrc "source /opt/Algoryx/AGX-2.40.0.0/setup_env.bash"

bash "$WS_ROOT/script/04_vcs_import.sh"

echo "[Install Choreonoid requisites]"
bash "$WS_ROOT/wrs_ws/src/choreonoid/misc/script/install-requisites-ubuntu-22.04.sh"

bash "$WS_ROOT/script/10_ws_build.sh"

add_bashrc "source $WS_ROOT/wrs_ws/install/setup.bash"

echo "[Complete!!!]"
echo "Open a new terminal to apply the environment"
