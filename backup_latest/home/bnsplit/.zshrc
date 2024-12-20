# zinit init
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# Pour zsh-completions
autoload -U compinit && compinit

# Une recommandation de zinit
zinit cdreplay -q

# Keybinds
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preiew 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias z='clear && zsh'
alias b='clear && bash'
alias n='nvim'
alias c='clear'
alias matrix='cmatrix'
alias grep='grep --color=always'
# alias vim='nvim'
alias yo='yay -Rns $(yay -Qdtq)'
alias yu='yay -Syu --noconfirm'
alias rmdb='sudo rm /var/lib/pacman/db.lck'
alias ddd="sudo dd bs=4M if='$1' of=$2 conv=fsync oflag=direct status=progress"
AnimeDive() {
  case "$1" in
    --node)
      node ~/dev/AnimeDive/src/main.js
      ;;
    *)
      source ~/dev/AnimeDive/launch-docker.sh
      ;;
  esac
}

# Shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Starship init
eval "$(starship init zsh)"

# Fastfetch
fastfetch

