<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%response.setContentType("text/html");response.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE-edge">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="那啥平台-翼风之下，翼风之下，小组项目"/>
    <meta name="description" content="运用bootstrap jQuery 制作"/>
	<title>翼风之下后台管理-翼风之下</title>
  	<link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  	<link rel="icon" href="/pictures/pic_main/icon.png">
  <link rel="stylesheet" href="/risingwind/css/bootstrap.min.css">
  <link rel="stylesheet" href="/risingwind/css/index.css">
  <script src="/risingwind/js/jquery.min.js"></script>
  <script src="/risingwind/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 导航栏 -->
<div id="nav" style="background-color: #fd6440;">
    <nav class="my-navbar" role="navigation">  
        <div class="container-fluid">  
            <div class="navbar-header">  
                <button type="button" class="navbar-toggle" data-toggle="collapse"  
                        data-target="#example-navbar-collapse">  
                    <span class="sr-only">切换导航</span>  
                    <span class="icon-bar"></span>  
                    <span class="icon-bar"></span>  
                    <span class="icon-bar"></span>  
                </button> 
                <a class="navbar-brand" href="/risingwind/adminservice" title="翼风之下"><img src="/pictures/pic_main/brand.png" style="position: relative;top: -30px;"></a>  
            </div>  
            <div class="collapse navbar-collapse" id="example-navbar-collapse"> 
                <ul class="nav navbar-nav"><li>
                <h3 class="nav navbar-nav"><a href="#">翼风之下后台管理</a></h3>
                </li></ul>
                <ul class="nav navbar-nav navbar-right">
                  <!-- 用户信息头像 -->
                  <li class="dropdown">
                   <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                   <img src="/pictures/pic_user/default.jpg" style="width:30px;height:25px; border-radius: 50%;"></a>
                   <ul class="dropdown-menu" role="menu" style="background-color: rgba(0,0,0,.65);">
                    <li class="dropdown-header" style="color: red;">管理员：${admin.getAdminstrator() }</li>
                    <li><a href="javascript:void(0)">登录时间：<fmt:formatDate type="both" value="${admin.getLogintime() }" /></a></li>
                    <li><a href="javascript:void(0)">上次登录时间：<fmt:formatDate type="both" value="${admin.getOldlogintime() }" /></a></li>
                    <li><a href="javascript:void(0)">IP地址：${admin.getIpaddress() }</a></li>
                    <li class="divider"></li>
                    <li><button class="btn btn-block btn-danger">退出登录</button></li>
                   </ul>
                  </li>
                </ul>
            </div>  
        </div>  
    </nav>
</div>
<script type="text/javascript">
$(function(){
    //窗口滚动条，距顶<600淡出 ，>600淡入
    $(window).scroll(function(){
    height = $(window).scrollTop();
    if(height < 80){
      $('#nav').css("background-color","#fd6440");
    }else{
      $('#nav').css("background-color","rgba(253, 100, 64, 0.75)");
    };
  });
});
</script>

<div class="container"  style="padding-top: 60px;"></div>

<!-- 主体 -->
<div class="container">
  <div class="row clearfix">

    <div class="col-md-2 column" style="background-color: #00BCD4;">
      <div class="thumbnails" style="text-align: center;">
        <img alt="120x120" src="/pictures/pic_user/default.jpg" class="img-circle" style="width: 120px; height: 120px;">
        <div class="caption">
          <h4> <b>${admin.getAdminstrator() }</b></h4>
          <h6> 管理员 </h6>
          <ul class="list-unstyled">
            <li>登录次数：<span>${admin.getLogincount() }</span></li>
            <li><button class="btn btn-block btn-danger">退出登录</button></li>
          </ul>
        </div>
      </div>
     <div class="panel-group" id="accordion" style="margin-top: 20px;text-align: center;">
      <div id="userm" class="panel panel-warning">
       <div class="panel-heading">
        <div class="panel-title">
         <a type="button" style="padding: 0;" href="#collapse1" data-toggle="collapse" data-parent="#accordion" aria-expanded="true" class="btn collapsed">用户管理</a>
        </div>
       </div>
       <div class="panel-collapse collapse" id="collapse1" aria-expanded="true">
        <div class="panel-body">
         <ul class="list-unstyled">
            <li>
              <a href="#">添加用户</a>
            </li>
            <li>
              <a href="#">修改用户信息</a>
            </li>
            <li>
              <a href="#">删除用户</a>
            </li>
          </ul>
        </div>
       </div>
      </div>

      <div id="postm" class="panel panel-warning">
       <div class="panel-heading">
        <div class="panel-title">
         <a type="button" style="padding: 0;" href="#collapse2" data-toggle="collapse" data-parent="#accordion" aria-expanded="false" class="btn collapsed">帖子管理</a>
        </div>
       </div>
       <div class="panel-collapse collapse" id="collapse2" aria-expanded="true">
        <div class="panel-body">
          <ul class="list-unstyled">
            <li>
              <a href="#">系统帖子添加</a>
            </li>
            <li>
              <a href="#">修改帖子</a>
            </li>
            <li>
              <a href="#">删除帖子</a>
            </li>
          </ul>
        </div>
       </div>
      </div>

      <div id="replym" class="panel panel-warning">
       <div class="panel-heading">
        <div class="panel-title">
         <a type="button" style="padding: 0;" href="#collapse3" data-toggle="collapse" data-parent="#accordion" aria-expanded="true" class="btn collapsed">回贴管理</a>
        </div>
       </div>
       <div class="panel-collapse collapse" id="collapse3" aria-expanded="true">
        <div class="panel-body">
         <ul class="list-unstyled">
            <li>
              <a href="#">修改回帖信息</a>
            </li>
            <li>
              <a href="#">删除回帖信息</a>
            </li>
            <li>
              <a href="#">系统回复帖子</a>
            </li>
          </ul>
        </div>
       </div>
      </div> 
     </div>
    </div>
    <div class="col-md-10 column">
      <!-- 登录欢迎块 -->
      <div id="welcome" style="display: block;">
        <div class="jumbotron">
          <h1>
            Hello,？？？
          </h1>
          <p>
            欢迎登录翼风之下社区论坛后台管理平台。
          </p>
          <p>
            该平台提供用户信息、帖子内容、用户回帖的一些添加、修改、删除简单操作。
          </p>
        </div>
        <div class="alert alert-dismissable alert-danger">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4>
            注意!
          </h4>BBS论坛系统最基本的功能首先是发表主题，其次是其他人员根据主题发表自己的看法。此外，为了记录主题的发表者和主题的回复者信息，系统还需要提供用户注册和登录的功能。只有注册的用户登录后才能够发表和回复主题，浏览者（游客）只能浏览主题信息。
        </div>
      </div> 

      <!-- 用户管理 -->
      <div id="userManager" style="display: none;text-align: center;">
      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th width="11%">
              UID
            </th>
            <th width="11%">
              用户名
            </th>
            <th width="12%">
              用户密码
            </th>
            <th width="12%">
              手机号
            </th>
            <th width="12%">
              QQ号
            </th>
            <th width="12%">
              电子邮箱
            </th>
            <th width="6%">
              等级
            </th>
            <th width="10%">
              用户组
            </th>
            <th width="12%">
              操作
            </th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${listtu }" var="tu" begin="0" end="9">
          <tr>
            <td>
              <input type="text" name="uid" value="${tu.getUid() }" class="form-control">
            </td>
            <td>
              <input type="text" name="username" value="${tu.getUsername() }" class="form-control">
            </td>
            <td>
              <input type="text" name="password" value="${tu.getPassword() }" class="form-control">
            </td>
            <td>
              <input type="tel" name="phonenum" value="${tu.getPhonenum() }" class="form-control">
            </td>
            <td>
              <input type="tel" name="qqnum" value="${tu.getQqnum() }" class="form-control">
            </td>
            <td>
              <input type="email" name="email" value="${tu.getEmail() }" class="form-control" placeholder="email">
            </td>
            <td>
              <input type="tel" name="grade" value="${tu.getGrade() }" class="form-control">
            </td>
            <td>
              <input type="text" name="positi" value="${tu.getPositi() }" class="form-control">
            </td>
            <td>
              <button type="button" class="btn btn-success" title="修改"><span class="glyphicon glyphicon-ok"></span></button>&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-danger" title="删除"><span class="glyphicon glyphicon-remove"></span></button>
            </td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>

      <!-- 帖子管理 -->
      <div id="postManager" style="display: none;text-align: center;">
      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th width="12%">
              帖子ID
            </th>
            <th width="12%">
              版块ID
            </th>
            <th width="12%">
              用户UID
            </th>
            <th width="12%">
              帖子标题
            </th>
            <th width="12%">
              帖子内容
            </th>
            <th width="12%">
              帖子时间
            </th>
            <th width="12%">
              帖子展图
            </th>
            <th width="12%">
              操作
            </th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${listtp }" var="tp" begin="0" end="9">
          <tr>
            <td>
              <input type="text" name="postid" value="${tp.getPostid() }" class="form-control">
            </td>
            <td>
              <input type="text" name="forumid" value="${tp.getForumid() }" class="form-control">
            </td>
            <td>
              <input type="text" name="uid" value="${tp.getUid() }" class="form-control">
            </td>
            <td>
              <input type="text" name="posttitle" value="${tp.getPosttitle() }" class="form-control">
            </td>
            <td>
              <input type="text" name="postcontent" value="${tp.getPostcontent() }" class="form-control">
            </td>
            <td>
              <input type="text" name="posttime" value="${tu.getPosttime() }" class="form-control">
            </td>
            <td>
              <input type="text" name="pic" value="${tu.getPic() }" class="form-control">
            </td>
            <td>
              <button type="button" class="btn btn-success" title="修改"><span class="glyphicon glyphicon-ok"></span></button>&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-danger" title="删除"><span class="glyphicon glyphicon-remove"></span></button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      </div>

      <!-- 回帖管理 -->
      <div id="replyManager" style="display: none;text-align: center;">
      <table class="table table-hover table-bordered">
        <thead>
          <tr>
            <th width="12%">
              帖子ID
            </th>
            <th width="12%">
              版块ID
            </th>
            <th width="12%">
              用户UID
            </th>
            <th width="12%">
              帖子标题
            </th>
            <th width="12%">
              帖子内容
            </th>
            <th width="12%">
              帖子时间
            </th>
            <th width="12%">
              帖子展图
            </th>
            <th width="12%">
              操作
            </th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${listtr }" var="tr" begin="0" end="9">
          <tr>
            <td>
              <input type="text" name="postid" value="1" class="form-control">
            </td>
            <td>
              <input type="text" name="forumid" value="1" class="form-control">
            </td>
            <td>
              <input type="text" name="uid" value="323" class="form-control">
            </td>
            <td>
              <input type="text" name="posttitle" value="posttitle" class="form-control">
            </td>
            <td>
              <input type="text" name="postcontent" value="postcontent" class="form-control">
            </td>
            <td>
              <input type="text" name="posttime" value="2017-02-03 12:12:12" class="form-control">
            </td>
            <td>
              <input type="text" name="pic" value="pic_post/default.png" class="form-control">
            </td>
            <td>
              <button type="button" class="btn btn-success" title="修改"><span class="glyphicon glyphicon-ok"></span></button>&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="button" class="btn btn-danger" title="删除"><span class="glyphicon glyphicon-remove"></span></button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      </div>

    </div>
  </div><!-- /row -->
</div><!-- /container -->
<script type="text/javascript">
$(function(){
  $("#userm").click(function(){
    $("#welcome").hide();
    $("#replyManager").hide();
    $("#postManager").hide();
    $("#userManager").show();
  });
  $("#postm").click(function(){
    $("#welcome").hide();
    $("#replyManager").hide();
    $("#userManager").hide();
    $("#postManager").show();
  });
  $("#replym").click(function(){
    $("#welcome").hide();
    $("#postManager").hide();
    $("#userManager").hide();
    $("#replyManager").show();
  });
});
</script>
<!-- 返回顶部 -->
<a title="返回顶部" onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a>
</body>
</html>