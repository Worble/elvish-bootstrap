use github.com/muesli/elvish-libs/theme/powerline
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/builtins
use github.com/zzamboni/elvish-modules/alias
-exports- = (alias:export)
fn ls [@a]{ e:ls --color $@a }
fn grep [@a]{ e:rg --pretty $@a }
fn diff [@a]{ e:diff --color=auto $@a }
