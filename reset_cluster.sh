./kill_cluster.sh
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
./start_cluster.sh
