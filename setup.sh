# Setup Script for preferred desktop configuration(s) 
# 1. place each config file in its respective directory
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
mv system-upgrade.sh ~/
mv terminator_search.py ~/.config/terminator/plugins/
mv Terminator.desktop ~/.local/share/kservices5/ServiceMenus/
mv user-dirs.dirs ~/.config/

# 2. add execute permissions to scripts
chmod +x auto-monitor-scaling.sh
chmod +x system-upgrade.sh

# 3. Append configurations to config files
