echo "Stopping Kafka X"
ps ax | grep -i 'kafkaServer-gc.log' | grep java | grep -v grep | awk '{print $1}' | shuf | head -1 | sudo xargs kill -SIGTERM
sleep 1
