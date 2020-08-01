echo "Installing Nerd Fonts"

mkdir -p ~/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SpaceMono/Regular/complete/Space%20Mono%20Nerd%20Font
%20Complete%20Mono.ttf -P ~/.local/share/fonts -N

sudo fc-cache -f -v