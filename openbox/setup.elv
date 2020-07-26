echo "Setting up openbox"

mkdir -p ~/.config/openbox/
mkdir -p ~/.themes

theme = (dirname (src)[name])'/Afterpiece.obt'
tar -xf $theme -C ~/.themes/ --overwrite

config = (dirname (src)[name])'/lxqt-rc.xml'
cp $config ~/.config/openbox/lxqt-rc.xml