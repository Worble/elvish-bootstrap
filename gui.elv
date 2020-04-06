# Bring in global funcs
use ./functions/shared func
use str

# Vars
packages-shared = [ xorg-server xorg-apps sddm qt5-graphicaleffects ]
packages-qt = [ lxqt breeze-icons xscreensaver libpulse libstatgrab libsysstat lm_sensors lxqt-connman-applet sddm-config-editor-git adwaita-icon-theme wpa_supplicant ]

# Funcs
fn setup-plasma {
    func:tty-echo "Installing Plasma"
    func:tty-echo "TODO: Plasma install"
}

fn setup-lxqt {
    func:tty-echo "Installing LXQt"
    yay -S $@packages-qt $@packages-shared --noconfirm --needed --quiet --noprogressbar

    error = ?(sudo systemctl stop NetworkManager)
    error = ?(sudo systemctl disable NetworkManager)
    sudo systemctl enable connman
    sudo systemctl start connman

    connmanctl enable wifi

    use ./lxqt/panel
    use ./lxqt/config
    use ./lxqt/session
    use ./lxqt/notifications
    use ./lxqt/pcmanfm
}

fn setup-sddm {
    func:tty-echo "Setting up SDDM"

    # Enable
    sudo systemctl enable sddm
    
    # Set Theme
    if (not ?(test -d /usr/share/sddm/themes/slice)) {
       temp-dir = (mktemp -d)
        cd $temp-dir
        git clone https://github.com/RadRussianRus/sddm-slice.git
        sudo cp -r sddm-slice/slice /usr/share/sddm/themes/slice        
        cd ~
        rm -rf $temp-dir 
    } 

    echo "[Theme]
Current=slice" | sudo tee /etc/sddm.conf > /dev/null
}

fn get-xorg-driver {
    loop = $true
    while $loop {
        func:tty-echo "Choose XOrg video driver"
        drivers = [ xf86-video-amdgpu xf86-video-ati xf86-video-intel xf86-video-nouveau nvidia nvidia-390xx "None (Install Later)"]
        func:tty-echo (echo "Drivers:" $@drivers)
        input = (func:read-input "")
        if (or (==s (str:to-lower $input) "none") (==s (str:to-lower $input) "none (install later)")) {
            put ""
            return
        }
        for driver $drivers {
            if (==s (str:to-lower $input) $driver) {
                put $input
                return
            }
        }
        func:tty-echo "Please choose one of the drivers in the list"
    }
}

# Begin Script
driver = (get-xorg-driver)
if ?( ! ==s $driver "") {
    packages-shared = [ $@packages-shared $driver ]
}

loop = $true
while $loop {
    func:tty-echo "Which GUI to install? [LXQt Plasma]"
    input = (func:read-input "")
    if (==s (str:to-lower $input) "lxqt") {        
        setup-lxqt
        loop = $false
    } elif (==s (str:to-lower $input) "plasma") {
        setup-plasma
        loop = $false
    } else {
        func:tty-echo "Please respond LXQt or Plasma"
    }
}

setup-sddm