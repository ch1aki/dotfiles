### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

### End of Zinit's installer chunk

# locale
export LANG=ja_JP.UTF-8

# plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light migutw42/zsh-fzf-ghq
zinit light jonmosco/kube-ps1

# path_healper
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

# Homebrew
if  [[ "$(uname -m)" == arm64 ]]; then
	eval $(/opt/homebrew/bin/brew shellenv)
elif [[ "$(uname -m)" == x86_64 ]]; then
	eval $(/usr/local/bin/brew shellenv)
fi

function homebrew_dir() {
  $(dirname $(dirname $(which brew)))
}

# PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/Library/Python/3.8/bin"
export PATH="$PATH:/opt/local/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# alias
alias g=git
alias k=kubectl
alias bx="bundle exec"
alias kc=kubectx
alias kn=kubens
alias vi=vim
alias vim=nvim
alias ls='lsd'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# prompt
autoload colors
colors

function git_branch_current() {
  git branch --show-current 2> /dev/null
}

PROMPT=$'%{$fg[blue]%}%3~ %{$fg[magenta]%}$(git_branch_current) $(kube_ps1)
%(?.%F{green}$%f.%F{red}$%f) '

# completion
autoload -Uz compinit
compinit
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
if  [[ "$(uname -m)" == arm64 ]]; then
	source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
	source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
elif [[ "$(uname -m)" == x86_64 ]]; then
	source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
	source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# history
HISTSIZE=50000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history

# asdf
case ${OSTYPE} in
        darwin*)
                . $(homebrew_dir)/opt/asdf/libexec/asdf.sh
                ;;
        linux*)
                . $HOME/.asdf/asdf.sh
                ;;
esac

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubectx
kubeoff

