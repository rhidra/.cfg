# A exécuter en sudo
cd $HOME

# Wifi
# apt install bcmwl-kernel-source

# Luminosité
add-apt-repository ppa:atareao/atareao
apt -y --force-yes update
apt -y --force-yes install acpilight

# Applications de base
apt -y --force-yes install thunderbird vim vlc git curl feh ranger scrot

# Atom
curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
apt -y --force-yes update

# Playerctl
wget -v "https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb"
dpkg -i *.deb
rm -vf playerctl*.deb

# i3
apt -y --force-yes install i3 compton rofi

# Polybar
echo "deb http://archive.getdeb.net/ubuntu `lsb_release -cs`-getdeb apps" | sudo tee /etc/apt/sources.list.d/getdeb.list &&  wget -q http://archive.getdeb.net/getdeb-archive.key -O- | sudo apt-key add -
apt -y --force-yes update
apt -y --force-yes install polybar

# urxvt
apt -y --force-yes install rxvt-unicode-256color autocutsel

# Fichiers de configuration
echo ".cfg" >> .gitignore
mkdir .cfg
git clone --bare https://github.com/rhidra/.cfg.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} rm {}
config checkout


lxappearance
libnotify-bin
libav-tools
