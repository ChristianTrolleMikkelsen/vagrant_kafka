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
echo "Clearing log directories"
sudo find /etc/kafka1/data -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/kafka1/logs -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/kafka2/data -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/kafka2/logs -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/kafka3/data -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/kafka3/logs -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/zookeeper1/data -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/zookeeper1/logs -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/zookeeper2/data -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/zookeeper2/logs -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/zookeeper3/data -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
sudo find /etc/zookeeper3/logs -mindepth 1 ! -name 'myid' -exec sudo rm -rf {} +
