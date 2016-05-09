echo "Launching Zookeeper 1"
sudo /etc/zookeeper1/bin/zookeeper-server-start.sh -daemon /etc/zookeeper1/config/zookeeper.properties
sleep 1
echo "Launching Zookeeper 2"
sudo /etc/zookeeper2/bin/zookeeper-server-start.sh -daemon /etc/zookeeper2/config/zookeeper.properties
sleep 1
echo "Launching Zookeeper 3"
sudo /etc/zookeeper3/bin/zookeeper-server-start.sh -daemon /etc/zookeeper3/config/zookeeper.properties
sleep 1
echo "Launching Kafka 1"
sudo /etc/kafka1/bin/kafka-server-start.sh -daemon /etc/kafka1/config/server.properties
sleep 1
echo "Launching Kafka 2"
sudo /etc/kafka2/bin/kafka-server-start.sh -daemon /etc/kafka2/config/server.properties
sleep 1
echo "Launching Kafka 3"
sudo /etc/kafka3/bin/kafka-server-start.sh -daemon /etc/kafka3/config/server.properties
sleep 1

echo "*******************************************"
echo "Ip: 192.168.100.100" 
echo ""
echo "Zookeeper 1:	192.168.100.100:2181 (2888:3888)"
echo "Zookeeper 2:	192.168.100.100:2182 (2889:3889)"
echo "Zookeeper 3:	192.168.100.100:2183 (2890:3890)"
echo "Kafka 1:		192.168.100.100:9091"
echo "Kafka 2:		192.168.100.100:9092"
echo "Kafka 3:		192.168.100.100:9093"