THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
install() {
wget "https://valtman.name/files/telegram-cli-1222"
mv telegram-cli-1222 tg
sudo chmod +x tg
echo -e "" 
echo -e "" 
}
if [ "$1" = "install" ]; then
install
else
if [ ! -f ./tg ]; then
echo "" 
echo ""     •{ Setting up offices }•
exit 1
fi

apt update
apt upgrade
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tmux
sudo apt-get install luarocks
sudo apt-get install screen
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev
sudo apt-get update
sudo apt-get install
sudo apt-get install upstart-sysv
wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz;tar zxpf luarocks-2.2.2.tar.gz;cd luarocks-2.2.2 && ./configure
sudo make bootstrap
sudo luarocks install luasocket
sudo luarocks install luasec
sudo apt-get install libconfig++9v5 -y 
sudo apt-get install libstdc++6 -y
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y 
sudo apt-get install lua-lgi -y  
sudo apt-get install libnotify-dev -y 
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev -y
sudo apt-get update 
sudo apt-get upgrade -y

echo -e "\e[38;5;77m       •{ install source Faeder [100%]  }•\e[0m"
echo -e "\e[38;5;77m       •{ •{ Join the Source Channel : @faeder_ch }• }•\e[0m"

echo -e "\e[38;5;77m       _ _    _ __  ___ __\e[0m"
echo -e "\e[38;5;77m       |  _/ \  | __|  _ \| __|  _ \\e[0m"
echo -e "\e[38;5;77m       | |_ / _ \ |  _| | | | |  _| | |_) |\e[0m"
echo -e "\e[38;5;77m       |  _/ _ \| |_| |_| | |_|  _ <\e[0m"
echo -e "\e[38;5;77m       |_|/_/   \_\___|__/|___|_| \_\\e[0m"

echo -e "\e[38;5;77m       •{ Faeder source has been installed }•\e[0m"
echo -e "\e[38;5;77m       •{ Source developer : @Pro_c9 }•\e[0m"

./tg -s FAEDER.lua
fi
