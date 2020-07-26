# Bring in global funcs
use ./functions/shared func

# Declare Vars
# packages-extra-fonts = [ ttf-recursive ]
packages-base = [ vi vim nano base-devel ripgrep hunspell hunspell-en_GB hunspell-en_US gvfs ark lrzip lzop p7zip unarchiver unrar alacritty firefox ufw gufw git openssh kate pulseaudio pulseaudio-alsa alsa-utils inetutils ttf-liberation ttf-ubuntu-font-family ttf-dejavu adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts ttf-jetbrains-mono grc tmux ]
packages-optional = [ deadbeef filelight mpv youtube-dl keepassxc octopi-notifier-qt5 okular fsearch-git ]
packages-extra = [ nextcloud-client vscodium-bin baka-mplayer qbittorrent thunderbird protonmail-bridge-bin libreoffice-fresh ]

# Begin
install-gui = (func:y-n-loop "Install a GUI? y/N" "N")

# Gui
chosen-gui = ""
if (put $install-gui) {
    use ./gui gui
    chosen-gui = (gui:setup)
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
            echo "Installing:" $@packages-extra-new
            breakLoop = (func:y-n-loop "Is this ok? Y/n" "Y")
            if (put $breakLoop) {
                loop = $false
            }
        }
    }
    packages-extra = $packages-extra-new
} else {
    packages-extra = []
}

# Bluetooth
bluetooth = (func:y-n-loop "Install bluetooth drivers? y/N" "N")
if (put $bluetooth) {
    packages-bluetooth = [ pulseaudio-bluetooth bluez bluez-utils ]
    if (==s $chosen-gui "lxqt") {
        packages-bluetooth = [ $@packages-bluetooth blueman ]
    }
    packages-base = [ $@packages-base $@packages-bluetooth ]
}

# Japanese IME
install-japanese-ime = (func:y-n-loop "Install Japanese IME? y/N" "N")
if (put $install-japanese-ime) {
    packages-base = [ $@packages-base fcitx-mozc ]
}

# Development
setup-programming-langs = (func:y-n-loop "Setup programming languages? y/N" "N")
langs-to-install = []
if (put $setup-programming-langs) {
    langs = [ node csharp rust python java ]
    loop = $true
    while $loop {
        langs-to-install = []
        for lang $langs {
            text = (echo "Install" $lang"? y/N")
            add-lang = (func:y-n-loop $text "N")
            if (put $add-lang) {
                langs-to-install = [ $@langs-to-install $lang ]
            }
        }
        echo "Installing:" $@langs-to-install
        breakLoop = (func:y-n-loop "Is this ok? Y/n" "Y")
        if (put $breakLoop) {
            loop = $false
        }
    }
}

for lang $langs-to-install {
    if (==s $lang "node") {
        packages-base = [ $@packages-base nodejs npm ]
        mkdir -p ~/.npm-packages
        echo 'prefix=${HOME}/.npm-packages' > ~/.npmrc        
    }
    if (==s $lang "chsarp") {
        packages-base = [ $@packages-base dotnet-sdk ]
    }
    if (==s $lang "rust") {
        packages-base = [ $@packages-base rustup ]
    }
    if (==s $lang "python") {
        packages-base = [ $@packages-base python python-pip  ]
    }
    if (==s $lang "java") {
        packages-base = [ $@packages-base jre-openjdk ]
    }
}

# mpv
high-quality-mpv = $false
for package $packages-optional {
    if (==s $package "mpv") {
        high-quality-mpv = (func:y-n-loop "Install high quality mpv config? (requires a beefy GPU) y/N" "N")
    }
}

chsh --shell /bin/elvish

# Vapoursynth or Avisynth+
# TODO

yay -S $@packages-base $@packages-optional $@packages-extra --noconfirm --needed --quiet --noprogressbar

if (put $bluetooth) {
    sudo systemctl start bluetooth
    sudo systemctl enable bluetooth
}

# git
git config --global color.ui auto

# Pacman.conf
use ./pacman

# Mimeapps
use ./mimeapps

# Powerline fonts
use ./powerline

# Rust
for lang $langs-to-install {
    if (==s $lang "rust") {
        use ./rust
    }
}

# Ufw
use ./ufw

# Alacritty
use ./alacritty/setup

# Firefox
echo "Setting up Firefox"
use ./firefox/setup

# mpv
for package $packages-optional {
    if (==s $package "mpv") {        
        use ./mpv/setup mpv
        mpv:setup $high-quality-mpv
    }
}

# VSCodium
for package $packages-extra {
    if (==s $package "vscodium-bin") {
        use ./vscodium/setup vscode
        vscode:setup $langs-to-install
    }
}

# Elvish
echo "Setting up Elvish"
elv-node = $false
for lang $langs-to-install {
    if (==s $lang "node") {
        $elv-node = $true
    }
}
use ./elvish/setup elv
elv:setup $elv-node 

# NetworkManager or ConnMann
use ./network/setup network
if (==s $chosen-gui "lxqt") {
    network:connman 
} elif (==s $chosen-gui "plasma") {
    network:network-manager 
}