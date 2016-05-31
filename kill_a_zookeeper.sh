pid=$(ps -o pid,cmd ax | grep -i ".*/etc/zookeeper$1" | grep -v grep | xargs | cut -d \  -f 1)

if [ $(ps -p $pid | wc -l) -gt 1 ] ; then
	echo "Killing Zookeeper$1 ($pid)"
	echo $pid | sudo xargs kill -9
else
	echo "No Zookeeper$1 running to kill"
fi

attempt=0
until [ $attempt -ge 20 ]
do
	if [ $(ps -p $pid | wc -l) -gt 1 ] ; then
		echo "  - $pid not stopped yet... $attempt"
		sleep 1
	else
		break
	fi

	attempt=$(($attempt+1))
done

if [ $(ps -p $pid | wc -l) -gt 1 ] ; then
	echo "  - Warning: $pid was not stopped, using kill 9..."
	sudo kill -9 $pid
	sleep 1
fi
