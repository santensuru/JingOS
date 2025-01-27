#!/bin/bash
# This file is part of the https://github.com/Maxximo88
# Copyright (c) 2022 Carofano Massimo Antonio
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
echo -e "\e[1;34m=====================================\e[0m"
echo -e "\e[1;34mSystem analysis..\e[0m"
echo -e "\e[1;34m=====================================\e[0m"
DISTRO=$(lsb_release -i | cut -f 2-)
if [ $DISTRO == "Jingos" ]; then
	echo "You are running $DISTRO "
else
	echo -e "\e[1;31mThis script is not compatible with ($DISTRO)\e[0m"
	exit
fi
echo -e "\e[1;34m=====================================\e[0m"
echo 'Follow me on Caroblog.it and Twitter @Maxximo88'
echo -e "\e[1;34m=====================================\e[0m"
echo ''
PS3='What is your plan? '
options=("Install Android environment" "Install basic Android Apps" "Install GNU/Linux proposed software" "Fix Snap App shortcut for JingOS Desktop" "Clean Distro" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Install Android environment")
			sudo apt update
			sudo apt install android-compatible-env
			sudo apt install japm
			sudo systemctl enable android-compatible-env --now
			echo ''
			clear
			echo -e "\e[1;34mOk, the Android compatibility for JingPad A1 is now installed and ready to work!\e[0m"
			echo -e "\e[1;34mI suggest to reboot your device\e[0m"
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Fix Snap App shortcut for JingOS Desktop; 5.Clean Distro; 6.Quit\e[0m"
		;;
		"Install basic Android Apps")
			echo 'Credit to Cooper eqixcx'
			#Cooper eqixcx development brench: https://github.com/eqixcx/JingPad-A1-Scripts/blob/main/install-android-env.sh
			sudo apt install wget
			echo 'Install F-Droid'
			wget "https://f-droid.org/F-Droid.apk" -O ./fdroid.apk
			sudo japm install -i ./fdroid.apk
			echo 'Install Aurora Store'
			wget "https://files.auroraoss.com/AuroraStore/Nightly/AuroraStore-nightly-signed-"$(date +%Y%m%d -u)"0000.apk" -O ./aurora.apk
			sudo japm install -i ./aurora.apk
			echo 'Install Amaze File Manager'
			wget "https://github.com/TeamAmaze/AmazeFileManager/releases/download/v3.6.7/app-fdroid-release.apk" -O ./file.apk
			sudo japm install -i ./file.apk
			echo 'Install Open Board'
			wget "https://github.com/dslul/openboard/releases/download/v1.4.3/app-release.apk" -O ./keyboard.apk
			sudo japm install -i ./keyboard.apk
			clear
			echo -e "\e[1;34m=====================================\e[0m"
			echo ''
			echo -e "\e[1;34mWhat do you want to do now?\e[0m"
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Fix Snap App shortcut for JingOS Desktop; 5.Clean Distro; 6.Quit\e[0m"
		;;		
		"Install GNU/Linux proposed software")
			sudo apt update
			sudo apt install -y apt-transport-https apt-xapian-index audacity bleachbit blender bluefish chafa deborphan dirmngr desktop-file-utils
			echo -e "\e[1;34m1/5 Apps installed..\e[0m"
			sudo apt install -y evince filezilla gdebi gimp rawtherapee gedit git hardinfo htop ifuse inkscape inxi kdenlive krita libdvd-pkg
			echo -e "\e[1;34m2/5 Apps installed..\e[0m"
			sudo apt install -y libgtk3-perl libreoffice libreoffice-gtk3 libreoffice-kde5 libreoffice-style-sifr nautilus neofetch
			echo -e "\e[1;34m3/5 Apps installed..\e[0m"
			sudo apt install -y openjdk-8-jre openscad openshot python3 rhythmbox snapd systemsettings software-properties-common software-properties-gtk
			echo -e "\e[1;34m4/5 Apps installed..\e[0m"
			sudo apt install -y synaptic stacer tasksel thunderbird ttf-mscorefonts-installer vlc wget ufw gufw
			echo -e "\e[1;34mAll Apps are now installed..\e[0m"
			sudo dpkg-reconfigure libdvd-pkg
			sudo apt install -f
			clear
			neofetch
			inxi
			echo -e "\e[1;34mNeofetch and inxi are pretty nice\e[0m"
			echo -e "\e[1;34m=====================================\e[0m"
			echo ''
			echo -e "\e[1;34mI have to enable the UFW firmware now..\e[0m"
			sudo ufw enable
			sudo ufw allow ssh
			sudo ufw status
			echo -e "\e[1;34mPerfect, the UFW firmware is properly running!\e[0m"
			echo ''
			echo -e "\e[1;34mWhat do you want to do now?\e[0m"
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Fix Snap App shortcut for JingOS Desktop; 5.Clean Distro; 6.Quit\e[0m"
		;;
		"Fix Snap App shortcut for JingOS Desktop")
			echo -e "\e[1;34mLet me see if Snapd is properly installed\e[0m"
			sudo apt update && sudo apt install snapd
			sudo snap install core
			echo -e "\e[1;34mLet me fix Snap Apps shortcut for JingOS desktop\e[0m"
			sudo cp -n /var/lib/snapd/desktop/applications/*.desktop /usr/share/applications
			sudo mv /var/lib/snapd/desktop/applications /var/lib/snapd/desktop/__applications
			sudo ln -s /usr/share/applications /var/lib/snapd/desktop/applications
			sudo snap install snap-store
			echo 'Creating desktop Snap apps shortcut..'
			echo -e "\e[1;34mOk, done. Remember that you have to run this point just once!\e[0m"
			echo ''
			echo -e "\e[1;34mWhat do you want to do now?\e[0m"
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Fix Snap App shortcut for JingOS Desktop; 5.Clean Distro; 6.Quit\e[0m"
		;;
		"Clean Distro")
			echo ''
			echo -e "\e[1;34mVerify packages\e[0m"
			echo ''
			sudo apt update
			sudo apt install -f
			echo ''
			echo -e "\e[1;34mRemove unuseful dependencies\e[0m"
			echo ''
			sudo apt --purge autoremove
			echo ''
			echo -e "\e[1;34mRemove obsolete packages\e[0m"
			echo ''
			sudo apt autoclean
			echo ''
			echo -e "\e[1;34mRemove obsolete downloaded packages\e[0m"
			echo ''
			sudo apt clean
			echo ''
			clear
			echo -e "\e[1;34m=====================================\e[0m"
			echo ''
			echo -e "\e[1;34mWhat do you want to do now?\e[0m"
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Fix Snap App shortcut for JingOS Desktop; 5.Clean Distro; 6.Quit\e[0m"
		;;
		"Quit")
			echo -e "\e[1;34mRemember to follow me on Caroblog.it and Twitter @Maxximo88\e[0m"
			echo ''
			break
		;;
		*) echo invalid option;;
	esac
done
