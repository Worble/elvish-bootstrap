echo "Setting up pacman"

sudo sed "s/#Color/Color/g" /etc/pacman.conf -i
sudo sed "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf -i
sudo sed "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf -i

sudo mkdir -p /etc/pacman.d/hooks/
echo '[Trigger]
Operation = Upgrade
Type = Package
Target = pacman-mirrorlist

[Action]
Description = Updating pacman-mirrorlist with reflector and removing pacnew...
When = PostTransaction
Depends = reflector
Exec = /bin/sh -c "reflector --country ''United Kingdom'' --latest 200 --age 24 --sort rate --save /etc/pacman.d/mirrorlist; rm -f /etc/pacman.d/mirrorlist.pacnew"' | sudo tee /etc/pacman.d/hooks/mirrorupgrade.hook > /dev/null