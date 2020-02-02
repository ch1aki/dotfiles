# alias
alias l 'ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
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

# starship
eval (starship init fish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sugawara/y/google-cloud-sdk/path.fish.inc' ]; . '/Users/sugawara/y/google-cloud-sdk/path.fish.inc'; end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
