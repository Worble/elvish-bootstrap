echo "Setting up UFW"

if ?(! s== (echo (sudo ufw status)) "Status: active") {
    sudo ufw default deny
    sudo ufw allow from 192.168.0.0/24
    sudo ufw allow qBittorrent
    sudo ufw enable
    sudo systemctl enable ufw.service
}