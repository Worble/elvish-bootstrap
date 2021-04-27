# set path for cargo and npm packages
set E:PATH = $E:HOME"/.cargo/bin:"$E:HOME"/.npm-packages/bin:"$E:PATH

use github.com/zzamboni/elvish-modules/alias
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/builtins    
eval (starship init elvish)
