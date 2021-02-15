fn setup [high-quality-config]{
    echo "Setting up mpv"
    if (put $high-quality-config) {
        mkdir -p ~/.config/mpv
        config = (dirname (src)[name])'/mpv.conf'
        cp $config ~/.config/mpv/mpv.conf
    }
}