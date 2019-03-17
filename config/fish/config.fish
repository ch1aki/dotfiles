# alias
alias l 'ls -l'
alias g git

# direnv
eval (direnv hook fish)

# function key
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'	# search history
  bind \c] peco_select_ghq_repository			# search git-repo
end

# direnv
eval (direnv hook fish)
set -x EDITOR vi

# fisher bootstraping
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
