# Setup Script for preferred desktop configuration(s) for Manjaro GNOME
# 1. add execute permissions to scripts
chmod +x auto-monitor-scaling.sh
chmod +x system-upgrade.sh

# 2. place each config file in its respective directory
sudo mv 09-monitors.conf /etc/X11/xorg.conf.d/
mv auto-monitor-scaling.sh ~/.config/autostart/
mv brave-flags.conf ~/.config/
mv htop.desktop ~/.local/share/applications/
mv i2c_dev.conf /etc/modules-load.d/
mv intel_graphics_monitor.desktop ~/.local/share/applications/
mv intel.svg ~/.local/share/icons/
mv user-dirs.dirs ~/.config/
mv .gitconfig ~/
mv i2c.rules /etc/udev/rules.d/

# 3. other permissions
# Run intel_gpu_top without sudo
# Granting the CAP_PERFMON capability to the intel_gpu_top binary using the setcap command.
sudo setcap cap_perfmon+ep /usr/bin/intel_gpu_top

# 4. Append configurations to config files
# A. /etc/pulse/default.pa
# use audio jack on boot
sudo cat << EOF >> /etc/pulse/default.pa
### Make headphones default
set-default-sink 0
set-sink-port 0 analog-output-headphones
EOF
# Remember to restart pulse
systemctl --user restart pulseaudio

# B. Remove unwanted packages
# Remove libva-intel-driver: prefer intel-media-driver for HD Graphics 530
sudo pacman -R libva-intel-driver lib32-libva-intel-driver

# Add current user to i2c group
sudo gpasswd --add $USER i2c

# Edit desktop files to execute with discrete card
browser_names = "firefox microsoft-edge brave-browser"
for browser in $browser_names
do
    echo "Copying $browser desktop file"
    if cp /usr/share/applications/$browser.desktop ~/.local/share/applications
    then
        echo "Copy successful"
        echo "Sed prime-run command to Exec property on $browser.desktop file"
        if sed -i '/^Exec=/ s/=/=&prime-run /' ~/.local/share/applications/$browser.desktop
        then
            echo "Sed successful"
        else
            echo "Sed failed"
        fi
    else
        echo "Copy failed"
    fi
done
