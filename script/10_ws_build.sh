#!/bin/bash
set -eo pipefail

WS_ROOT=$(cd "$(dirname "$0")/.." && pwd)

source /opt/ros/humble/setup.bash
source /opt/Algoryx/AGX-2.40.0.0/setup_env.bash

cd "$WS_ROOT/wrs_ws"
colcon build --symlink-install --cmake-args -DBUILD_AGX_DYNAMICS_PLUGIN=ON -DBUILD_AGX_BODYEXTENSION_PLUGIN=ON -DBUILD_WRS2018=ON -DBUILD_SCENE_EFFECTS_PLUGIN=ON -DBUILD_HAIRO_WORLD_PLUGIN=ON -DENABLE_INSTALL_RPATH_USE_LINK_PATH=ON
