echo "Killing Kafka 1"
ps ax | grep -i 'kafkaServer-gc.log' | grep java | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -9
sleep 1
echo "Killing Kafka 2"
ps ax | grep -i 'kafkaServer-gc.log' | grep java | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -9
sleep 1
echo "Killing Kafka 3"
ps ax | grep -i 'kafkaServer-gc.log' | grep java | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -9
sleep 1
echo "Killing Zookeeper 1"
ps ax | grep -i 'zookeeper-gc.log' | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -9
sleep 1
echo "Killing Zookeeper 2"
ps ax | grep -i 'zookeeper-gc.log' | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -9
sleep 1
echo "Killing Zookeeper 3"
ps ax | grep -i 'zookeeper-gc.log' | grep -v grep | awk '{print $1}' | head -1 | sudo xargs kill -9
sleep 1
