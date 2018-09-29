
Code  Issues 0  Pull requests 0  Projects 0  Pulse
RUNFA.sh

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
install() {
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
