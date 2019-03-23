
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR


install() {

cd tg

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

wget https://valtman.name/files/telegram-cli-1222

mv telegram-cli-1222 tg

sudo chmod +x tg

cd ..


chmod +x tg

chmod +x autofaeder.sh

}


function print_logo() {

green ""
            

green ""

green ""

 green ""

 echo -e "\n\e[0m"

}


function logo_play() {

declare -A txtlogo

seconds="0.010"

txtlogo[1]=" "

    txtlogo[2]="  "

    txtlogo[3]=""

    txtlogo[4]=""

printf "\e[31m\t"

for i in ${!txtlogo[@]}; do

for x in seq 0 ${#txtlogo[$i]}; do

printf "${txtlogo[$i]:$x:1}"

sleep $seconds

done

printf "\n\t"

done

printf "\n"

echo -e "\e[0m"

}


function beyondteam() {

echo -e "\e[0m"

green " >>>> I'm not the only one. "

green " >>>> But I'm the best "

white " >>>> I'm the only programmer"

white " >>>> To a source FAEDER"

red " >>>> Follow my program"

red " >>>> @Faeder_ch "

echo -e "\e[0m"

}


red() {

printf '\e[1;31m%s\n\e[0;39;49m' "$@"

}

green() {

printf '\e[1;32m%s\n\e[0;39;49m' "$@"

}

white() {

printf '\e[1;37m%s\n\e[0;39;49m' "$@"

}

update() {

git pull

}


if [ "$1" = "install" ]; then

print_logo

faeder

logo_play

install

 else

if [ ! -f ./tg ]; then

echo "tg not found"

echo "Run $0 install"

exit 1

 fi
 ./tg -s FAEDER.lua
fi




