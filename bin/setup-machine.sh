#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi


adduser --disabled-password --gecos '' ikhor
usermod -aG sudo ikhor
echo 'ikhor ALL=NOPASSWD: ALL' > /etc/sudoers.d/ikhor_nopasswd

curl https://raw.githubusercontent.com/IsaacKhor/dotfiles/refs/heads/master/bin/install-dotfiles.sh > /tmp/install_dotfiles.sh
su -c 'bash /tmp/install_dotfiles.sh' - ikhor

