<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%response.setContentType("text/html");response.setCharacterEncoding("utf-8"); %>


<!-- 返回顶部 -->
<a title="返回顶部" onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a>

<!-- 底部 -->
<div class="footer">
  <div class="row clearfix">
    <div class="col-md-6 column">
      <dl>
        <dt>
          BBS系统需求分析
        </dt>
        <dd>
          主要实现了基于B/S模式客户端和服务器端的动态交互。
        </dd>
        <dt>
          一、
        </dt>
        <dd>
          开发BBS论坛系统的目的是提供一个供用户交流的平台，为广大用户提供交流经验、探讨问题的网上社区。
        </dd>
        <dt>
          二、
        </dt>
        <dd>
         BBS论坛系统最基本的功能首先是发表主题，其次是其他人员根据主题发表自己的看法。此外，为了记录主题的发表者和主题的回复者信息，系统还需要提供用户注册和登录的功能。只有注册的用户登录后才能够发表和回复主题，浏览者（游客）只能浏览主题信息。
        </dd>
      </dl>
    </div>
    <div class="col-md-6 column">
      <address> <strong>BBS项目-翼风之下社区论坛</strong><br /> 开始时间：2017-10-14 ，预计完成：2017-11-30<br /> 组长：李<br /> <abbr title="小组成员">小组成员</abbr>：卢 ，黄 ，于 ，杨</address>
      <p class="text-left text-info lead">
         <em>翼风之下</em> 社区论坛，由 <strong>String MVC+Mybatis</strong> 搭建，页面主要由<strong>Bootstrap</strong>编写。作为<small>SSM</small>实战项目。
      </p>
      <div class="login_type">
      <a class="icon_type btn_li" href="javascript:void(0)" title="李">
        <i class="icon_btn icon_li"></i>
        <img width="170px" src="/pictures/pic_main/li.jpg" alt="李">
      </a>
      <a class="icon_type btn_huang" href="javascript:void(0)" title="黄">
        <i class="icon_btn icon_huang"></i>
        <img width="170px" src="/pictures/pic_main/huang.jpg" alt="黄">
      </a>
      <a class="icon_type btn_lu" href="javascript:void(0)" title="卢">
        <i class="icon_btn icon_lu"></i>
        <img width="170px" src="/pictures/pic_main/lu.jpg" alt="卢">
      </a>
      <a class="icon_type btn_yang" href="javascript:void(0)" title="杨">
        <i class="icon_btn icon_yang"></i>
        <img width="170px" src="/pictures/pic_main/yang.jpg" alt="杨">
      </a>
      <a class="icon_type btn_yu" href="javascript:void(0)" title="于">
        <i class="icon_btn icon_yu"></i>
        <img width="170px" src="/pictures/pic_main/yu.jpg" alt="于">
      </a>
     </div>
    </div>
  </div>
</div>