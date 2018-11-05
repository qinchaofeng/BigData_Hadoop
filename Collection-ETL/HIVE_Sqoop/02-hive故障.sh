ogging initialized using configuration in jar:file:/app/apache-hive-2.1.1-bin/lib/hive-common-2.1.1.jar!/hive-log4j2.properties Async: true
Exception in thread "main" java.lang.RuntimeException: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/root/4290d0e6-b84d-496f-899f-4c81fbce98d7. Name node is in safe mode.
Resources are low on NN. Please add or free up more resources then turn off safe mode manually. NOTE:  If you turn off safe mode before adding resources, the NN will immediately return to safe mode. Use "hdfs dfsadmin -safemode leave" to turn safe mode off.
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1327)
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:3895)
	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:984)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:622)
	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:616)
	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:982)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2049)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2045)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1698)
	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2043)

	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:591)
	at org.apache.hadoop.hive.ql.session.SessionState.beginStart(SessionState.java:531)
	at org.apache.hadoop.hive.cli.CliDriver.run(CliDriver.java:705)
	at org.apache.hadoop.hive.cli.CliDriver.main(CliDriver.java:641)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.apache.hadoop.util.RunJar.run(RunJar.java:221)
	at org.apache.hadoop.util.RunJar.main(RunJar.java:136)
Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.namenode.SafeModeException): Cannot create directory /tmp/hive/root/4290d0e6-b84d-496f-899f-4c81fbce98d7. Name node is in safe mode.
Resources are low on NN. Please add or free up more resources then turn off safe mode manually. NOTE:  If you turn off safe mode before adding resources, the NN will immediately return to safe mode. Use "hdfs dfsadmin -safemode leave" to turn safe mode off.
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.checkNameNodeSafeMode(FSNamesystem.java:1327)
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.mkdirs(FSNamesystem.java:3895)
	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.mkdirs(NameNodeRpcServer.java:984)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.mkdirs(ClientNamenodeProtocolServerSideTranslatorPB.java:622)
	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:616)
	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:982)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2049)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2045)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1698)
	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2043)

	at org.apache.hadoop.ipc.Client.call(Client.java:1475)
	at org.apache.hadoop.ipc.Client.call(Client.java:1412)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:229)
	at com.sun.proxy.$Proxy31.mkdirs(Unknown Source)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.mkdirs(ClientNamenodeProtocolTranslatorPB.java:558)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:191)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
	at com.sun.proxy.$Proxy32.mkdirs(Unknown Source)
	at org.apache.hadoop.hdfs.DFSClient.primitiveMkdir(DFSClient.java:3000)
	at org.apache.hadoop.hdfs.DFSClient.mkdirs(DFSClient.java:2970)
	at org.apache.hadoop.hdfs.DistributedFileSystem$21.doCall(DistributedFileSystem.java:1047)
	at org.apache.hadoop.hdfs.DistributedFileSystem$21.doCall(DistributedFileSystem.java:1043)
	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirsInternal(DistributedFileSystem.java:1043)
	at org.apache.hadoop.hdfs.DistributedFileSystem.mkdirs(DistributedFileSystem.java:1036)
	at org.apache.hadoop.hive.ql.session.SessionState.createPath(SessionState.java:732)
	at org.apache.hadoop.hive.ql.session.SessionState.createSessionDirs(SessionState.java:655)
	at org.apache.hadoop.hive.ql.session.SessionState.start(SessionState.java:563)
	... 9 more



[root@node01 ~]# hdfs dfsadmin -safemode leave
Safe mode is OFF
[root@node01 ~]# hive
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/app/apache-hive-2.1.1-bin/lib/log4j-slf4j-impl-2.4.1.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/app/hadoop-2.7.3/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]

Logging initialized using configuration in jar:file:/app/apache-hive-2.1.1-bin/lib/hive-common-2.1.1.jar!/hive-log4j2.properties Async: true
Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
hive> 


