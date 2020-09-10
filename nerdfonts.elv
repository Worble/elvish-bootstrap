echo "Installing Nerd Fonts"

mkdir -p ~/.local/share/fonts

space-mono-fonts = [ "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font%20Complete%20Mono.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Italic/complete/Space%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Bold/complete/Space%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Bold-Italic/complete/Space%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf" ]

for font $space-mono-fonts {
    wget $font -P ~/.local/share/fonts -N --quiet --show-progress
}

sudo fc-cache -f -v