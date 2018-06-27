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
	<title>翼风之下后台-管理员登录</title>
  	<link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  	<link rel="icon" href="/pictures/pic_main/icon.png">
  	<link rel="stylesheet" href="css/bootstrap.min.css">
  	<link rel="stylesheet" href="css/index.css">
  	<link rel="stylesheet" href="css/login.css">
  	<script src="js/jquery.min.js"></script>
  	<script src="js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container main">
    <div id="adminlogin">
      <div class="login_top">
         <img src="/pictures/pic_main/loginLogo.jpg" width="100px;" height="100px;">
          <h4 class="login_title">翼风之下后台-管理员登录</h4>
      </div>
      <div class="login_body">
        <form action="${pageContext.request.contextPath }/adminservice" method="post" role="adminlogin">
         <div class="logo_input">
          <label class="labelbox">
           <input type="text" name="adminstrator" id="adminstrator" autocomplete="off" placeholder="管理员账号">
          </label>
          <label class="labelbox">
           <input type="password" name="supervisorpassword" id="supervisorpassword" autocomplete="off" placeholder="密码">
          </label>
          <!-- 错误提示 -->
          <div class="err_tip" style="display: block;">
           <em class="glyphicon glyphicon-info-sign"></em>
           <span class="err_content">当前未连接服务器！</span>
          </div>
         </div>
         <div class="btn-bg">
           <input type="submit" value="立即登录">
           <input type="hidden" class="form-control" name="ipaddress" id="ipaddress" />
           <input type="hidden" class="form-control" name="logintime" id="logintime"/>
         </div>
        </form>
        <h3 style="color: red;text-align: center;">${message }</h3>
        	<!-- 新浪ip地址api -->
		<script src="http://pv.sohu.com/cityjson?ie=utf-8" ></script>
		<script type="text/javascript">
			var x =returnCitySN.cip+' -- '+returnCitySN.cname;
			$("#ipaddress").val(x); 
			$("#logintime").val(new Date().toUTCString());
		</script>
      </div>
    </div>
  </div> <!-- /main -->
</body>
</html>