# Preferred Manjaro GNOME Setup

includes configurations, desktop files, resources, and scripts

## Instructions

- download zip/clone repo
- check *setup.sh* for unecessary configs i.e. comment/delete them
- make *setup.sh* executable: `chmod +x setup.sh`
- run *setup.sh*: `./setup.sh`

## Descriptions

- `.zlogin` specify the settings for the Z login manager
- `09-monitors.conf` configuring monitors and display settings for Xorg
- `README.md` repo instructions and descriptions
- `Terminator.desktop` *open terminator here* right click context menu for dolphin
- `auto-monitor-scaling.sh` configuring monitors and display settings using `xrandr`
- `brave-flags.conf` customize brave browser settings and enable experimental features by modifying specific flags
- `electron-flags.conf` customize the behavior of Electron applications
- `extensions.txt` list of enabled gnome extensions
- `htop.desktop` htop laucher using *terminator*
- `intel.svg` intel graphics commander icon
- `intel_graphics_monitor.desktop` `intel_gpu_top` launcher
- `i2c_dev.conf` control the I2C bus
- `kvantum.kvconfig` customize the look and feel of Qt applications
- `other_configs.yml` notes extra configs and commands
- `setup.sh` automates the configuration
- `system-upgrade.sh` removes conda from path if miniconda3 is being updated
- `terminator_search.py` search Google for selected text on *terminator*
- `user-dirs.dirs` specify the locations of the user's personal directories
