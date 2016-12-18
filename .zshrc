# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#PROMPT="%U$USER@%m%%%u "
PROMPT="[%U$USER@%m%%%u] %(!,#,$)"
RPROMPT="[%~]"


setopt autocd
setopt extendedglob
setopt auto_pushd
setopt list_packed
setopt hist_ignore_dups
setopt share_history
setopt pushd_ignore_dups

bindkey -e

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
bindkey '^J' self-insert

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mynz/.zshrc'

autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors 'di=32' 'ln=35' 'so=34' 'ex=31' 'bd=46;34' 'cd=43;34'

# color-ed ls command.
export LSCOLORS=cxfxexdxbxegedabagacad

export PATH=$HOME/bin:$PATH
export PAGER=less
export EDITOR=vim
export RUBYOPT=rubygems
#export LANG=ja_JP.UTF-8
#export LANG=ja_JP.encJP
export HGENCODING=utf-8

# for c-w separater
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#fpath=(~/.zshcomp $fpath)

# only for mac osx.
export MANPATH=/opt/local/man:$MANPATH

alias ls='ls -G -F'
alias lf='ls -G -F'
alias ll='ls -G -lF'
alias la='ls -G -aF'
#alias gosh='rlwrap gosh'
#alias gosh='rlgosh'
alias hg='hg --encoding=utf-8'

alias h='history'

# http://qiita.com/vintersnow/items/08852df841e8d5faa7c2
function find_cd() {
	cd "$(find . -type d | peco)"
}
alias fc="find_cd"


# enable c^s
stty stop undef

_cache_hosts=(localhost $HOST bsd air mynz.dyndns.org gbc.sakura.ne.jp
192.168.1.4 192.168.1.1
)

# OPAM configuration
. /Users/mynz/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# golang
export GOPATH=$HOME/go
export PATH=$HOME/go/bin:$PATH

if [ ${SCE_PROXY} ]; then
	export HTTP_PROXY=http://proxy.hq.scei.sony.co.jp:8080
	export HTTPS_PROXY=http://proxy.hq.scei.sony.co.jp:8080
fi
