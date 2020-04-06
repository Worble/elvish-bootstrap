# Bring in global funcs
use ./functions/shared func

# Declare Vars
packages-base = [ gvfs xarchiver alacritty firefox ufw git powerline-fonts-git openssh kate ]
packages-optional = [ filelight mpv youtube-dl keepassxc octopi-notifier-qt5 ]
packages-extra = [ nextcloud-client vscodium-bin ]

# Begin
install-gui = (func:y-n-loop "Install a GUI? y/N" "N")

# Gui
if (put $install-gui) {
    use ./gui
}

# Optional Packages
echo "Optional packages:" $@packages-optional
install-optional = (func:y-n-loop "Install all optional packages? Y/n" "Y")
if (eq $install-optional $false) {    
    packages-optional-new = []
    choose = (func:y-n-loop "Choose optional packages? Y/n" "Y")
    if (put $choose) {
        loop = $true
        while $loop {
            packages-optional-new = []
            for package $packages-optional {
                text = (echo "Install" $package"? Y/n")
                install-package = (func:y-n-loop $text "Y")
                if (put $install-package) {
                    packages-optional-new = [ $@packages-optional-new $package ]
                }
            }        
            echo "Installing: " $@packages-optional-new
            breakLoop = (func:y-n-loop "Is this ok? Y/n" "Y")
            if (put $breakLoop) {
                loop = $false
            }
        }
    }
    packages-optional = $packages-optional-new    
}

# Extra packages
echo "Extra packages:" $@packages-extra
install-extra = (func:y-n-loop "Install extra packages? y/N" "N")
if (put $install-extra) {
    packages-extra-new = []
    choose = (func:y-n-loop "Install all extra packages? y/N" "N")
    if (put $choose) {
        packages-extra-new = $packages-extra
    } else {
        loop = $true
        while $loop {
            packages-extra-new = []
            for package $packages-extra {
                text = (echo "Install" $package"? y/N")
                install-package = (func:y-n-loop $text "N")
                if (put $install-package) {
                    packages-extra-new = [ $@packages-extra-new $package ]
                }
            }        
            echo "Installing: " $@packages-extra-new
            breakLoop = (func:y-n-loop "Is this ok? Y/n" "Y")
            if (put $breakLoop) {
                loop = $false
            }
        }
    }
    packages-extra = $packages-extra-new
}

# Bluetooth
choose = (func:y-n-loop "Install bluetooth drivers? y/N" "N")
if (put $choose) {
    packages-base = [ $@packages-base blueman ]
}

yay -S $@packages-base $@packages-optional $@packages-extra --noconfirm --needed --quiet

# Ufw
if ?(! s== (echo sudo ufw status) "Status: active") {
    sudo ufw enable
    sudo systemctl enable ufw.service
}

# Alacritty
mkdir -p ~/.config/alacritty
echo "# Font configuration
font:
  normal:
    family: Space Mono for Powerline
    style: Normal" > ~/.config/alacritty/alacritty.yml

# Firefox
use ./firefox

# Packages Optional Setup

# mpv
for package $packages-optional {
    if (==s $package "mpv") {
        echo "Install high quality mpv config? (requires a beefy GPU) y/N"
        high-quality-mpv = (func:y-n-loop "Install high quality mpv config? (requires a beefy GPU) y/N" "N")
        if (put $high-quality-mpv) {
            mkdir -p ~/.config/mpv
            echo 'profile=gpu-hq
scale=ewa_lanczossharp
cscale=ewa_lanczossharp
video-sync=display-resample
interpolation
tscale=oversample' > ~/.config/mpv/mpv.conf 
        }
    }
}

# Packages Extra Setup

# vscodium
# TODO