# Differences between Bash and Zsh?
# https://apple.stackexchange.com/a/361957/97810

# How to make ZSH pretty:
# https://medium.com/@shivam1/make-your-terminal-beautiful-and-fast-with-zsh-shell-and-powerlevel10k-6484461c6efb

# 1. install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# 2. install PowerLeve10K theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# 3. edit ~/.zshrc and change this,
ZSH_THEME="powerlevel10k/powerlevel10k"
# 4. restart iTerm and follow p10k prompts to configure it

# mass-rename-files
# in ~/.zshrc
autoload zmv
alias zcp='zmv -C' zln='zmv -L'
# examples
zmv '(*).jpeg' '$1.jpg'
zmv '(*)-backup.(*)' 'backups/$1.$2'
