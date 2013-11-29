# compinit
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# prompts
autoload -U promptinit
promptinit
export PS1="%F{green}%n@%M:%~%%%f "

# history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# misc
setopt autocd
setopt extendedglob
setopt IGNORE_EOF
