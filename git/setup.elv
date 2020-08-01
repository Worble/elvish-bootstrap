config-location = ~/.gitconfig

config = (dirname (src)[name])'/.gitconfig'

should-add = $false
if ( not ?(test -f $config-location) ) {
    cp $config $config-location
} else {
    use str
    contents = (str:join "\n" [(cat $config)])
    should-add = (not ?(cat $config-location | rg $contents --fixed-strings --multiline --quiet))

    if ( put $should-add ) {
        echo $contents >> $config-location
    }
}