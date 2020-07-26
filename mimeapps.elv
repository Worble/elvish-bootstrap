mkdir -p ~/.config

echo '[Added Associations]
application/x-shellscript=org.kde.kate.desktop;
application/x-yaml=org.kde.kate.desktop;
application/vnd.ms-publisher=org.kde.kate.desktop;
text/plain=org.kde.kate.desktop;
application/octet-stream=org.kde.kate.desktop;
application/x-compressed-tar=org.kde.ark.desktop;

[Default Applications]
application/x-shellscript=org.kde.kate.desktop;
application/x-yaml=org.kde.kate.desktop;
inode/directory=pcmanfm-qt.desktop;
application/x-compressed-tar=org.kde.ark.desktop' > ~/.config/mimeapps.list
