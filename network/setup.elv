fn connman {
    error = ?(sudo systemctl stop NetworkManager)
    error = ?(sudo systemctl disable NetworkManager)
    error = ?(sudo systemctl unmask connman)
    error = ?(sudo systemctl unmask connman-wait-online)
    sudo systemctl enable connman
    sudo systemctl start connman
    error = ?(sudo systemctl mask NetworkManager)
    error = ?(sudo systemctl mask NetworkManager-dispatcher)
    error = ?(sudo systemctl mask NetworkManager-wait-online)

    error = ?(sudo systemctl stop wpa_supplicant)
    error = ?(sudo systemctl mask wpa_supplicant)
    error = ?(sudo systemctl unmask iwd)
    sudo systemctl enable --now iwd
    sudo systemctl daemon-reload
    sudo systemctl restart connman

    connmanctl enable wifi   
}

fn network-manager {
    error = ?(sudo systemctl stop connman)
    error = ?(sudo systemctl disable connman)
    error = ?(sudo systemctl unmask NetworkManager)
    error = ?(sudo systemctl unmask NetworkManager-dispatcher)
    error = ?(sudo systemctl unmask NetworkManager-wait-online)
    sudo systemctl enable NetworkManager
    sudo systemctl start NetworkManager
    error = ?(sudo systemctl mask connman)
    error = ?(sudo systemctl mask connman-wait-online)

    error = ?(sudo systemctl stop iwd)
    error = ?(sudo systemctl mask iwd)
    error = ?(sudo systemctl unmask wpa_supplicant)
    sudo systemctl enable --now wpa_supplicant
    sudo systemctl daemon-reload
    sudo systemctl restart NetworkManager
}