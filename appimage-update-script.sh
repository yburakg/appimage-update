#!/bin/bash

# -------------------------------------------
# my "appimage-update" script
# -------------------------------------------
# https://github.com/yburakg/appimage-update
# -------------------------------------------
# Y. Burak GÜLER - 2024
# -------------------------------------------

clear
main_menu () {
echo " "
echo "=== Select App for Update ==="
echo " "

mkdir -p /home/$USER/appimages

cryptomator(){
mkdir -p /home/$USER/appimages/cryptomator
wget https://cryptomator.org/downloads/linux/thanks/
version=`cat index.html | grep "download=" | cut -d '"' -f6`
wget $version
rm /home/$USER/appimages/cryptomator/cryptomator*
img=`ls -l | grep "cryptomator-*" | cut -d ' ' -f9`
mv $img /home/$USER/appimages/cryptomator/
rm index.html*
}

nextcloud(){

mkdir -p /home/$USER/appimages/nextcloud
wget https://nextcloud.com/install/#install-clients
version=`cat index.html | grep unixOS | cut -d '"' -f4`
wget $version
rm /home/$USER/appimages/nextcloud/Nextcloud*
img=`ls -l | grep "Nextcloud*" | cut -d ' ' -f10`
mv $img /home/$USER/appimages/nextcloud/
rm index.html*
}

bleachbit(){
    mkdir -p /home/$USER/appimages/bleachbit
    wget https://www.bleachbit.org/download/linux -O bleachbit.txt
    deb=`cat bleachbit.txt | grep "Debian 12" | cut -d '"' -f4 | cut -d '=' -f2`
    version="bleachbit.org`cat bleachbit.txt | grep "Debian 12" | cut -d '"' -f4` -O $deb"
    wget $version
    rm /home/$USER/appimages/bleachbit/bleachbit_*
    img=` ls -l bleachbit_* | cut -d ':' -f2 | cut -d ' ' -f2`
    mv $img /home/$USER/appimages/bleachbit/
    rm bleachbit.txt
}

discord(){
mkdir -p /home/$USER/appimages/discord
curl -s --verbose https://discord.com/api/download?platform=linux | grep discord > discord.txt
version=`cat discord.txt | cut -d '>' -f3 | cut -d '<' -f1`
wget $version
rm /home/$USER/appimages/discord/discord-*
img=`ls -l | grep discord- | cut -d ':' -f2 | cut -d ' ' -f2`
mv $img /home/$USER/appimages/discord/
rm discord.txt
}

dropbox(){
mkdir -p /home/$USER/appimages/dropbox
curl -s https://www.dropbox.com/download?dl=packages/debian/dropbox_2024.01.22_amd64.deb > index.txt
version=`cat index.txt | grep https | cut -d ' ' -f7 | cut -d ';' -f1`
rm dropbox_*
wget $version
rm /home/$USER/appimages/dropbox/dropbox_*
img=`ls | grep dropbox_`
echo $img
mv $img /home/$USER/appimages/dropbox/
rm index.txt
}

freecad(){
mkdir -p /home/$USER/appimages/freecad
wget https://www.freecad.org/downloads.php
version=`cat downloads.php | grep "x86_64 AppImage" | cut -d '"' -f8`
rm FreeCAD-*
wget $version
rm /home/$USER/appimages/freecad/FreeCAD*
img=`ls | grep FreeCAD*`
mv $img /home/$USER/appimages/freecad/
rm downloads.php*
}

google-earth(){
mkdir -p /home/$USER/appimages/google-earth
rm google-earth*
wget https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
rm /home/$USER/appimages/google-earth/google-earth*
img=`ls | grep google-earth`
mv $img /home/$USER/appimages/google-earth/
}

skype(){
mkdir -p /home/$USER/appimages/skype
wget https://go.skype.com/skypeforlinux-64.deb
#img=`ls -l skype* | cut -d ':' -f2 | cut -d ' ' -f2`
img=`ls skype*`
rm /home/$USER/appimages/skype/skype*
mv $img /home/$USER/appimages/skype/
}

steam(){
mkdir -p /home/$USER/appimages/steam
wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
img=`ls -l steam* | cut -d ':' -f2 | cut -d ' ' -f2`
rm /home/$USER/appimages/steam/steam*
mv $img /home/$USER/appimages/steam/
}

sweethome3d(){
mkdir -p /home/$USER/appimages/sweethome3d
wget http://www.sweethome3d.com/download.jsp
tgz=`cat download.jsp | grep linux-x64 | cut -d "'" -f2 | uniq | cut -d '/' -f9`
version="`cat download.jsp | grep linux-x64 | cut -d "'" -f2 | uniq` -O $tgz"
wget $version
rm /home/$USER/appimages/sweethome3d/Sweet*
img=`ls -l Sweet* | cut -d ':' -f2 |  cut -d ' ' -f2`
mv $img /home/$USER/appimages/sweethome3d/
rm download.jsp
}

telegram(){
mkdir -p /home/$USER/appimages/Telegram
wget https://telegram.org/dl/desktop/linux -O tsetup.tar.xz
img=`ls -l tsetup* | cut -d ':' -f2 | cut -d ' ' -f2`
rm /home/$USER/appimages/Telegram/tsetup*
rm -r /home/$USER/appimages/Telegram/Telegram*
mv $img /home/$USER/appimages/Telegram/
}

options=(

"Cryptomator"
"Nextcloud"
"BleachBit"
"Discord"
"Dropbox"
"FreeCAD"
"Google Earth"
"Skype"
"Steam"
"Sweet Home 3D"
"Telegram"
"UPDATE ALL"
"Exit"

)

select menu in "${options[@]}";do
    case $menu in
    ${options[0]})
clear
        cryptomator
        break
        ;;
    ${options[1]})
clear
        nextcloud
        break
        ;;
    ${options[2]})
clear
        bleachbit
        break
        ;;
    ${options[3]})
clear
		discord
		break
		;;
	${options[4]})
clear
		dropbox
		break
		;;
	${options[5]})
clear
		freecad
		break
		;;
	${options[6]})
clear
        google-earth
        break
        ;;
    ${options[7]})
clear
        skype
        break
        ;;
    ${options[8]})
clear
        steam
        break
        ;;
    ${options[9]})
clear
        sweethome3d
        break
        ;;
    ${options[10]})
clear
        telegram
        break
        ;;
    ${options[11]})
clear
		cryptomator
		nextcloud
		bleachbit
		discord
		dropbox
		freecad
        google-earth
        skype
        steam
        sweethome3d
        telegram
		break
		;;
	${options[12]})
clear
echo "Exited the program"
        exit
        ;;
        *)
            echo "Please Select App for Update"
    ;;
esac
done
}
main_menu
