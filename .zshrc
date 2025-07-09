# PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/share/node-v20.12.2-linux-x64/bin/:$HOME/.local/bin:/opt/android-sdk/platform-tools/:$PATH

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set the default editor
export EDITOR='nvim'

# docker socket
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Arch Linux
alias pacman='sudo pacman --noconfirm'
alias pmi='sudo pacman -S --noconfirm'
alias pmr='sudo pacman -R'
alias pmupd='sudo pacman -Sy --noconfirm'
alias pmupg='sudo pacman -Syu --noconfirm'
alias pms='sudo pacman -Ss'

alias parui='paru -S --noconfirm'
alias parus='paru -Ss'

# Fedora
alias dnfi='sudo dnf install --assumeyes'
alias dnfupg='sudo dnf upgrade --refresh --best --allowerasing -y'
alias dnfupd='sudo dnf update'
alias dnfr='sudo dnf remove'
alias dnfsearch='dnf search'
alias dnfinfo='dnf info'
alias dnfcheck='dnf check'
alias dnfdowngrade='sudo dnf downgrade'
alias dnfclean='sudo dnf clean all'
alias dnfhistory='dnf history'
alias dnflist='dnf list'
alias dnfrepoinfo='dnf repoinfo'
alias dnfdisablerepo='sudo dnf config-manager --set-disabled'
alias dnfbuilddep='sudo dnf builddep'

# Ubuntu
alias apti='sudo apt install -y'
alias aptup='sudo apt update'
alias aptupg='sudo apt full-upgrade -y'
alias aptr='sudo apt remove --auto-remove'
alias apts='apt search'
alias aptiinfo='apt show'
alias aptcheck='apt list --upgradable'
alias aptclean='sudo apt clean'
alias apthistory='apt history'
alias aptlist='apt list --installed'
alias aptrepoinfo='apt-cache show'
alias aptdisablerepo='sudo sed -i "s/enabled=1/enabled=0/g" /etc/apt/sources.list'
alias aptenablerepo='sudo sed -i "s/enabled=0/enabled=1/g" /etc/apt/sources.list'

# File configurations
alias nvimconf='nvim ~/.config/nvim/'
alias zshconf='vim ~/.zshrc'

alias vim='nvim'
alias manthano_backend='cd ~/Langs/Python/manthano_backend && source .venv/bin/activate && python manage.py runserver 8000'

alias video='yt-dlp -P ~/Downloads --no-mtime -S res,ext:mp4:m4a --recode mp4'
alias song='yt-dlp -P ~/Downloads --no-mtime -f 139'

# pnpm
export PNPM_HOME="/home/fabiojr/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval `ssh-agent` > /dev/null
