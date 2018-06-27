# 新手BBS项目SpringMVC+MyBatis+JSP
# risingwind  翼风之下-社区论坛 （仿MIUI论坛）

* BBS项目-翼风之下社区论坛
* 开始时间：2017-10-14 ，完成时间：2017-11-30
* 组长：李
* 小组成员：卢 ，黄 ，于 ，杨
* 翼风之下 社区论坛，由 String MVC+Mybatis 搭建，页面主要由Bootstrap编写。作为SSM实战项目。

## BBS系统需求分析
主要实现了基于B/S模式客户端和服务器端的动态交互。
- 开发BBS论坛系统的目的是提供一个供用户交流的平台，为广大用户提供交流经验、探讨问题的网上社区。
- BBS论坛系统最基本的功能首先是发表主题，其次是其他人员根据主题发表自己的看法。此外，为了记录主题的发表者和主题的回复者信息，系统还需要提供用户注册和登录的功能。只有注册的用户登录后才能够发表和回复主题，浏览者（游客）只能浏览主题信息。


看到这么多炫酷的Header，是不是觉得很棒？这时你或许会担心这么多的Header集成在一起，但是平时只会用到一个，是不是要引入很多无用的代码和资源？
请放心，我已经把刷新布局分成三个包啦，用到的时候自行引用就可以啦！

 - SmartRefreshLayout 刷新布局核心实现，自带ClassicsHeader（经典）、BezierRadarHeader（贝塞尔雷达）两个 Header.
 - SmartRefreshHeader 各种Header的集成，除了Layout自带的Header，其它都在这个包中.
 - SmartRefreshFooter 各种Footer的集成，除了Layout自带的Footer，其它都在这个包中.

## 项目部署
1. pc操作系统
2. java环境1.8
3. Sqlserver2014数据库
4. eclipse、支持Tomcat9最好
5. 把项目导入eclipse（环境不同可能回报错，但问题不大。可以新建空web项目后粘贴过去）
6. sql脚本文件和pictures本地图片文件夹同时放在WebContent文件夹下，理解目录结构的可以自行变动
#### 1.在 Java Build Path 中
Libraries会这几个库，一般导入时jsp会报错，都是少了Tomcat这个Library，在右边按钮选择第四项 Add Library 找到Server Runtime前提要先在service中添加Tomcat服务。
![](./部署操作图片/导入.png)

#### 2.项目没有问题了，把项目部署到Tomcat上
项目还应用到本地图片上传显示，所以会把一个文件夹映射成网络路径。双击Tomcatserver弹出窗下方标签选择Modules，在Web Modules中
![](./部署操作图片/Tomcat部署项目.png)
![](./部署操作图片/Tomcat映射本地文件.png)
![](./部署操作图片/Tomcat发布项目.png)

#### 3.接下来到Sqlserver2014数据库数据导入
1. 项目的sql脚本，直接导入
2. （如果直接导入失败可能是版本兼容问题，一般脚本影响不大）新建数据库risingwind，新建查询，将sql脚本贴入编辑窗执行
3. risingwind数据库会显示几张表
![](./部署操作图片/数据库数据导入.png)

#### 4.更改项目数据源，启动Tomcat
改好后，启动Tomcat。（一般项目没有红色叉，黄色叹就可以运行成功）
![](./部署操作图片/项目数据源配置.png)

#### 5.成功访问首页
![](./部署操作图片/项目运行成功.png)

----  

## 包含一个APP应用放在WebContent文件夹下
以apicloud平台开发的html5App
技术点不多，主要是入门

#### 同样以MIUI论坛APP为原型
那时技术工具还没怎么好，才几个月又是一堆新插件工具的。
用的是doT.js做渲染。现在vue.js顶天了。。。。。。
* 学习apicloud官方文档几天做出来的，普通的html、css、js代码就布局出来了，使用的是数据云api的数据，没有整合项目数据。
* 有兴趣就多学习稳定的新技术



