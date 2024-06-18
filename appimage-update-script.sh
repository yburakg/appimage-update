#!/bin/bash
clear
main_menu () {
echo " "
echo "=== Select App for Update ==="
echo " "

cryptomator(){

wget https://cryptomator.org/downloads/linux/thanks/
version=`cat index.html | grep "download=" | cut -d '"' -f6`
wget $version
rm /home/$USER/cryptomator/cryptomator*
img=`ls -l | grep "cryptomator-*" | cut -d ' ' -f9`
mv $img /home/$USER/cryptomator/
rm index.html*
}

nextcloud(){

wget https://nextcloud.com/install/#install-clients
version=`cat index.html | grep unixOS | cut -d '"' -f6`
wget $version
rm /home/$USER/nextcloud/Nextcloud*
img=`ls -l | grep "Nextcloud*" | cut -d ' ' -f9`
mv $img /home/$USER/nextcloud/
rm index.html*
}

bleachbit(){
    
    wget https://www.bleachbit.org/download/linux -O bleachbit.txt
    deb=`cat bleachbit.txt | grep "Debian 12" | cut -d '"' -f4 | cut -d '=' -f2`
    version="bleachbit.org`cat bleachbit.txt | grep "Debian 12" | cut -d '"' -f4` -O $deb"
    wget $version
    rm /home/$USER/bleachbit/bleachbit_*
    img=` ls -l bleachbit_* | cut -d ':' -f2 | cut -d ' ' -f2`
    mv $img /home/$USER/bleachbit/
    rm bleachbit.txt
}

discord(){

curl -s --verbose https://discord.com/api/download?platform=linux | grep discord > discord.txt
version=`cat discord.txt | cut -d '>' -f3 | cut -d '<' -f1`
wget $version
rm /home/$USER/discord/discord-*
img=`ls -l | grep discord- | cut -d ':' -f2 | cut -d ' ' -f2`
mv $img /home/$USER/discord/
rm discord.txt
}

dropbox(){

curl -s https://www.dropbox.com/download?dl=packages/debian/dropbox_2024.01.22_amd64.deb > index.txt
version=`cat index.txt | grep https | cut -d ' ' -f7 | cut -d ';' -f1`
rm dropbox_*
wget $version
rm /home/$USER/dropbox/dropbox_*
img=`ls | grep dropbox_`
echo $img
mv $img /home/$USER/dropbox/
rm index.txt
}

freecad(){

wget https://www.freecad.org/downloads.php
version=`cat downloads.php | grep "x86_64 AppImage" | cut -d '"' -f8`
rm FreeCAD-*
wget $version
rm /home/$USER/freecad/FreeCAD*
img=`ls | grep FreeCAD*`
mv $img /home/$USER/freecad/
rm downloads.php*
}

google-earth(){

rm google-earth*
wget https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
rm /home/$USER/google-earth/google-earth*
img=`ls | grep google-earth`
mv $img /home/$USER/google-earth/
}

skype(){

wget https://go.skype.com/skypeforlinux-64.deb
img=`ls -l skype* | cut -d ':' -f2 | cut -d ' ' -f2`
rm /home/$USER/skype/skype*
mv $img /home/$USER/skype/
}

steam(){

wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
img=`ls -l steam* | cut -d ':' -f2 | cut -d ' ' -f2`
rm /home/$USER/steam/steam*
mv $img /home/$USER/steam/
}

sweethome3d(){

wget http://www.sweethome3d.com/download.jsp
tgz=`cat download.jsp | grep linux-x64 | cut -d "'" -f2 | uniq | cut -d '/' -f9`
version="`cat download.jsp | grep linux-x64 | cut -d "'" -f2 | uniq` -O $tgz"
wget $version
rm /home/$USER/sweethome3d/Sweet*
img=`ls -l Sweet* | cut -d ':' -f2 |  cut -d ' ' -f2`
mv $img /home/$USER/sweethome3d/
rm download.jsp
}

telegram(){

wget https://telegram.org/dl/desktop/linux -O tsetup.tar.xz
img=`ls -l tsetup* | cut -d ':' -f2 | cut -d ' ' -f2`
rm /home/$USER/Telegram/tsetup*
rm -r /home/$USER/Telegram/Telegram*
mv $img /home/$USER/Telegram/
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
