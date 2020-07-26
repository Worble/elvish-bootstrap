echo "Setting up pacman"

sudo sed "s/#Color/Color/g"  /etc/pacman.conf -i
sudo sed "s/#TotalDownload/TotalDownload/g"  /etc/pacman.conf -i
sudo sed "s/#VerbosePkgLists/VerbosePkgLists/g"  /etc/pacman.conf -i