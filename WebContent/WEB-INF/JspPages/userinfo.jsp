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
  <title>个人资料-翼风之下</title>
  <link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  <link rel="icon" href="/pictures/pic_main/icon.png">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/index.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style type="text/css">
    .thumbnails {display: block; margin-bottom: 20px; line-height: 1.42857143; padding: 20px 5px 20px; background-color: whitesmoke; border: 0px; border-radius: 0px; -webkit-transition: border .2s ease-in-out; -o-transition: border .2s ease-in-out; transition: border .2s ease-in-out; }
  </style>
</head>
<body>
<jsp:include page="top.jsp" flush="true"></jsp:include>

<div class="container" style="background-color: whitesmoke;border: 1px solid #ddd;border-radius: 4px;">
  <div class="row clearfix">
    <div id="userinfo" class="col-md-2 column">
      <div class="thumbnails">
        <img alt="120x120" src="/pictures/${user.getHeadportrait() }" style="width: 120px; height: 120px; border-radius: 5px;" />
        <div class="caption">
          <h5><b><a href="${pageContext.request.contextPath }/userdata">更新资料</a></b></h5>
        </div>
      </div>
    </div><!-- /col-md-2 -->
    <div class="col-md-10 column" style="background-color: #fff;min-height: 560px;">
      <div class="page-header"><h1>个人资料</h1></div>
       <div class="table-responsive">
        <h4><b>个人信息UID：${user.getUid() }</b></h4>
         <table class="table table-bordered">
          <tr>
            <td width="100px">手机号</td>
            <td width="150px">${user.getPhonenum() }</td>
            <td width="100px">QQ号</td>
            <td width="400px">${user.getQqnum() }</td>
          </tr>
          <tr>
            <td>生日</td>
            <td>${user.getBirthday() }</td>
            <td>邮箱</td>
            <td>${user.getEmail() }</td>
          </tr>
          <tr>
            <td>签到次数</td>
            <td>${user.getSigninnum() }</td>
            <td>签到积分</td>
            <td>${user.getSigninpoints() }</td>
          </tr>
          <tr>
            <td>用户名</td>
            <td>${user.getUsername() }</td>
            <td>等级</td>
            <td>${user.getGrade() }</td>
          </tr>
          <tr>
            <td>经验值</td>
            <td>${user.getEmpiricvalue() }</td>
            <td>职位</td>
            <td>${user.getPositi() }</td>
          </tr>
          <tr>
            <td>地址</td>
            <td>${user.getAddress() }</td>
            <td>个性签名</td>
            <td>${user.getQianming() }</td>
          </tr>
         </table>
      </div>
      <div class="table-responsive">
        <h4><b>活跃概况</b></h4>
         <table class="table table-bordered table-condensed table-striped">
          <tr>
            <td width="120px">注册IP</td>
            <td width="300px">${user.getRegisterip() }</td>
            <td width="120px">注册时间</td>
            <td width="300px"><fmt:formatDate type="both" value="${user.getRegistrationtime() }" /></td>
          </tr>
          <tr>
            <td>最后访问时间</td>
            <td><fmt:formatDate type="both" value="${user.getOldlogintime() }" /></td>
            <td>本次登录时间</td>
            <td><fmt:formatDate type="both" value="${user.getLogintime() }" /></td>
          </tr>
          <tr>
            <td>上次访问IP</td>
            <td>${user.getIpaddress() }</td>
            <td>访问IP</td>
            <td><p id="ipaddr"></p></td>
          </tr>
         </table>
        </div>
    </div> <!-- /col-md-10 -->
  </div>
</div> <!-- container -->

	<!-- 新浪ip地址api -->
	<script src="http://pv.sohu.com/cityjson?ie=utf-8" ></script>
	<script type="text/javascript">
		var x =returnCitySN.cip+' -- '+returnCitySN.cname;
		document.getElementById("ipaddr").innerHTML=x;
	</script>
<jsp:include page="bottom.jsp" flush="true"></jsp:include>
</body>
</html>