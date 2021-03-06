use str

fn tty-echo [value]{
    echo $value > /dev/tty
}

fn read-input [defaultValue]{
    read = (bash -c "read input && echo $input")
    if (is $read "") {
        read = $defaultValue
    }
    put $read
    return
}

fn y-n-loop [question default]{
    while $true {
        tty-echo $question
        input = (read-input $default)
        input = (str:to-lower $input)
        if (==s $input "y") {
            put $true
            return
        } elif (==s $input "n") {
            put $false
            return
        } else {
            tty-echo "Please respond Y or N"
        }
    }
}
