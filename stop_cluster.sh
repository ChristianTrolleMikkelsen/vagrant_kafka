echo "Stopping Kafka 1"
ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -SIGTERM
sleep 1
echo "Stopping Kafka 2"
ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -SIGTERM
sleep 1
echo "Stopping Kafka 3"
ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -SIGTERM
sleep 1
echo "Stopping Zookeeper 1"
ps ax | grep -i 'zookeeper' | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -SIGTERM
sleep 1
echo "Stopping Zookeeper 2"
ps ax | grep -i 'zookeeper' | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -SIGTERM
sleep 1
echo "Stopping Zookeeper 3"
ps ax | grep -i 'zookeeper' | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -SIGTERM
sleep 1