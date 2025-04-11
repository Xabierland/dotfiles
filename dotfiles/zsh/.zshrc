# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes
ZSH_THEME="simple"

# Hyphen-insensitive completion.
HYPHEN_INSENSITIVE="true"

# Command auto-correction.
ENABLE_CORRECTION="true"

# Plugins
plugins=(
	extract
	git
	kubectl
	sudo
	z
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
