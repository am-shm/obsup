#!/bin/bash

LINK="https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.9/Obsidian-1.1.9.AppImage"

clear
echo "OBSIDIAN INSTALLATION \n"
printf "Check your connection and press Return..."
read consub
echo "Downloading Obsidian AppImage in /tmp ..."
cd /tmp
wget $LINK
echo ""
if [[ $? == "0" ]] ;then
	echo "Done!"
else
	echo "Error while downloading Obsidian appImage, you can download it manually from $LINK."
	exit
fi
echo "Making desktop entry for Obsidian..."
sudo mkdir /usr/local/Obsidian
echo "Copying binary..."
sudo cp /tmp/Obsidian-1.1.9.AppImage /usr/local/bin/obsidian
echo "Copying icon..."
sudo cp ./obsidian_logo.png /usr/local/Obsidian
echo "Copying desktop entry..."
cp ./Obsidian.desktop $HOME/.local/share/applications
if [[ -d $HOME/Desktop ]] ;then
	echo "Making desktop shortcut..."
	cp ./Obsidian.desktop $HOME/Desktop
fi

echo "DONE."
