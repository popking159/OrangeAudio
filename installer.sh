#!/bin/sh
# OrangeAudio Plugin Installer
# Version: 1.3
# Author: MNASR

echo 'Starting installation...'

sleep 3

# Remove existing installation
if [ -d /usr/lib/enigma2/python/Plugins/Extensions/OrangeAudio ]; then
    echo "> Removing previous installation..."
    rm -rf /usr/lib/enigma2/python/Plugins/Extensions/OrangeAudio
fi

# Remove via opkg if installed
status='/var/lib/opkg/status'
package='enigma2-plugin-extensions-orangeaudio'
if grep -q "$package" "$status"; then
    echo "> Removing opkg package..."
    opkg remove "$package"
fi

sleep 2  # Fixed sleep syntax

# Download and install
echo "> Downloading OrangeAudio..."
wget -q --show-progress -O /tmp/OrangeAudio.tar.gz \
    "https://github.com/popking159/ssupport/raw/main/OrangeAudio.tar.gz"

if [ $? -ne 0 ]; then
    echo "ERROR: Download failed!"
    exit 1
fi

echo "> Installing..."
tar -xzf /tmp/OrangeAudio.tar.gz -C /
if [ $? -ne 0 ]; then
    echo "ERROR: Extraction failed!"
    exit 1
fi

rm -f /tmp/OrangeAudio.tar.gz
sleep 2

sync
echo "========================================================="
echo "===                      FINISHED                     ==="
echo "===                       MNASR                       ==="
echo "========================================================="
echo "       Orange Audio installed successfully!              "
echo "========================================================="

exit 0