# NITRo-UI_WRS2025

This repository sets up the development environment for the WRS2025 simulation competition.
It installs ROS 2 Humble, AGX Dynamics, and Choreonoid (with the WRS2025 environment) on Ubuntu 22.04, and builds the workspace.

## Requirements

- Ubuntu 22.04 (amd64)
- ROS 2 Humble
- AGX Dynamics 2.40.0.0
- Choreonoid / choreonoid_ros (master)

## Before you start

- Register an SSH key with GitHub (the URLs in the `.repos` file use SSH)
- Get the AGX Dynamics license file (`agx.lic`) from the competition secretariat

## Directory structure

```
NITRo-UI_WRS2025/
├── NITRo-UI.repos        # List of repositories fetched by vcs import
├── script/               # Setup and build scripts
└── wrs_ws/               # colcon workspace (created by 03)
    └── src/
        ├── choreonoid/
        │   └── ext/
        │       ├── WRS2024PRE/
        │       ├── WRS2025/
        │       └── hairo-world-plugin/
        ├── choreonoid_ros/
        ├── choreonoid_joy2/
        └── nitro-ui_simulation/
```

## Setup

### 1. Clone this repository

```bash
cd ~
git clone git@github.com:RRL-NITRo/NITRo-UI_WRS2025.git
cd NITRo-UI_WRS2025
```

### 2. Install ROS 2 Humble

```bash
bash script/01_ros_setup.sh
```

### 3. Install AGX Dynamics

```bash
bash script/02_agx_setup.sh
```

After installation, place the license file `agx.lic` in `/opt/Algoryx/AGX-2.40.0.0/`.

### 4. Set up Choreonoid and the WRS2025 environment

**Open a new terminal** before running this step.

```bash
bash script/03_choreonoid.sh
```

This fetches the repositories, installs the Choreonoid dependencies, and builds the workspace.
When it finishes, open a new terminal to apply the environment.

## Scripts

| Script | Description |
|---|---|
| `01_ros_setup.sh` | Installs ROS 2 Humble, colcon, and vcstool |
| `02_agx_setup.sh` | Downloads and installs AGX Dynamics |
| `03_choreonoid.sh` | Fetches repositories → installs dependencies → builds |
| `04_vcs_import.sh` | Fetches the repositories in `NITRo-UI.repos` (called by 03) |
| `10_ws_build.sh` | Builds the workspace |
| `11_ws_reset.sh` | Removes `build/` `install/` `log/` (asks before removing `src/`) |

## Rebuilding

```bash
bash script/10_ws_build.sh
```

If the build breaks, remove the build artifacts and rebuild.

```bash
bash script/11_ws_reset.sh
bash script/10_ws_build.sh
```

If you also removed `src/` with `11_ws_reset.sh`, fetch the repositories again with `04_vcs_import.sh` before rebuilding.
Note that removing `src/` also deletes any uncommitted changes.

## Notes

- `hairo-world-plugin` uses the RRL-NITRo fork (`fix-wrsutil` branch).
- The following lines are added to `.bashrc` (they are not added twice).

  ```bash
  source /opt/ros/humble/setup.bash
  source /opt/Algoryx/AGX-2.40.0.0/setup_env.bash
  source ~/NITRo-UI_WRS2025/wrs_ws/install/setup.bash
  ```

## References

- [WRS-2025](https://github.com/wrs-frei-simulation/WRS-2025)
- [Choreonoid](https://choreonoid.org/)
