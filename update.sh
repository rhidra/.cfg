#!/bin/bash

apt update
apt upgrade
apt autoremove

vim +PluginClean +qall
vim +PluginInstall +qall
vim +PluginUpdate +qall
