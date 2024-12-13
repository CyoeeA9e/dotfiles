# share history cross terminal
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

setopt share_history

# pure is a zsh theme
fpath+=($HOME/.config/zsh/pure)

fpath+=($HOME/.config/zsh/zsh-completions/src)

autoload -U compinit promptinit
rm -f $HOME/.zcompdump
compinit
promptinit 
prompt gentoo
prompt pure
zstyle ':completion::complete:*' use-cache 1

source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# using emacs keybind
bindkey -e
# up arrow to search up
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# yazi: file browser in terminal
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

alias ls=eza
