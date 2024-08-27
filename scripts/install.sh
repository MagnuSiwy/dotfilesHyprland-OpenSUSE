# Install basic apps needed for the config to work as intended
#
APPS_TO_INSTALL="hyprland hyprpaper hypridle hyprlock xwayland grim slurp wl-clipboard kitty kitty-shell-integration mako xdg-desktop-portal-hyprland polkit-gnome pavucontrol ranger waybar qt6ct libqt5-qtwayland qt6-wayland nwg-look blueman bluez 7zip rofi-wayland pipewire wireplumber calcurse"

echo $APPS_TO_INSTALL 
echo "All of these are needed for the config to work properly"
echo "If you don't agree stop the script with CTRL + c"

sudo zypper in --no-recommends $APPS_TO_INSTALL

# Link the config files to the $HOME/.config/ folder and the appearance stuff to $HOME/

DOTFILES_LOCATION=$(find ~/ -name "dotfilesHyprland" -type d 2>/dev/null)


echo "Linking the config files..."

for link in $DOTFILES_LOCATION/config/*
do
    ln -s $link $HOME/.config/
done


echo "Linking the appearance directories..."

for link in $DOTFILES_LOCATION/appearance/.*
do
    ln -s $link $HOME/
done
