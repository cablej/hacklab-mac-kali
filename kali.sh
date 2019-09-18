container="kali"

check_exists() {
	docker ps -a | grep $container > /dev/null
}

check_is_running() {
	docker ps | grep $container > /dev/null
}

start_x11() {
	ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
	xhost + $ip > /dev/null
}

start_container() {
	start_x11
	if [ ! -d "kali" ]
	then
		mkdir kali
	fi
	docker run -dti --name $container -e DISPLAY=$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/kali:/home cablej/hacklab-mac-kali
}

case "$1" in
	"status")
		check_exists
		if [ $? != 0 ]
		then
			echo "Container does not exist."
		else
			check_is_running
			if [ $? != 0 ]
			then
				echo "Container is stopped."
			else
				echo "Container is running."
			fi
		fi
	;;
    "init")
		start_container
	;;
	"run")
		check_exists
		if [ $? != 0 ]
		then
			start_container
		else
			check_is_running
			if [ $? != 0 ]
			then
				docker start $container
			fi
			start_x11
		fi
		docker exec -it $container /bin/bash -c /on_run.sh
	;;
	"stop")
		docker stop $container
	;;
	"start")
		docker start $container
	;;
	"restart")
		docker restart $container > /dev/null
	;;
	"")
		echo -e "Usage:
  ./kali.sh run     - opens a shell in the vm and initializes if needed
  ./kali.sh stop    - stops the vm
  ./kali.sh start   - starts the vm (run will do this automatically)
  ./kali.sh init    - initializes the vm (run will do this automatically)
  ./kali.sh status  - status of the vm
  ./kali.sh restart - restarts the vm container" 
	;;
	*)
		echo "Command not found: $1"
	;;
esac