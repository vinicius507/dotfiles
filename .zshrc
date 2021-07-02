export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export SPICETIFY_INSTALL="$HOME/.config/spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="$HOME/.config/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export MANPAGER="nvim +Man!"
export MANWIDTH=999
export LIBVIRT_DEFAULT_URI="qemu:///system"
export BAT_THEME="TwoDark"
export USER="Vinícius"

ZSH_THEME=""
fpath+="$HOME/.config/zsh/pure"

plugins=(
	git
	asdf
	#zsh-autosuggestions
	ssh-agent
	#zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt pure

# Aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias vim="nvim"
alias vcfg="nvim $HOME/.config/nvim/init.vim"
alias tldr="man -M ~/.tldr"
alias neovide="neovide --remote-tcp=localhost:6969"

#asdf configs
. /opt/asdf-vm/asdf.sh
