#!/bin/bash

# Create symlink to $HOME/.config directory

#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo "Run this with sudo."
    exit 0
fi

if [[ -z $SUDO_USER ]]; then
    echo "Run this with sudo as regular user, not root."
    exit 0
fi

PROJECT_DIR=$(dirname $(realpath $0))
I3_DIR=/home/$SUDO_USER/.config/i3
POLYBAR_DIR=/home/$SUDO_USER/.config/polybar 
ACPI_DIR_EVENTS=/etc/acpi/events
ACPI_DIR_HANDLERS=/etc/acpi/handlers

create_config_symlinks() {
    echo -e "\nCreating config symlinks..."
    
    ln -s $PROJECT_DIR/i3 $I3_DIR 
    ln -s $PROJECT_DIR/polybar $POLYBAR_DIR
    ln -s $PROJECT_DIR/acpi/events/* $ACPI_DIR_EVENTS/
    ln -s $PROJECT_DIR/acpi/handlers/* $ACPI_DIR_HANDLERS/

}


#install_dependencies() {
#    echo -e "\nInstalling dependencies..."
#    pacman -Syu autorandr \
#	        flameshot \
#    		nitrogen \
#		i3 \
#
#}


create_config_symlinks
#install_dependencies

echo "DONE!"
