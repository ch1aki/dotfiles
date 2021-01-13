#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
## system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/Library/Python/3.8/bin"
export PATH="$PATH:/opt/local/bin"
export PATH="$HOME/.rbenv/bin:$PATH"

export EDITOR=nvim

function fzf-src () {
  local selected_dir=$(ghq list -p | fzf +m --query "$LBUFFER" --prompt="Sorce > ")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-src
bindkey '^g' fzf-src

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

## theme
autoload -Uz promptinit
promptinit
prompt peepcodecustom "$"

## alias
alias g=git
alias k=kubectl
alias bx="bundle exec"
alias kc=kubectx
alias kn=kubens

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ch1aki/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ch1aki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ch1aki/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ch1aki/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
