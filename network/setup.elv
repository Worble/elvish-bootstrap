sudo systemctl enable --now wpa_supplicant
sudo systemctl enable --now NetworkManager
sudo systemctl daemon-reload
sudo systemctl restart NetworkManager
