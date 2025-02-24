#!/bin/bash
set -xeuo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

deluser --remove-home ikhor || true
adduser --disabled-password --gecos '' ikhor
usermod -aG sudo ikhor
echo 'ikhor ALL=NOPASSWD: ALL' > /etc/sudoers.d/ikhor_nopasswd
curl https://raw.githubusercontent.com/IsaacKhor/dotfiles/refs/heads/master/bin/setup_dotfiles.bash | su -c 'bash' - ikhor
curl https://raw.githubusercontent.com/IsaacKhor/dotfiles/refs/heads/master/bin/linux_packages.bash | su -c 'bash' - ikhor

