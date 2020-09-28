fn setup [node]{
    echo "Setting up Elvish"
    use epm
    epm:install github.com/muesli/elvish-libs
    epm:install github.com/zzamboni/elvish-completions
    epm:install github.com/zzamboni/elvish-modules

    mkdir -p ~/.elvish

    use github.com/zzamboni/elvish-modules/alias
    
    #grc-execs = [ cat ps du ]    
    grc-execs = [ cvs df dig gcc ifconfig make mount mtr netstat ping tail traceroute wdiff blkid dnf docker docker-machine env id ip iostat last lsattr lsblk lspci lsmod lsof getfacl getsebool ulimit uptime nmap fdisk findmnt free semanage sar ss sysctl systemctl stat showmount tcpdump tune2fs vmstat w who ]
    for grc-exec $grc-execs {
        alias:new $grc-exec "e:grc "$grc-exec
    }

    alias:new ls "e:exa --icons --git"
    alias:new grep "e:rg --pretty"
    alias:new cat "e:bat"
    alias:new find "e:fd"
    alias:new ps "e:procs"
    alias:new sed "e:sd"
    alias:new du "e:dust"
    alias:new top "e:btm"
    alias:new diff "e:delta --diff-so-fancy"

    config = (dirname (src)[name])'/rc.elv'
    cp $config ~/.elvish/rc.elv

    if (put $node) {
        e:sed -i '1s|^|E:MANPATH=(manpath -q):$E:HOME"/.npm-packages/share/man"\n|' ~/.elvish/rc.elv
        e:sed -i '1s|^|E:PATH=$E:HOME"/.npm-packages/bin:"$E:PATH\n|' ~/.elvish/rc.elv
    }
}