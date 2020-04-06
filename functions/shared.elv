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
        if (==s (str:to-lower $input) "y") {
            put $true
            return
        } elif (==s (str:to-lower $input) "n") {
            put $false
            return
        } else {
            tty-echo "Please respond Y or N"
        }
    }
}
