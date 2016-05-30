echo "Killing all java processes..."
ps ax | grep java | grep -v grep | awk '{print $1}'
numberOfProcesses=$(ps ax | grep java | grep -v grep | awk '{print $1}' | wc -l)
if [ $numberOfProcesses -gt 0 ] ; then
	ps ax | grep java | grep -v grep | awk '{print $1}' | sudo xargs kill -9
	sleep 3
	ps ax | grep java | grep -v grep | awk '{print $1}' | wc -l
fi
