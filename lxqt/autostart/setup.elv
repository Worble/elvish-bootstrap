mkdir -p ~/.config/autostart/

redshift = (dirname (src)[name])'/redshift.desktop'
cp $redshift ~/.config/autostart/redshift.desktop

connman = (dirname (src)[name])'/connman-system-tray.desktop'
cp $connman ~/.config/autostart/connman-system-tray.desktop
