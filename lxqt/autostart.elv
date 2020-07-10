mkdir -p ~/.config/autostart/
echo '[Desktop Entry]
Exec=redshift-qt
Name=redshift
Type=Application
Version=1.0
X-LXQt-Need-Tray=true' > ~/.config/autostart/redshift.desktop

echo '[Desktop Entry]
Exec=cmst -m
Name=connman-system-tray
Type=Application
Version=1.0
X-LXQt-Need-Tray=true' > ~/.config/autostart/connman-system-tray.desktop
