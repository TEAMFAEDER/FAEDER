!/usr/bin/env bash


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

}


function print_logo() {

 green "_              _                 _"

 green " |  _|_ _  _  | | _ _     | |_   "

 green " | |_ / _ |/ _ \/ _ |/ _ \ '|  / _` \ \/ /"

 green " |  _| (_| |  / (_| |  / |    | (_| |>  <"
 
 green " |_|  \,_|\_|\__,_|\___|_|     \__,_/_/\_\"

 echo -e "\n\e[0m"

}


function logo_play() {

    declare -A txtlogo

    seconds="0.010"

    txtlogo[1]="_              _                 _"

    txtlogo[2]=" |  _|_ _  _  | | _ _     | |_   "

    txtlogo[3]=" | |_ / _ |/ _ \/ _ |/ _ \ '|  / _` \ \/ /"

    txtlogo[4]=" |  _| (_| |  / (_| |  / |    | (_| |>  <"
    
    txtlogo[5]=" |_|  \,_|\_|\__,_|\___|_|     \__,_/_/\_\"

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


function FAEDER() {

 echo -e "\e[0m"

 green " >>>> I am not the only one "

 green " >>>> But I am the best "

 white " >>>> I am the only programmer "

 white " >>>> To a source FAEDER "

 red " >>>> Follow my channel "

 red " >>>> @FAEDER "

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

 FAEDER

 logo_play

 install

  else

if [ ! -f ./tg ]; then

    echo "tg not found"

    echo "Run $0 install"

    exit 1

 fi

 print_logo

 FAEDER

 logo_play

   #sudo service redis-server restart

   ./tg -s ./FAEDER.lua -l 1 -E $@

   #./tg -s ./FAEDER.lua $@

fi
