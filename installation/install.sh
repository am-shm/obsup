#!/bin/bash

LINK="https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.9/Obsidian-1.1.9.AppImage"
WD=$(pwd)

clear
echo "OBSIDIAN INSTALLATION"
echo ""
printf "Check your connection and press Return..."
read consub
echo "Downloading Obsidian AppImage in /tmp ..."
cd /tmp
wget $LINK
echo ""

if [[ $? == "0" ]] ;then
	echo "Done!"
	chmod +x /tmp/Obsidian-1.1.9.AppImage
else
	echo "Error while downloading Obsidian appImage, you can download it manually from $LINK."
	exit
fi

cd $WD
echo "Making desktop entry for Obsidian..."
sudo mkdir /usr/local/Obsidian
echo "Copying binary..."
sudo cp /tmp/Obsidin-1.1.9.AppImage /usr/local/bin/obsidian
echo "Copying icon..."
sudo cp ./obsidian_logo.png /usr/local/Obsidian
echo "Copying desktop entry..."
cp ./Obsidian.desktop $HOME/.local/share/applications ; chmod +x $HOME/.local/share/applications/Obsidian.desktop
if [[ -d $HOME/Desktop ]] ;then
	echo "Making desktop shortcut..."
	cp ./Obsidian.desktop $HOME/Desktop ; chmod +x $HOME/.local/share/applications/Obsidian.desktop
fi

echo "DONE."
