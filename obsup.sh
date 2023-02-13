#!/bin/bash

# PLEASE READ README.md FIRST.

updated="nothing to commit, working tree clean"
status="good"
conf_dir_err="Error, config dir not found. Please run installation script again."
if [[ -d $HOME/.obsup ]] ;then
	conf_dir="$HOME/.obsup"
elif [[ -d $HOME/.config/obsup ]] ;then
	conf_dir="$HOME/.config/obsup"
else
	status="bad"
fi

app () {
	echo "Config directory is: $conf_dir"
	echo "Vault directory is: $confdir/vault_path"
	cd $(cat $confdir/vault_path)
	echo "[$(date "+%D %T")] pulling" >> $conf_dir/obsup.log
	git pull >> $conf_dir/obsup.log
	echo DONE >> $conf_dir/obsup.log
	up_stat=$(git status | tail -1)
	if [[ $up_stat == $updated ]] ;then
		echo "[$(date "+%D %T")] already uploaded" >> $conf_dir/obsup.log
	else
		git add -A >> $conf_dir/obsup.log
		git commit -m "commited" >> $conf_dir/obsup.log
		git push >> $conf_dir/obsup.log
	fi		
}

if [[ $status == "good" ]] ;then
	app
else
	echo $conf_dir_err
	exit
fi

