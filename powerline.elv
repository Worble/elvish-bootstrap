echo "Installing Powerline fonts"

temp-dir = (mktemp -d)
git clone "https://github.com/powerline/fonts" $temp-dir
bash $temp-dir/install.sh
rm -rf $temp-dir