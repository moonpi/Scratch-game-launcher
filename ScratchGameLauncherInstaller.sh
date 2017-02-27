#!/bin/bash

LAUNCHER_DIR="/opt/kano/scratch-game-launcher"

delete()
{  
	read key

	case $key in
	[yY][eE][sS]|[yY]|"")
		sudo rm -rf $1
		echo -e "\nDelete $1 complete!\n" 
	;;
	*)
	exit
	;;
	esac
}

#Update source-list of dependencies
echo -e "====================================\n"
echo -e "\n Updating source lists to download dependencies ... \n Please check your internet connection! \n"
echo -e "====================================\n"
sleep 2
sudo apt-get update 

if test -d $LAUNCHER_DIR;
then
  	echo  -e "\n[Scratch Game Launcher installer] It looks like you've already got the Scratch Game Launcher installed."
  	echo  -e "\n[Scratch Game Launcher installer] You'll need to remove $LAUNCHER_DIR to install."
  	echo  -e "\nWould you like to remove [Scratch Game Launcher installer] directory[Y/n]?"
	delete $LAUNCHER_DIR ;
fi

echo -e "[Scratch Game Launcher installer] Installing Midori ..."
sudo apt-get -y install midori
echo -e "[Scratch Game Launcher installer] Installing JoyPad Config tool ..."
sudo apt-get -y install qjoypad

echo  -e "\nInstalling git ...\n"
sudo apt-get -y install git

echo -e "\n[Scratch Game Launcher installer] Installing desktop icons."
sudo mkdir -p $LAUNCHER_DIR
sudo git clone git://github.com/punkbass/Scratch-game-launcher.git $LAUNCHER_DIR

# Epic Ninja
sudo cp $LAUNCHER_DIR/epic-ninja.desktop /usr/share/applications

if test -e ~/Desktop/epic-ninja.desktop; 
then
	echo -e "\n~/Desktop/epic-ninja.desktop file exists!\nDo you want to remove it[y/n]?"
	delete ~/Desktop/epic-ninja.desktop;	
fi
	
sudo ln -s $LAUNCHER_DIR/epic-ninja.desktop ~/Desktop/epic-ninja.desktop
sudo chmod +x ~/Desktop/epic-ninja.desktop
sudo chown $(whoami) ~/Desktop/epic-ninja.desktop

sudo cp $LAUNCHER_DIR/epic-ninja.desktop /usr/share/applications

# Geometry Jump
if test -e ~/Desktop/geometry-jump.desktop; 
then
	echo -e "\n~/Desktop/geometry-jump.desktop file exists!\nDo you want to remove it[y/n]?"
	delete ~/Desktop/geometry-jump.desktop;	
fi
	
sudo ln -s $LAUNCHER_DIR/geometry-jump.desktop ~/Desktop/geometry-jump.desktop
sudo chmod +x ~/Desktop/geometry-jump.desktop
sudo chown $(whoami) ~/Desktop/geometry-jump.desktop

echo -e "\n[Scratch Game Launcher installer] Installing controller configurations."
sudo mkdr /home/pi/.qjoypad3

cd /home/pi/.qjoypad3
sudo wget https://github.com/punkbass/Scratch-game-launcher/raw/master/Epic-Ninja.lyt
sudo wget https://github.com/punkbass/Scratch-game-launcher/raw/master/FOIL-Mario.lyt


sleep  2
echo -e "\nComplete!\n"

echo -e "\nEverything done! \n"
