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
zinit wait lucid blockf light-mode for \
    atload'async_init' @'mafredri/zsh-async' \
    @'zsh-users/zsh-autosuggestions' \
    @'zsh-users/zsh-completions' \
    @'zdharma-continuum/fast-syntax-highlighting'

### End of Zinit's installer chunk

# Homebrew
function homebrew_dir() {
  echo $(dirname $(dirname $(which brew)))
}

# paths
typeset -U path
typeset -U fpath

path=(
        "$PATH:${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"(N-/)
        "$PATH:$HOME/Library/Python/3.8/bin"(N-/)
        "$PATH:/opt/local/bin"(N-/)
        "${KREW_ROOT:-$HOME/.krew}/bin:$PATH"(N-/)
        "$HOME/.rbenv/bin:$PATH"(N-/)
        "$path[@]"
)

fpath=(
    "$XDG_DATA_HOME/zsh/completions"(N-/)
    "$fpath[@]"
)

# history
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_SHARE_HISTORY
setopt MAGIC_EQUAL_SUBST
setopt PRINT_EIGHT_BIT
setopt NO_FLOW_CONTROL

zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir)($| )" ]]
}

# local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# prompt
autoload colors && colors

function git_branch_current() {
  git branch --show-current 2> /dev/null
}

PROMPT=$'%{$fg[blue]%}%3~ %{$fg[magenta]%}$(git_branch_current)
%(?.%F{green}$%f.%F{red}$%f) '

# completion
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

### plugins ###
zinit wait lucid null for \
    atinit'source "$ZDOTDIR/.zshrc.lazy"' \
    @'zdharma-continuum/null'
