#!/bin/sh
# OrangeAudio Plugin Installer
# Version: 1.3
# Author: MNASR
#wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/OrangeAudio/refs/heads/main/installer.sh -O - | /bin/sh

echo ''

sleep 3s

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/OrangeAudio ]; then
echo "> removing previous package please wait..."
sleep 2s 
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/OrangeAudio > /dev/null 2>&1
fi

status='/var/lib/opkg/status'
package='enigma2-plugin-extensions-orangeaudio'

if grep -q $package $status; then
opkg remove $package > /dev/null 2>&1
fi

sleep 2s

echo "downloading OrangeAudio..."
wget -O  /var/volatile/tmp/OrangeAudio.tar.gz https://github.com/popking159/ssupport/raw/main/OrangeAudio.tar.gz
echo "Installing OrangeAudio..."
tar -xzf /var/volatile/tmp/OrangeAudio.tar.gz -C /
rm -rf /var/volatile/tmp/OrangeAudio.tar.gz > /dev/null 2>&1
sleep 2s

sync
echo "#########################################################"
echo "#########################################################"
#echo "Installing dependency files"
#opkg install python3-codecs python3-compression python3-core python3-difflib python3-json python3-requests python3-xmlrpc unrar python3-beautifulsoup4


# ============================================================================================================
sleep 2
sync
echo "==================================================================="
echo "===                          FINISHED                           ==="
echo "===                           MNASR                             ==="
echo "==================================================================="
sleep 2
echo "==================================================================="
echo "             Orange Audio update completed successfully!           "
echo "==================================================================="


exit 0
