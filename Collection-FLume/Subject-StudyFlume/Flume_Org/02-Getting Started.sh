一.Flume NG
flume NG (Next Generation)
Flume OG (Original Generation)

(1)still have sources and sinks and they still do the same thing. They are now connected by channels.
(2)Flume NG ships with an in-memory channel for fast, but non-durable event delivery and a file-based channel for durable event delivery.
(3)call all physical nodes agents and agents can run zero or more sources and sinks.
(4)Theres no master and no ZooKeeper dependency anymore. At this time, Flume runs with a simple file-based configuration system
(5)everything is a plugin, some end user facing, some for tool and system developers. Pluggable components include channels, sources, sinks, interceptors, sink processors, and event serializers.

二.Getting Flume NG
(一)Building From Source
要求:need git, the Sun JDK 1.6, Apache Maven 3.x, about 90MB of local disk space and an Internet connection.

$ git clone https://git-wip-us.apache.org/repos/asf/flume.git flume
Cloning into 'flume'...
Receiving objects: 100% (37541/37541), 39.07 MiB | 186.00 KiB/s, done.
$ cd flume
clark_xu@DESKTOP-XX MINGW64 /e/app-installtools/flume/flume (trunk)
$ git checkout trunk
Your branch is up to date with 'origin/trunk'.
