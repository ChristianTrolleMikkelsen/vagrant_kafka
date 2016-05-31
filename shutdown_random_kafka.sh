pid=$(ps -o pid,cmd ax | grep -i ".*/etc/kafka" | grep -v grep | shuf | xargs | cut -d \  -f 1)

if [ $(ps -p $pid | wc -l) -gt 1 ] ; then
	echo "Stopping Kafka ($pid)"
	echo $pid | sudo xargs kill -SIGTERM
else
	echo "No Kafka running to stop"
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