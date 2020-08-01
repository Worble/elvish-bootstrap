use github.com/zzamboni/elvish-modules/alias
-exports- = (alias:export)
fn ls [@a]{ e:exa --icons --git $@a }
fn grep [@a]{ e:rg --pretty $@a }
fn cat [@a]{ e:bat $@a }
fn find [@a]{ e:fd $@a }
fn ps [@a]{ e:procs $@a }
fn sed [@a]{ e:sd $@a }
fn du [@a]{ e:dust $@a }
fn top [@a]{ e:ytop $@a }
fn diff [@a]{ e:delta --diff-so-fancy $@a }
if (put ?(test -z $E:MTM)) {
    exec mtm
} else {
    use github.com/muesli/elvish-libs/theme/powerline
    use github.com/zzamboni/elvish-completions/git
    use github.com/zzamboni/elvish-completions/ssh
    use github.com/zzamboni/elvish-completions/cd
    use github.com/zzamboni/elvish-completions/builtins    
}
