现在，Maven的依赖库查询顺序更改为： 
在 Maven 本地资源库中搜索，如果没有找到，进入第 2 步，否则退出。
 在 Maven 中央存储库搜索，如果没有找到，进入第 3 步，否则退出。 
 在java.net Maven的远程存储库搜索，如果没有找到，提示错误信息，否则退出。


 2. 声明Java.net储存库 告诉 Maven 来获得 Java.net 的依赖，你需要声明远程仓库在 pom.xml 文件这样：
pom.xml

 <repositories>
    <repository>
        <id>java.net</id>
        <url>https://maven.java.net/content/repositories/public/</url>
    </repository>
    </repositories>