# alias
alias l 'ls -l'
alias g git
alias k kubectl

# direnv
eval (direnv hook fish)
set -x EDITOR vi

# fisher bootstraping
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# golang
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# python
set -gx PYENV_ROOT "$HOME/.pyenv"
set -x PATH $PATH "$PYENV_ROOT/bin"
status --is-interactive; and . (pyenv init - | psub)
