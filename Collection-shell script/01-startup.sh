# 1.start filebeat
.\filebeat -c filebeat.yml -e -configtest
# 2.start logstash
      bin/logstash -f config/logstash.conf --config.test_and_exit
nohup bin/logstash -f config/logstash.conf --config.reload.automatic 1 >logs/logstash-`date +%Y%m%d%H`.log 2>&1 &
# 3.kill logstash
ps -ef|grep "logstash.conf" |grep -v grep|awk '{print $2}'|xargs kill -9
# 4.kill flume
ps -ef|grep "flume2HDFS_agent" |grep -v grep|awk '{print $2}'|xargs kill -9
# 5.start flume
nohup flume-ng agent -n flume2HDFS_agent -f /app/flume/flume.properties 1 >/app/flume/logs/flume2HDFS_agent-`date +%Y%m%d%H`.log 2>&1 &
# 6.kafka相关操作
./kafka-topics.sh --create --zookeeper 192.168.6.41:2181,192.168.6.42:2181,192.168.6.43:2181 --replication-factor 1 --partitions 3 --topic logstash
./kafka-topics.sh --describe --zookeeper 192.168.6.41:2181,192.168.6.42:2181,192.168.6.43:2181 --topic logstash
./kafka-console-producer.sh --broker-list 192.168.6.42:9092,192.168.6.43:9092,192.168.6.44:9092 --topic logstash
./kafka-console-consumer.sh --zookeeper 192.168.6.41:2181,192.168.6.42:2181,192.168.6.43:2181 --topic logstash --from-beginnin
./kafka-topics.sh --list --zookeeper 192.168.6.41:2181,192.168.6.42:2181,192.168.6.43:2181
