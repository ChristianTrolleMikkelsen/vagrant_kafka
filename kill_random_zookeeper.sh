echo "Killing Zookeeper x"
ps ax | grep -i 'zookeeper' | grep -v grep | awk '{print $1}' | shuf | head -1 | sudo xargs kill -9
