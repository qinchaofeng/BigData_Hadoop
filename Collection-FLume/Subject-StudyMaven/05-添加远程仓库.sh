默认情况下，Maven从Maven中央仓库下载所有依赖关系。但是，有些库丢失在中央存储库，只有在Java.net或JBoss的储存库远程仓库中能找到。

1. Java.net资源库 添加Java.net远程仓库的详细信息在“pom.xml”文件。
pom.xml
<project ...>
<repositories>
    <repository>
      <id>java.net</id>
      <url>https://maven.java.net/content/repositories/public/</url>
    </repository>
 </repositories>
</project>

2. JBoss Maven存储库 1. 添加JBoss远程仓库的详细信息在 “pom.xml” 文件中。
pom.xml
<project ...>
    <repositories>
      <repository>
    <id>JBoss repository</id>
    <url>http://repository.jboss.org/nexus/content/groups/public/</url>
      </repository>
    </repositories>
</project>