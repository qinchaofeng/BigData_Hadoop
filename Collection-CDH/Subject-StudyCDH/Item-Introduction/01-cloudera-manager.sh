(一)查看端口:

1.
netstat -atnp |grep LISTEN | grep java | grep 172.18.168.10

172.18.168.10:50090     0.0.0.0:*   LISTEN    secondarynamenode          
172.18.168.10:9995      0.0.0.0:*   LISTEN              
172.18.168.10:9997      0.0.0.0:*   LISTEN              
172.18.168.10:19888     0.0.0.0:*   LISTEN    jobhistory             
172.18.168.10:10033     0.0.0.0:*   LISTEN    Hadoop IPC port          
172.18.168.10:8020      0.0.0.0:*   LISTEN    Hadoop IPC port          
172.18.168.10:8022      0.0.0.0:*   LISTEN    Hadoop IPC port          
172.18.168.10:50070     0.0.0.0:*   LISTEN    namenode         
172.18.168.10:8086      0.0.0.0:*   LISTEN    Firehose_SERVICE_MONITORING Status          
172.18.168.10:8088      0.0.0.0:*   LISTEN    cluster        
172.18.168.10:8091      0.0.0.0:*   LISTEN    Firehose_HOST_MONITORING Status    
172.18.168.10:8030      0.0.0.0:*   LISTEN    Hadoop IPC port         
172.18.168.10:8031      0.0.0.0:*   LISTEN    Hadoop IPC port           
172.18.168.10:8032      0.0.0.0:*   LISTEN    Hadoop IPC port           
172.18.168.10:8033      0.0.0.0:*   LISTEN    Hadoop IPC port            
172.18.168.10:10020     0.0.0.0:*   LISTEN    Hadoop IPC port


2.
netstat -atnp | grep LISTEN | grep java | grep 0.0.0.0 | grep -v "172.18.168.10"

0 0.0.0.0:9994    0.0.0.0:*   LISTEN           
0 0.0.0.0:9996    0.0.0.0:*   LISTEN              
0 0.0.0.0:7180    0.0.0.0:*   LISTEN   cloudera manager          
0 0.0.0.0:7182    0.0.0.0:*   LISTEN              
0 0.0.0.0:7184    0.0.0.0:*   LISTEN              
0 0.0.0.0:7185    0.0.0.0:*   LISTEN              
0 0.0.0.0:9010    0.0.0.0:*   LISTEN              
0 0.0.0.0:8084    0.0.0.0:*   LISTEN   Event Debug Server Status            
0 0.0.0.0:4181    0.0.0.0:*   LISTEN              
0 0.0.0.0:10101   0.0.0.0:*   LISTEN              
0 0.0.0.0:27938   0.0.0.0:*   LISTEN              
0 0.0.0.0:2181    0.0.0.0:*   LISTEN      

3.
172.18.168.10:7180

(二)查看配置文件
1.
cd /opt/cloudera-manager/cm-5.14.1/etc

(1)cloudera-scm-server/db.properties
com.cloudera.cmf.db.type=mysql
com.cloudera.cmf.db.host=localhost
com.cloudera.cmf.db.name=scm
com.cloudera.cmf.db.user=scm
com.cloudera.cmf.db.setupType=EXTERNAL
com.cloudera.cmf.db.password=scm

(2)cloudera-scm-agent/config.ini
[General]
# Hostname of the CM server.
server_host=172.18.168.10

# Port that the CM server is listening on.
server_port=7182

# Downloaded parcels will be stored in <parcel_dir>/../parcel-cache
parcel_dir=/app/cloudera/parcels

# A knob to control the agent logging level. The options are listed as follows:
# 1) DEBUG (set the agent logging level to 'logging.DEBUG')
# 2) INFO (set the agent logging level to 'logging.INFO')
scm_debug=INFO
[Security]
# Use TLS and certificate validation when connecting to the CM server.
use_tls=0
[Hadoop]
#cdh_crunch_home=/usr/lib/crunch
#cdh_flume_home=/usr/lib/flume-ng
#cdh_hadoop_bin=/usr/bin/hadoop
#cdh_hadoop_home=/usr/lib/hadoop
#cdh_hbase_home=/usr/lib/hbase
#cdh_hbase_indexer_home=/usr/lib/hbase-solr
#cdh_hcat_home=/usr/lib/hive-hcatalog
#cdh_hdfs_home=/usr/lib/hadoop-hdfs
#cdh_hive_home=/usr/lib/hive
#cdh_httpfs_home=/usr/lib/hadoop-httpfs
#cdh_hue_home=/usr/share/hue
#cdh_hue_plugins_home=/usr/lib/hadoop
#cdh_impala_home=/usr/lib/impala
#cdh_llama_home=/usr/lib/llama
#cdh_mr1_home=/usr/lib/hadoop-0.20-mapreduce
#cdh_mr2_home=/usr/lib/hadoop-mapreduce
#cdh_oozie_home=/usr/lib/oozie
#cdh_parquet_home=/usr/lib/parquet
#cdh_pig_home=/usr/lib/pig
#cdh_solr_home=/usr/lib/solr
#cdh_spark_home=/usr/lib/spark
#cdh_sqoop_home=/usr/lib/sqoop
#cdh_sqoop2_home=/usr/lib/sqoop2
#cdh_yarn_home=/usr/lib/hadoop-yarn
#cdh_zookeeper_home=/usr/lib/zookeeper
#hive_default_xml=/etc/hive/conf.dist/hive-default.xml
#webhcat_default_xml=/etc/hive-webhcat/conf.dist/webhcat-default.xml
#jsvc_home=/usr/libexec/bigtop-utils
#tomcat_home=/usr/lib/bigtop-tomcat
#oracle_home=/usr/share/oracle/instantclient
[Cloudera]
#mgmt_home=/usr/share/cmf

[JDBC]
#cloudera_mysql_connector_jar=/usr/share/java/mysql-connector-java.jar
#cloudera_oracle_connector_jar=/usr/share/java/oracle-connector-java.jar
#By default, postgres jar is found dynamically in $MGMT_HOME/lib
#cloudera_postgresql_jdbc_jar=

(3)default/cloudera-scm-server
# The default value is the default system mysql driver on RHEL/CentOS/Ubuntu
# and the standard, documented location for where to put the oracle jar in CM
# deployments.
#

export CMF_JDBC_DRIVER_JAR="/usr/share/java/mysql-connector-java.jar:/usr/share/java/oracle-connector-java.jar"

# Default value sets Java maximum heap size to 2GB, and Java maximum permanent
# generation size to 256MB.
#

export CMF_JAVA_OPTS="-Xmx2G -XX:MaxPermSize=256m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp"

(4)default/cloudera-scm-agent
(5)init.d/cloudera-scm-server-db
# Init script for the Cloudera SCM Server's Embedded Database (postgresql)
DATA_DIR=/var/lib/cloudera-scm-server-db/data
(6)init.d/cloudera-scm-server
(7)init.d/cloudera-scm-agent


2.
cd /opt/cloudera-manager/cm-5.14.1/lib64/cmf/cloudera/cm_version.properties
/opt/cloudera-manager/cm-5.14.1/lib64/cmf/service

(1)zookeeper/zkserver.sh
./cm-5.14.1/run/cloudera-scm-agent/process/531-zookeeper-server/zoo.cfg
./cm-5.14.1/lib64/cmf/service/common/cloudera-config.sh

(2)yarn/yarn.sh


(3)/opt/cloudera-manager/cm-5.14.1/lib64/cmf/service/common

3./opt/cloudera-manager/cm-5.14.1/log
-rw-r----- 1 root root  10M Nov 20 09:35 cloudera-scm-server/cloudera-scm-server.log.9
-rw-r--r-- 1 root root  469 Nov 21 15:59 cloudera-scm-agent/supervisord.out
-rw-r--r-- 1 root root 1.6K Nov 21 15:59 cloudera-scm-agent/cmf_listener.log
-rw-r----- 1 root root  11M Nov 22 10:36 cloudera-scm-server/cloudera-scm-server.log.8
-rw-r----- 1 root root  11M Nov 29 13:59 cloudera-scm-server/cloudera-scm-server.log.7
-rw-r----- 1 root root  11M Dec  3 13:07 cloudera-scm-server/cloudera-scm-server.log.6
-rw-r--r-- 1 root root 5.7K Dec  5 16:24 cloudera-scm-agent/cloudera-scm-agent.out
-rw-r--r-- 1 root root 1.3K Dec  7 23:10 cloudera-scm-server/cloudera-scm-server.out
-rw-r----- 1 root root  11M Dec  8 19:24 cloudera-scm-server/cloudera-scm-server.log.5
-rw-r----- 1 root root  11M Dec 13 11:43 cloudera-scm-server/cloudera-scm-server.log.4
-rw-r----- 1 root root  11M Dec 18 04:24 cloudera-scm-server/cloudera-scm-server.log.3
-rw-r--r-- 1 root root  10M Dec 22 13:26 cloudera-scm-agent/cloudera-scm-agent.log.5
-rw-r----- 1 root root  11M Dec 22 20:24 cloudera-scm-server/cloudera-scm-server.log.2
-rw-r--r-- 1 root root  10M Dec 23 17:14 cloudera-scm-agent/cloudera-scm-agent.log.4
-rw-r--r-- 1 root root  10M Dec 24 21:03 cloudera-scm-agent/cloudera-scm-agent.log.3
-rw-r--r-- 1 root root  10M Dec 26 00:51 cloudera-scm-agent/cloudera-scm-agent.log.2
-rw-r--r-- 1 root root 441K Dec 26 16:24 cloudera-scm-agent/cloudera-flood.log
-rw-r--r-- 1 root root 143K Dec 27 03:11 cloudera-scm-agent/supervisord.log
-rw-r--r-- 1 root root  10M Dec 27 04:33 cloudera-scm-agent/cloudera-scm-agent.log.1
-rw-r----- 1 root root  11M Dec 27 12:24 cloudera-scm-server/cloudera-scm-server.log.1
-rw-r----- 1 root root 7.2M Dec 27 15:25 cloudera-scm-server/cmf-server-perf.log
-rw-r----- 1 root root 286K Dec 27 15:56 cloudera-scm-server/cloudera-scm-server.log
-rw-r--r-- 1 root root 4.1M Dec 27 15:56 cloudera-scm-agent/cloudera-scm-agent.log


4.
