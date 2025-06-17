
#!/bin/sh

# Orange Audio Plugin Installer
# Version: 1.2
# Author: MNASR
#wget -q "--no-check-certificate" https://raw.githubusercontent.com/popking159/OrangeAudio/refs/heads/main/installer.sh -O - | /bin/sh

# Plugin files
PACKAGE_URL="https://raw.githubusercontent.com/popking159/OrangeAudio/main/OrangeAudio.tar.gz"
TMP_DIR="/tmp/orangeaudio_update"
INSTALL_DIR="/usr/lib/enigma2/python/Plugins/Extensions"

# Create temp directory
mkdir -p $TMP_DIR

# Download package
echo "Downloading Orange Audio update..."
wget -q $PACKAGE_URL -O $TMP_DIR/OrangeAudio.tar.gz

# Check download
if [ $? -ne 0 ]; then
    echo "Error: Failed to download package!"
    rm -rf $TMP_DIR
    exit 1
fi

# Backup current version
echo "Backing up current version..."
tar -czf $TMP_DIR/OrangeAudio_backup.tar.gz -C $INSTALL_DIR OrangeAudio 2>/dev/null

# Install new version
echo "Installing new version..."
tar -xzf $TMP_DIR/OrangeAudio.tar.gz -C $INSTALL_DIR

# Check installation
if [ $? -ne 0 ]; then
    echo "Error: Installation failed! Restoring backup..."
    tar -xzf $TMP_DIR/OrangeAudio_backup.tar.gz -C $INSTALL_DIR --no-same-owner --preserve-permissions
    rm -rf $TMP_DIR
    exit 1
fi

# Clean up
echo "Cleaning up..."
rm -rf $TMP_DIR

# Restart Enigma2
echo "Restarting Enigma2..."
init 4
sleep 2
init 3

echo "Orange Audio update completed successfully!"
exit 0
