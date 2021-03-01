echo "Setting up clamav"

if (not ?(test /run/clamav/clamd.ctl)) {
    touch /run/clamav/clamd.ctl
    sudo chown clamav:clamav /run/clamav/clamd.ctl
}

err = ?(sudo freshclam)
sudo systemctl enable --now clamav-freshclam
sudo systemctl enable --now clamav-daemon

err = ?(sudo -u clamav /usr/bin/fangfrisch --conf /etc/fangfrisch/fangfrisch.conf initdb)

sudo systemctl enable --now fangfrisch.timer