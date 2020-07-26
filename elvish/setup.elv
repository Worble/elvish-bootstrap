fn setup [node]{
    echo "Setting up Elvish"
    use epm
    epm:install github.com/muesli/elvish-libs
    epm:install github.com/zzamboni/elvish-completions
    epm:install github.com/zzamboni/elvish-modules

    mkdir -p ~/.elvish

    use github.com/zzamboni/elvish-modules/alias
    grc-execs = [ cat cvs df dig gcc ifconfig make mount mtr netstat ping ps tail traceroute wdiff blkid du dnf docker docker-machine env id ip iostat last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap fdisk findmnt free semanage sar ss sysctl systemctl stat showmount tcpdump tune2fs vmstat w who ]
    for grc-exec $grc-execs {
        alias:new $grc-exec "e:grc "$grc-exec
    }

    config = (dirname (src)[name])'/rc.elv'
    cp $config ~/.elvish/rc.elv
    if (put $node) {
        echo 'E:PATH=$E:HOME"/.npm-packages/bin:"$E:PATH
E:MANPATH=(manpath -q):$E:HOME"/.npm-packages/share/man"' >> ~/.elvish/rc.elv
    }
}