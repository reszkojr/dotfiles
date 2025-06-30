export PATH="$HOME/.local/share/pnpm:$HOME/.nvm/versions/node/v22.11.0/bin:$HOME/.pyenv/shims:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.local/bin:/usr/pgadmin4/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

export GTK2_RC_FILES=/etc/gtk-2.0/gtkrc:$HOME/.gtkrc-2.0:$HOME/.config/gtkrc-2.0
export GTK_IM_MODULE=cedilla
export GTK_RC_FILES=/etc/gtk/gtkrc:$HOME/.gtkrc:$HOME/.config/gtkrc

export NVM_BIN=$HOME/.nvm/versions/node/v22.11.0/bin
export NVM_CD_FLAGS=-q
export NVM_DIR=$HOME/.nvm
export NVM_INC=$HOME/.nvm/versions/node/v22.11.0/include/node

export OLDPWD=$HOME/.dotfiles

export PNPM_HOME=$HOME/.local/share/pnpm

export PYENV_ROOT=$HOME/.pyenv
export PYENV_SHELL=zsh

export QT_IM_MODULE=cedilla

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias erp='cd $HOME/Documentos/Cavok/erp'
alias sys='cd $HOME/Documentos/Cavok/sys2'

alias parui='/usr/bin/paru -S --noconfirm'
alias pmi='sudo pacman -S --noconfirm'
alias pmr='sudo pacman -R --noconfirm'

alias sql_server_local='PGPASSWORD=admin psql -U postgres -h 127.0.0.1 -c'
alias sql_server_teste='PGPASSWORD=admin psql -U postgres -h 192.168.18.29 -c'
