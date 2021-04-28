export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export SPICETIFY_INSTALL="$HOME/.config/spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="$HOME/.config/bin:$PATH"
export MANPAGER="nvim +Man!"
export MANWIDTH=999
export LIBVIRT_DEFAULT_URI="qemu:///system"

ZSH_THEME=""
fpath+="$HOME/.zsh/pure"

plugins=(
	git
	asdf
	zsh-autosuggestions
	ssh-agent
)

source $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt pure

#aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias vim="nvim"
alias vcfg="nvim $HOME/.config/nvim/init.vim"
alias norminette="~/.norminette/norminette.rb"
alias tldr="man -M ~/tldr"

#asdf configs
. $HOME/.asdf/asdf.sh

