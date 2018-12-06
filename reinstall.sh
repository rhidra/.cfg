# A exécuter en sudo
cd $HOME

# Wifi
# apt install bcmwl-kernel-source

# Luminosité
apt install -y automake autoconf
git clone https://github.com/haikarainen/light.git
cd light
./autogen.sh
./configure && make
make install
cd ..
rm -rf light

# Applications de base
apt install -y thunderbird vim vlc git curl feh ranger scrot build-essential evince

# Python
apt install -y ipython3 python3-pip python3-tk
pip3 install numpy matplotlib

# Police caractères asiatiques
apt install -y fonts-nanum

# Atom
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
apt update -y
apt install -y atom

# Playerctl
wget -v "https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb"
dpkg -i *.deb
rm -vf playerctl*.deb

# Gitkraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb

# i3
apt install -y i3 compton rofi

# Polybar
apt install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev
git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh --auto --i3 --network --curl --ipc
cd ..
rm -rf polybar

# urxvt
apt install -y rxvt-unicode-256color autocutsel

# Fichiers de configuration
echo ".cfg" >> .gitignore
mkdir .cfg
git clone --bare https://github.com/rhidra/.cfg.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} rm {}
config checkout

fc-cache -fv
xrdb $HOME/.Xresources
