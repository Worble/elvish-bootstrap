use github.com/zzamboni/elvish-modules/alias
#if (put ?(test -z $E:MTM)) {
#    exec mtm
#} else {
    # use github.com/muesli/elvish-libs/theme/powerline
    # powerline:prompt-segments = [
    #     timestamp
    #     dir
    #     virtualenv
    #     git-branch
    #     git-ahead
    #     git-behind
    #     git-staged
    #     git-dirty
    #     git-untracked
    #     newline
    #     user
    #     arrow
    # ]
    use github.com/zzamboni/elvish-completions/git
    use github.com/zzamboni/elvish-completions/ssh
    use github.com/zzamboni/elvish-completions/cd
    use github.com/zzamboni/elvish-completions/builtins    
    eval (starship init elvish)
#}
