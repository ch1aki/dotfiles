# LANG
set -x LC_ALL ja_JP.UTF-8
set -x LANG ja_JP.UTF-8

# alias
alias l 'ls -l'
alias g git

# direnv
eval (direnv hook fish)
set -x EDITOR vi

# fisher bootstraping
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
