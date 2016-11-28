numberOfProcesses=$(ps ax | grep java | grep -v grep | awk '{print $1}' | wc -l)

if [ $numberOfProcesses -eq 6 ] ; then
	echo "*************Cluster allready running***************"
	echo "Ip: 192.168.100.100"
	echo ""
	echo "Zookeeper 1:	192.168.100.100:2181 (2888:3888)"
	echo "Zookeeper 2:	192.168.100.100:2182 (2889:3889)"
	echo "Zookeeper 3:	192.168.100.100:2183 (2890:3890)"
	echo "Kafka 1:		192.168.100.100:9091"
	echo "Kafka 2:		192.168.100.100:9092"
	echo "Kafka 3:		192.168.100.100:9093"
	break
else

	attempt=0
	until [ $attempt -ge 3 ]
	do
		echo "Cluster starting"
		echo " - Launching Zookeeper 1"
		sudo /etc/zookeeper1/bin/zookeeper-server-start.sh -daemon /etc/zookeeper1/config/zookeeper.properties
		sleep 1
		echo " - Launching Zookeeper 2"
		sudo /etc/zookeeper2/bin/zookeeper-server-start.sh -daemon /etc/zookeeper2/config/zookeeper.properties
		sleep 1
		echo " - Launching Zookeeper 3"
		sudo /etc/zookeeper3/bin/zookeeper-server-start.sh -daemon /etc/zookeeper3/config/zookeeper.properties
		sleep 6
		echo " - Launching Kafka 1"
		sudo /etc/kafka1/bin/kafka-server-start.sh -daemon /etc/kafka1/config/server.properties
		sleep 2
		echo " - Launching Kafka 2"
		sudo /etc/kafka2/bin/kafka-server-start.sh -daemon /etc/kafka2/config/server.properties
		sleep 2
		echo " - Launching Kafka 3"
		sudo /etc/kafka3/bin/kafka-server-start.sh -daemon /etc/kafka3/config/server.properties
		sleep 2

		numberOfProcesses=$(ps ax | grep java | grep -v grep | awk '{print $1}' | wc -l)

		if [ $numberOfProcesses -eq 6 ] ; then
			echo "*************Cluster running***************"
			echo "Ip: 192.168.100.100"
			echo ""
			echo "Zookeeper 1:	192.168.100.100:2181 (2888:3888)"
			echo "Zookeeper 2:	192.168.100.100:2182 (2889:3889)"
			echo "Zookeeper 3:	192.168.100.100:2183 (2890:3890)"
			echo "Kafka 1:		192.168.100.100:9091"
			echo "Kafka 2:		192.168.100.100:9092"
			echo "Kafka 3:		192.168.100.100:9093"
			break
		else
			echo "Cluster not started correctly, retrying $attempt"
			echo " - Launching Zookeeper 1"
			sudo /etc/zookeeper1/bin/zookeeper-server-start.sh -daemon /etc/zookeeper1/config/zookeeper.properties
			sleep 1
			echo " - Launching Zookeeper 2"
			sudo /etc/zookeeper2/bin/zookeeper-server-start.sh -daemon /etc/zookeeper2/config/zookeeper.properties
			sleep 1
			echo " - Launching Zookeeper 3"
			sudo /etc/zookeeper3/bin/zookeeper-server-start.sh -daemon /etc/zookeeper3/config/zookeeper.properties
			sleep 6
			echo " - Launching Kafka 1"
			sudo /etc/kafka1/bin/kafka-server-start.sh -daemon /etc/kafka1/config/server.properties
			sleep 2
			echo " - Launching Kafka 2"
			sudo /etc/kafka2/bin/kafka-server-start.sh -daemon /etc/kafka2/config/server.properties
			sleep 2
			echo " - Launching Kafka 3"
			sudo /etc/kafka3/bin/kafka-server-start.sh -daemon /etc/kafka3/config/server.properties
			sleep 10
		fi

		attempt=$(($attempt+1))
	done
fi