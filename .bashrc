# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Clic Touchpad
#synclient TapButton1=1 TapButton2=3 TapButton3=2

#### CUSTOM ####

# Dépôt git bare pour .cfg
alias config='/usr/bin/git --git-dir=/home/rhidra/.cfg/ --work-tree=/home/rhidra'

# Alias for lyvi
alias lyvi='python3 $HOME/rice/lyvi/lyvi.py'

# Alias for feh
alias feh='feh --scale-down --auto-zoom'

# Alias pour afficher l'espace disque
alias ds='du -h --max-depth=1 | sort -hr'

# Close ranger and stay in the same directory
alias c='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"; rm $HOME/.rangerdir'

# Start ranger in the files folder
alias files='cd /media/files/; c'
alias cours='cd /media/files/Documents/Cours/5SJTU/; c'

alias df='df -h'

# Alias pour utiliser Python 3
alias python='python3.6'
#alias pip='pip3'
alias pip='python3.6 -m pip'
alias ipy='ipython3 --nosep --no-confirm-exit --no-banner --pprint'

# IntelliJ
alias intellij=/opt/idea-*/bin/idea.sh

# Android Studio SDK
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
# avdmanager, sdkmanager
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
# adb, logcat
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator

# Zip git folder ignoring gitignore files
alias gitzip="git archive -o archive.zip HEAD"

# Gazebo/ROS
#export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:/media/files/Documents/Cours/5SJTU/Research/test_gazebo/plugins/build
#export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:/media/files/Documents/Cours/5SJTU/Research/test_gazebo/models

# ssh agent
ssh-add ~/.ssh/git_key &> /dev/null

# Node installation + nvm  + npm
export NVM_DIR="/home/rhidra/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ROS / Gazebo / PX4
# source /opt/ros/melodic/setup.bash
# source ~/catkin_ws/devel/setup.bash
# source /usr/share/gazebo/setup.sh

# fw_path="$HOME/Firmware"
# gz_path="$fw_path/Tools/sitl_gazebo"
# source $fw_path/Tools/setup_gazebo.bash $fw_path $fw_path/build/px4_sitl_default

# OpenVSLAM
# source $HOME/openvslam/ros/devel/setup.bash

# export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$fw_path
# export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$gz_path

# Set the plugin path so Gazebo finds our model and sim
# export GAZEBO_PLUGIN_PATH=${GAZEBO_PLUGIN_PATH}:$gz_path/build
# Set the model path so Gazebo finds the airframes
# export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:$gz_path/models
# export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:$HOME/gazebo_models_worlds_collection/models
# export GAZEBO_RESOURCE_PATH=$GAZEBO_RESOURCE_PATH:$HOME/forest_gen
# Disable online model lookup since this is quite experimental and unstable
# export GAZEBO_MODEL_DATABASE_URI=""
# export SITL_GAZEBO_PATH=$gw_path

# Bebop driver
# export LD_LIBRARY_PATH=~/catkin_ws/devel/lib/parrot_arsdk:$LD_LIBRARY_PATH


# yabridge (VST from Windows to Linux)
export PATH="$PATH:$HOME/.local/share/yabridge"
