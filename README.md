<p align="center">
	<h1>OBSUP</h1>
</p>

# OveralView
Make your [Obsidian](https://obsidian.md/) notes available everywhere with gh repo.

# Obsidian Installation
To install Obsidian application on your linux machine you can use [this](https://github.com/am-shm/obsup/tree/main/installation). this instruction install Obsidian as application, not just executable ```.AppImage``` file.

# Desciption
To install obsup just do these:

	1. git clone https://github.com/am-shm/obsup
	2. cd obsup
	3. chmod +x install.sh
	4. ./install.sh

after installing you can manually update by this command ```obsup```.

# Using cronJob
also cron template is available to automate updating. you can use **cron.template** to update and upload your vault every 30 min, or edit to time you want.
just run **cat cron.template | tail -1** and copy it to ```/etc/crontab```.
