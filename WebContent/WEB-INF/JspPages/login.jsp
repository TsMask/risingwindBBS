<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>翼风之下-登录与注册</title>
  	<link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  	<link rel="icon" href="/pictures/pic_main/icon.png">
  	<link rel="stylesheet" href="css/bootstrap.min.css">
  	<link rel="stylesheet" href="css/index.css">
  	<link rel="stylesheet" href="css/login.css">
  	<script src="js/jquery.min.js"></script>
  	<script src="js/bootstrap.min.js"></script>
  	<script type="text/javascript">
	    $(document).ready(function(){
	     $(".btn_register").click(function(){
	        $("#login").hide();
	        $("#register").show();
	      });
	      $(".btn_forget").click(function(){
	        $("#login").hide();
	        $("#forget").show();
	      });
	     $(".btn_back").click(function(){
	        $("#forget").hide();
	        $("#register").hide();
	        $("#login").show();
	      });
	    });
	  </script>
</head>
<body>
  <div class="container main">

    <!-- 登录 -->
    <div id="login" style="display: block;">
      <div class="login_top">
          <a class="btn_index" href="${pageContext.request.contextPath }" title="首页"><strong>首页</strong></a>
          <a class="btn_register" href="javascript:void(0)" title="用户注册"><strong>用户注册</strong></a>
          <a class="btn_forget" href="javascript:void(0)" title="忘记密码？"><strong>忘记密码？</strong></a>
          <img src="/pictures/pic_main/loginLogo.jpg" width="100px;" height="100px;">
          <h4 class="login_title">翼风之下-帐号登录</h4>
      </div>
      <div class="login_body">
        <form action="${pageContext.request.contextPath }/userlogin" method="post" role="login">
         <div class="logo_input">
          <label class="labelbox">
           <input type="text" name="username" id="username" autocomplete="off" placeholder="用户名/手机号/邮箱">
          </label>
          <label class="labelbox">
           <input type="password" name="password" id="password" autocomplete="off" placeholder="密码">
          </label>
          <!-- 多选 -->
          <div class="checkbox" style="text-align: end;">
             <label>
              <input type="checkbox" value="">记住密码
             </label> 
             <label>
              <input type="checkbox" value="">两周内保持登录
             </label>
          </div>
          <!-- 错误提示 -->
          <div class="err_tip" style="display: none;">
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
        <h1 style="color: red;text-align: center;">${message }</h1>
      </div>
    </div>
    
    <!-- 注册 -->
    <div id="register" style="display: none;">
      <div class="login_top">
          <a class="btn_back" href="javascript:void(0)" title="返回登录"><strong>已拥有账号</strong></a>
          <img src="/pictures/pic_main/loginLogo.jpg" width="100px;" height="100px;">
          <h4 class="login_title">翼风之下-帐号注册</h4>
      </div>
      <div class="register_body">
        <div class="row clearfix">
          <div class="col-md-12 column">
            <form class="form-horizontal" action="${pageContext.request.contextPath }/userregister" method="post" role="register">
              <div class="form-group">
                 <label for="userName" class="col-sm-4 control-label">用户名：</label>
                <div class="col-sm-6">
                  <input type="text" class="form-control" name="username" id="username" placeholder="3-10个字符" maxlength="10" />
                </div>
              </div>
              <div class="form-group">
                 <label for="password" class="col-sm-4 control-label">密码：</label>
                <div class="col-sm-6">
                  <input type="password" class="form-control" name="password" id="password" placeholder="3-16个字符" maxlength="16" />
                </div>
              </div>
              <div class="form-group">
                 <label for="repassword" class="col-sm-4 control-label">确认密码：</label>
                <div class="col-sm-6">
                  <input type="password" class="form-control" name="repassword" id="repassword" placeholder="3-16个字符" maxlength="16" />
                </div>
              </div>
              <div class="form-group">
                 <label for="email" class="col-sm-4 control-label">电子邮箱：</label>
                <div class="col-sm-6">
                  <input type="email" class="form-control" name="email" id="email" />
                  <input type="hidden" class="form-control" name="registrationtime" id="registrationtime" />
                  <input type="hidden" class="form-control" name="registerip" id="registerip"/>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-4 col-sm-6">
                   <button type="submit" class="btn btn-info">提交注册</button>
                   <button type="reset" class="btn btn-danger">取消</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
	<!-- 新浪ip地址api -->
	<script src="http://pv.sohu.com/cityjson?ie=utf-8" ></script>
	<script type="text/javascript">
		var x =returnCitySN.cip+' -- '+returnCitySN.cname;
		$("#ipaddress").val(x); 
		$("#registerip").val(x); 
		var d = new Date();
		$("#registrationtime").val(d.toUTCString());
		$("#logintime").val(d.toUTCString());
	</script>
	
    <!-- 忘记密码 -->
    <div id="forget" style="display: none;">
      <div class="login_top">
          <a class="btn_back" href="javascript:void(0)" title="返回登录"><strong>返回登录</strong></a>
          <img src="/pictures/pic_main/loginLogo.jpg" width="100px;" height="100px;">
          <h4 class="login_title">翼风之下-密码重置</h4>
      </div>
      <div class="register_body">
        <div class="row clearfix">
          <div class="col-md-12 column">
            <form class="form-horizontal" action="${pageContext.request.contextPath }/userforget" method="post" role="forget">
              <div class="form-group">
                 <label for="userName" class="col-sm-4 control-label">用户名：</label>
                <div class="col-sm-6">
                  <input type="text" class="form-control" name="username" id="username" placeholder="3-10个字符" maxlength="10" />
                </div>
              </div>
              <div class="form-group">
                 <label for="password" class="col-sm-4 control-label">密码：</label>
                <div class="col-sm-6">
                  <input type="password" class="form-control" name="password" id="password" placeholder="3-16个字符" maxlength="16" />
                </div>
              </div>
              <div class="form-group">
                 <label for="repassword" class="col-sm-4 control-label">确认密码：</label>
                <div class="col-sm-6">
                  <input type="password" class="form-control" name="repassword" id="repassword" placeholder="3-16个字符" maxlength="16" />
                </div>
              </div>
              <div class="form-group">
                 <label for="email" class="col-sm-4 control-label">电子邮箱：</label>
                <div class="col-sm-6">
                  <input type="email" class="form-control" name="email" id="email" />
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-4 col-sm-6">
                   <button type="submit" class="btn btn-info">提交注册</button>
                   <button type="reset" class="btn btn-danger">取消</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

  </div> <!-- /main -->

</body>
</html>