echo "Setting up network"

nmconf = (dirname (src)[name])'/NetworkManager.conf'
sudo cp $nmconf /etc/NetworkManager/NetworkManager.conf

sudo systemctl enable --now iwd
sudo systemctl enable --now NetworkManager
sudo systemctl mask wpa_supplicant
sudo systemctl daemon-reload
sudo systemctl restart NetworkManager
