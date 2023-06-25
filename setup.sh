# Setup Script for preferred desktop configuration(s) for Manjaro GNOME
# 1. add execute permissions to scripts
chmod +x auto-monitor-scaling.sh
chmod +x system-upgrade.sh

# 2. place each config file in its respective directory
mv .zlogin ~/
sudo mv 09-monitors.conf /etc/X11/xorg.conf.d/
mv auto-monitor-scaling.sh ~/.config/autostart/
mv brave-flags.conf ~/.config/
mv electron-flags.conf ~/.config/
mv htop.desktop ~/.local/share/applications/
mv i2c_dev.conf /etc/modules-load.d/
mv intel_graphics_monitor.desktop ~/.local/share/applications/
mv intel.svg ~/.local/share/icons/
mv kvantum.kvconfig ~/.config/Kvantum/
mv terminator_search.py ~/.config/terminator/plugins/
mv Terminator.desktop ~/.local/share/kservices5/ServiceMenus/
mv user-dirs.dirs ~/.config/
mv .gitconfig ~/

# 3. other permissions
# Run intel_gpu_top without sudo
# Granting the CAP_PERFMON capability to the intel_gpu_top binary using the setcap command.
sudo setcap cap_perfmon+ep /usr/bin/intel_gpu_top

# 4. Append configurations to config files
# A. ~/.zshrc
cat << EOF >> ~/.zshrc
# enable conda for current user
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Add the following code to your .zshrc file: mcfly installer
eval "$(mcfly init zsh)"
export MCFLY_LIGHT=TRUE
export MCFLY_RESULTS=50

# Prevents miniconda python from being default python
#export PATH="/usr/bin:/usr/local/bin:/path/to/miniconda/bin:$PATH"

# bat theme
export BAT_THEME="GitHub"

# export path to terminal
export TERMINAL=/usr/bin/terminator
export TERM=terminator
EOF

# B. /etc/pulse/default.pa
# use audio jack on boot
sudo cat << EOF >> /etc/pulse/default.pa
### Make headphones default
set-default-sink 0
set-sink-port 0 analog-output-headphones
EOF
# Remember to restart pulse
systemctl --user restart pulseaudio

# C. Enable Wayland on GDM rules with Nvidia
# /usr/lib/udev/rules.d/61-gdm.rules
sudo sed -i '/PreferredDisplayServer xorg/s/^/#/' /usr/lib/udev/rules.d/61-gdm.rules
sudo sed -i '/WaylandEnable false/s/^/#/' /usr/lib/udev/rules.d/61-gdm.rules
# /etc/gdm/custom.conf
sudo sed -i '/WaylandEnable=false/s/^/#/' /etc/gdm/custom.conf
