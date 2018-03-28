-----------
Spring-boot 整合mybatis 

-----------
1. 在yml文件中配置aliases-package 时报错，因为路径没有写全所以扫描不到vo
  type-aliases-package:: com.g_apple.helloworld.vo
  
 
2. 使用mybatis分页插件pagehelper 时记得在mybatis-config.xml中配置  并注意 pagehelper的版本
```xml
<dependency>
	<groupId>com.github.pagehelper</groupId>
	<artifactId>pagehelper</artifactId>
	<version>4.2.1</version>
</dependency>

```

```xml
<!--mybatis-config.xml-->
<plugins>
		<!-- com.github.pagehelper为PageHelper类所在包名 -->
		<plugin interceptor="com.github.pagehelper.PageHelper">
			<property name="dialect" value="mysql"/>
			<!-- 该参数默认为false -->
			<!-- 设置为true时，会将RowBounds第一个参数offset当成pageNum页码使用 -->
			<!-- 和startPage中的pageNum效果一样-->
			<property name="offsetAsPageNum" value="false"/>
			<!-- 该参数默认为false -->
			<!-- 设置为true时，使用RowBounds分页会进行count查询 -->
			<property name="rowBoundsWithCount" value="false"/>
			<!-- 设置为true时，如果pageSize=0或者RowBounds.limit = 0就会查询出全部的结果 -->
			<!-- （相当于没有执行分页查询，但是返回结果仍然是Page类型）-->
			<property name="pageSizeZero" value="true"/>
			<!-- 3.3.0版本可用 - 分页参数合理化，默认false禁用 -->
			<!-- 启用合理化时，如果pageNum<1会查询第一页，如果pageNum>pages会查询最后一页 -->
			<!-- 禁用合理化时，如果pageNum<1或pageNum>pages会返回空数据 -->
			<property name="reasonable" value="true"/>
			<!-- 3.5.0版本可用 - 为了支持startPage(Object params)方法 -->
			<!-- 增加了一个`params`参数来配置参数映射，用于从Map或ServletRequest中取值 -->
			<!-- 可以配置pageNum,pageSize,count,pageSizeZero,reasonable,不配置映射的用默认值 -->
			<!--<property name="params" value="pageNum=start;pageSize=limit;pageSizeZero=zero;reasonable=heli;count=contsql"/>-->
		</plugin>
	</plugins>

```

3. 扫描dao或者mapper时注意路径
@MapperScan(basePackages={"com.g_apple.**.dao"})

  
