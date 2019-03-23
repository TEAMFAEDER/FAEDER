THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
install() {
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

  sudo apt-get install g++-4.7 -y c++-4.7 -y

  sudo apt-get update

  sudo apt-get upgrade

  sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y

  sudo apt-get install screen -y

  sudo apt-get install tmux -y

  sudo apt-get install libstdc++6 -y

  sudo apt-get install lua-lgi -y

  sudo apt-get install libnotify-dev -y

wget "https://valtman.name/files/telegram-cli-1222"
mv telegram-cli-1222 tg
sudo chmod +x tg
echo -e " BY TEAM FAEDER"
echo -e " BY TEAM FAEDER" 
echo -e " BY TEAM FAEDER" 
}
if [ "$1" = "install" ]; then
install
else
if [ ! -f ./tg ]; then
echo " BY TEAM FAEDER" 
echo " BY TEAM FAEDER"
exit 1
fi
./tg -s FAEDER.lua
fi
