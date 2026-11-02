#!/bin/bash
set -eo pipefail

echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

add_bashrc() { grep -qxF "$1" "$HOME/.bashrc" || echo "$1" >> "$HOME/.bashrc"; }

echo "[Enable universe repository]"
sudo apt update
sudo apt install -y software-properties-common curl
sudo add-apt-repository -y universe

echo "[Setup ROS 2 apt source]"
sudo rm -f /etc/apt/sources.list.d/ros2.list
ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo $VERSION_CODENAME)_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb

echo "[Update the package lists]"
sudo apt update
sudo apt upgrade -y

echo "[Install ROS 2 Humble]"
sudo apt install -y ros-humble-desktop ros-humble-compressed-image-transport
sudo apt install -y python3-colcon-common-extensions python3-vcstool

echo "[Environment setup]"
add_bashrc "source /opt/ros/humble/setup.bash"

echo "[Complete!!!]"
exit 0
