fn setup [node]{
    echo "Setting up Elvish"
    use epm
    epm:install github.com/muesli/elvish-libs
    epm:install github.com/zzamboni/elvish-completions
    mkdir -p ~/.elvish
    config = (dirname (src)[name])'/rc.elv'
    cp $config ~/.elvish/rc.elv
    if (put node) {
        echo 'E:PATH=$E:HOME"/.npm-packages/bin:"$E:PATH
E:MANPATH=(manpath -q):$E:HOME"/.npm-packages/share/man"
' >> ~/.elvish/rc.elv
    }
}