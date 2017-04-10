import sys
#Hbase.thrift生成的py文件放在这里
sys.path.append('/usr/local/python2.7.3/lib/python2.7/site-packages/hbase')
from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from hbase import Hbase
#如ColumnDescriptor 等在hbase.ttypes中定义
from hbase.ttypes import *
# Make socket
#此处可以修改地址和端口
transport = TSocket.TSocket('192.168.1.220', 9090)
# Buffering is critical. Raw sockets are very slow
# 还可以用TFramedTransport,也是高效传输方式
transport = TTransport.TBufferedTransport(transport)
# Wrap in a protocol
#传输协议和传输过程是分离的，可以支持多协议
protocol = TBinaryProtocol.TBinaryProtocol(transport)
#客户端代表一个用户
client = Hbase.Client(protocol)
#打开连接
transport.open()
#打印表名
print(client.getTableNames())