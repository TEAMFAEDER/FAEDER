#!/usr/bin/env bash
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
install() {
reset
echo -e "\e[38;5;77m    •{ Welcome to install source Faeder }•\e[0m"
echo -e "\e[38;5;77m    •{ Setting up offices }•\e[0m"
echo -e "\e[38;5;77m       •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {0%}\e[0m"
apt update
apt upgrade
sudo apt-get update
sudo apt-get upgrade
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {10%}\e[0m"
sudo apt-get install tmux
sudo apt-get install luarocks
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {20%}\e[0m"
sudo apt-get install screen
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {30%}\e[0m"
sudo apt-get update
sudo apt-get install
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {40%}\e[0m"
sudo apt-get install upstart-sysv
wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz;tar zxpf luarocks-2.2.2.tar.gz;cd luarocks-2.2.2 && ./configure
sudo make bootstrap
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {50%}\e[0m"
sudo luarocks install luasocket
sudo luarocks install luasec
sudo luarocks install redis-lua
sudo luarocks install lua-term
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {60%}\e[0m"
sudo luarocks install serpent
sudo luarocks install dkjson
sudo luarocks install Lua-cURL
sudo luarocks install luautf8
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {70%}\e[0m"
sudo service redis-server start
sudo apt-get install libconfig++9v5 -y 
sudo apt-get install libstdc++6 -y
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {80%}\e[0m"
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y 
sudo apt-get install lua-lgi -y  
sudo apt-get install software-properties-common -y
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {90%}\e[0m"
sudo apt-get install libnotify-dev -y 
sudo apt-get install lua-space -y
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev -y
reset
echo -e "\e[38;5;77m •{ install source Faeder }•\e[0m"
echo -e "\e[38;5;77m                             {100%}\e[0m"
sudo apt-get update 
sudo apt-get upgrade -y
reset
echo -e "\e[38;5;77m       •{ •{ Join the Source Channel : @Faeder_Ch }• }•\e[0m"

echo -e "\e[38;5;77m       _ _    _   _ \e[0m"
echo -e "\e[38;5;77m       |  _/ \  | |  _ \| |  _ \\e[0m"
echo -e "\e[38;5;77m       | |_ / _ \ |  _| | | | |  _| | |_) |\e[0m"
echo -e "\e[38;5;77m       |  _/ _ \| |_| |_| | |_|  _ <\e[0m"
echo -e "\e[38;5;77m       |_|/_/   \_\_|__/|___|_| \_\\e[0m"

echo -e "\e[38;5;77m       •{ Faeder source has been installed }•\e[0m"
echo -e "\e[38;5;77m       •{ Source developer : @KKKKF }•\e[0m"
cd ..
rm -rf luarocks*
./tg -s FAEDER.lua
}
if [ "$1" = "install" ]; then
install
else
if [ ! -f ./tg ]; then
echo "Tg Is Not Found"
exit 1
fi
./tg -s FAEDER.lua
fi
