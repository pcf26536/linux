# move config files
mv .zlogin ~/
mv kvantum.kvconfig ~/.config/Kvantum/
mv terminator_search.py ~/.config/terminator/plugins/
mv Terminator.desktop ~/.local/share/kservices5/ServiceMenus/
mv electron-flags.conf ~/.config/

# Remove unwanted packages
# gnome bluetooth
cp /usr/lib/libgnome-bluetooth-ui-* ~/
yay -Rdd --nodeps gnome-bluetooth-3.0
sudo cp ~/libgnome-bluetooth-ui-* /usr/lib/

# Enable Wayland on GDM rules with Nvidia
# /usr/lib/udev/rules.d/61-gdm.rules
sudo sed -i '/PreferredDisplayServer xorg/s/^/#/' /usr/lib/udev/rules.d/61-gdm.rules
sudo sed -i '/WaylandEnable false/s/^/#/' /usr/lib/udev/rules.d/61-gdm.rules
# /etc/gdm/custom.conf
sudo sed -i '/WaylandEnable=false/s/^/#/' /etc/gdm/custom.conf

# Enable fractional scaling
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer', 'kms-modifiers']"

# Append configurations to config files
# ~/.zshrc
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
