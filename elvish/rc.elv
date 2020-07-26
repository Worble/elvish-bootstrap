use github.com/muesli/elvish-libs/theme/powerline
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-completions/cd
fn ls [@a]{ e:ls --color $@a }
fn grep [@a]{ e:rg --color=always $@a }