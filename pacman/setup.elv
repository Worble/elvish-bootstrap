fn setup [ reflector ]{
    echo "Setting up pacman"

    sudo sed "s/#Color/Color/g" /etc/pacman.conf -i
    sudo sed "s/#TotalDownload/TotalDownload/g" /etc/pacman.conf -i
    sudo sed "s/#VerbosePkgLists/VerbosePkgLists/g" /etc/pacman.conf -i

    sudo mkdir -p /etc/pacman.d/hooks/

    if (put $reflector) {
        hook = (dirname (src)[name])'/mirrorupgrade.hook'
        sudo cp $hook /etc/pacman.d/hooks/mirrorupgrade.hook
    }
}