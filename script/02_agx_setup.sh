#!/bin/bash
set -eo pipefail

AGX_DEB=agx-2.40.0.0-amd64-ubuntu_22.04.deb

cd "$HOME"
echo "[Download AGX Dynamics]"
[ -f "$AGX_DEB" ] || wget "https://www.algoryx.se/download/installers/$AGX_DEB"

echo "[Install AGX Dynamics]"
sudo apt install -y "./$AGX_DEB"

echo "[Install complete!!!]"
echo "[Please do the following]"
echo "Place the AGX license file (agx.lic) provided by the competition secretariat in /opt/Algoryx/AGX-2.40.0.0/"
