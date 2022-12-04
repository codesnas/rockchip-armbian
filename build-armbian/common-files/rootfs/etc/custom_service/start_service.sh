#!/bin/bash
#========================================================================================
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.
#
# This file is a part of the Armbian for rockchip boxes
# https://github.com/ophub/rockchip-armbian
#
# Function: Customize the startup script, adding content as needed
# Dependent script: /etc/rc.local
# File path: /etc/custom_service/start_service.sh
#
#========================================================================================

# Start ssh service
[[ -d "/var/run/sshd" ]] || mkdir -p -m0755 /var/run/sshd
[[ -f "/etc/init.d/ssh" ]] && sleep 5 && /etc/init.d/ssh restart 2>/dev/null

# Add custom log
echo "[$(date +"%Y.%m.%d.%H%M")] Hello World..." >/tmp/ophub_start_service.log
