echo "Stopping Zookeeper x"
ps ax | grep -i 'zookeeper-gc.log' | grep -v grep | awk '{print $1}' | shuf | head -1 | sudo xargs kill -SIGTERM
sleep 1
