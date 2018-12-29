在传统方式 
1.访问 http://logging.apache.org/log4j/ 
2.下载 Log4 j的 jar 库 
3.复制 jar 到项目类路径 
4.手动将其包含到项目的依赖 
所有的管理需要一切由自己做 如果有 Log4j 版本升级，则需要重复上述步骤一次。

在Maven的方式
1.你需要知道 log4j 的 Maven 坐标，例如： 
<groupId>log4j</groupId>
<artifactId>log4j</artifactId>
<version>1.2.14</version>

2.它会自动下载 log4j 的1.2.14 版本库。如果“version”标签被忽略，它会自动升级库时当有新的版本时。

3.声明 Maven 的坐标转换成 pom.xml 文件
<dependencies>
    <dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>1.2.14</version>
    </dependency>
</dependencies>

4.当 Maven 编译或构建，log4j 的 jar 会自动下载，并把它放到 Maven 本地存储库

5.所有由 Maven 管理

当建立一个Maven的项目，pom.xml文件将被解析，如果看到 log4j 的 Maven 坐标，然后 Maven 按此顺序搜索 log4j 库：

在 Maven 的本地仓库搜索 log4j  在 Maven 中央存储库搜索 log4j 在 Maven 远程仓库搜索 log4j(如果在 pom.xml 中定义)
