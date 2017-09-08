[root@node02 sqoop-1.99.7-bin-hadoop200]# ls
bin  CHANGELOG.txt  conf  docs  LICENSE.txt  NOTICE.txt  README.txt  server  shell  tools
[root@node02 sqoop-1.99.7-bin-hadoop200]# pwd
/app/sqoop-1.99.7-bin-hadoop200


echo 'export SQOOP_HOME=/app/sqoop-1.99.7-bin-hadoop200' >> /etc/profile
echo 'export PATH=$SQOOP_HOME/bin:$PATH' >> /etc/profile
echo 'export CATALINA_HOME=$SQOOP_HOME/server' >> /etc/profile
echo 'export LOGDIR=$SQOOP_HOME/logs ' >> /etc/profile 
 
source /etc/profile


[root@node01 sqoop-1.99.7-bin-hadoop200]# cat conf/sqoop.properties  | grep 'org.apache.sqoop.submission.engine.mapreduce.configuration.directory'
org.apache.sqoop.submission.engine.mapreduce.configuration.directory=/etc/hadoop/conf/


cat conf/sqoop.properties | grep -v '#' | grep "[A-Za-z]"
cat conf/sqoop.properties | grep -v '#' | grep "[A-Za-z]" | grep -v "=$"

[root@node01 sqoop-1.99.7-bin-hadoop200]# mkdir -p $SQOOP_HOME/server/conf/
[root@node01 sqoop-1.99.7-bin-hadoop200]# vi $SQOOP_HOME/server/conf/catalina.properties

common.loader=${catalina.base}/lib,  
${catalina.base}/lib/*.jar,  
${catalina.home}/lib,  
${catalina.home}/lib/*.jar,  
${catalina.home}/../lib/*.jar,  
${HADOOP_HOME}/share/hadoop/common/*.jar,  
${HADOOP_HOME}/share/hadoop/common/lib/*.jar,  
${HADOOP_HOME}/share/hadoop/hdfs/*.jar,  
${HADOOP_HOME}/share/hadoop/hdfs/lib/*.jar,  
${HADOOP_HOME}/share/hadoop/mapreduce/*.jar,  
${HADOOP_HOME}/share/hadoop/mapreduce/lib/*.jar,  
${HADOOP_HOME}/share/hadoop/tools/*.jar,  
${HADOOP_HOME}/share/hadoop/tools/lib/*.jar,  
${HADOOP_HOME}/share/hadoop/yarn/*.jar,  
${HADOOP_HOME}/share/hadoop/yarn/lib/*.jar,  
${HADOOP_HOME}/share/hadoop/httpfs/tomcat/lib/*.jar 

