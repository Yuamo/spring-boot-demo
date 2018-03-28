## install
   mysql数据中创建springbootdb 库
```js
    // 在application.yml 中进行数据库连接配置
    url: jdbc:mysql://127.0.0.1:3306/springbootdb
    username: root
    password: mysql
```

## spring-boot-demo 项目技术栈

* 1.RESTful 服务
* 2.热更新
* 3.Exception封装
* 4.aop
* 5.logger
* 6.maven
* 7.JPA
* 8.文件的上传下载
* 9.加入Ueditor后端文件和配置



#################################################
2017.10.24 1024程序员节加入上传图片类型判定！
2017.10.25 加入ueditor后端代码，前端使用[vue-ueditor](https://github.com/SilentTiger/vue-ueditor)
```js
     window.UEDITOR_CONFIG = {
    
            // 为编辑器实例添加一个路径，这个不能被注释
        UEDITOR_HOME_URL: URL,
    
            // 服务器统一请求接口路径
        serverUrl: 'http://localhost:8081/server/ueditor/exec'
```
* 注意application.properties 文件必须存并配置正确在要不然ueditor无法正常使用
* 
## 热更新 IDEA 配置
[热更新配置链接](http://blog.csdn.net/wjc475869/article/details/52442484)

## 阿里代码开发规约插件（Java Coding Guidelines）
----
Idea 中安装插件
```js 
    1.安装 File-->setting-->Plugins   搜索插件 Java Coding Guidelines 并安装
    2.重启idea 
    3.Tools --> 阿里编码规约 --> 编码规约扫描
```
Eclipse 中安装插件
````js
    1.Eclipse版插件安装 ( ≥4.2  JDK1.8+ ）；
    2.Help >> Install New Software
    3.然后输入    https://p3c.alibaba.com/plugin/eclipse/update
    4.选中列表中插件安装
````