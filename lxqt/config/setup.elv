mkdir -p ~/.config/lxqt/

conf = (dirname (src)[name])'/lxqt.conf'
cp $conf ~/.config/lxqt/lxqt.conf

conf = (dirname (src)[name])'/lxqt-config-appearance.conf'
cp $conf ~/.config/lxqt/lxqt-config-appearance.conf

mkdir -p ~/.config/gtk-3.0/
conf = (dirname (src)[name])'/settings.ini'
cp $conf ~/.config/lxqt/settings.ini