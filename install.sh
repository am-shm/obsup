#!/bin/bash

# configuring function
configuring (){
	if [[ -d "$HOME/.config" ]] ;then
		conf_path="$HOME/.config/obsup"
	else
		conf_path="$HOME/.obsup"
	fi
	mkdir $conf_path
	echo "Now lets configure obsup."
	echo "follow this steps:"
	echo "make your github repository then clone it anywhere you like then press Return"
	read entk
	printf "Enter your cloned repository that want to use as vault: "
	read vault_path
	echo $vault_path > $conf_path/vault_path
	touch $conf_path/obsup.log
	echo DONE!
	echo "Cron template also available in cron.template."
}

clear
echo """
  ___  ____ ____  _   _ ____  
 / _ \| __ ) ___|| | | |  _ \ 
| | | |  _ \___ \| | | | |_) |
| |_| | |_) |__) | |_| |  __/ 
 \___/|____/____/ \___/|_|

   .: github.com/am-shm :.

[ make you obsidian notes available everywhere ]

"""
sleep 2
echo "! Make sure that /usr/local/bin is in your PATH."
echo "Creating obsup binary in your machine..."
chmod +x ./obsup.sh
if [[ $? == 0 ]] ;then
	echo ""
else
	echo "Error while making obsup executable..."
	exit
fi
sudo cp ./obsup.sh /usr/local/bin/obsup
if [[ $? == 0 ]] ;then
	echo "Done."
else
	echo "Error while copying obsup file to your path..."
	exit
fi
echo ""
echo ""
configuring
