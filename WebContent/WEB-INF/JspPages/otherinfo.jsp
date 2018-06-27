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
  <title>${other.getUsername() }的个人资料-翼风之下</title>
  <link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  <link rel="icon" href="/pictures/pic_main/icon.png">
  <link rel="stylesheet" href="/risingwind/css/bootstrap.min.css">
  <link rel="stylesheet" href="/risingwind/css/index.css">
  <script src="/risingwind/js/jquery.min.js"></script>
  <script src="/risingwind/js/bootstrap.min.js"></script>
  <style type="text/css">
    .thumbnails {display: block; margin-bottom: 20px; line-height: 1.42857143; padding: 20px 5px 20px; background-color: whitesmoke; border: 0px; border-radius: 0px; -webkit-transition: border .2s ease-in-out; -o-transition: border .2s ease-in-out; transition: border .2s ease-in-out; }
  </style>
</head>
<body>
<jsp:include page="top.jsp" flush="true"></jsp:include>
	<div class="container">
	  <ol class="breadcrumb" style="margin-bottom: 5px;">
		<li><a href="${pageContext.request.contextPath }" title="首页"><span class="glyphicon glyphicon-home"></span></a></li>
		<li><a href="${pageContext.request.contextPath }/posts${forumid }">后退</a></li>
	    <li class="active">${other.getUsername() }的个人资料</li>
	  </ol>
	</div>
<div class="container" style="background-color: whitesmoke;border: 1px solid #ddd;border-radius: 4px;">
  <div class="row clearfix">
    <div id="userinfo" class="col-md-2 column">
      <div class="thumbnails">
        <img alt="120x120" src="/pictures/${other.getHeadportrait() }" style="width: 120px; height: 120px; border-radius: 5px;" />
      </div>
    </div><!-- /col-md-2 -->
    <div class="col-md-10 column" style="background-color: #fff;min-height: 560px;">
      <div class="page-header"><h1>${other.getUsername() }的个人资料</h1></div>
       <div class="table-responsive">
         <table class="table table-bordered">
          <tr>
            <td width="100px">签到次数</td>
            <td width="150px">${other.getSigninnum() }</td>
            <td width="100px">签到积分</td>
            <td width="400px">${other.getSigninpoints() }</td>
          </tr>
          <tr>
            <td>性别</td>
            <td>${other.getSex() }</td>
            <td>等级</td>
            <td>${other.getGrade() }</td>
          </tr>
          <tr>
            <td>经验值</td>
            <td>${other.getEmpiricvalue() }</td>
            <td>职位</td>
            <td>${other.getPositi() }</td>
          </tr>
          <tr>
            <td>地址</td>
            <td>${other.getAddress() }</td>
            <td>个性签名</td>
            <td>${other.getQianming() }</td>
          </tr>
         </table>
      </div>
      <div class="table-responsive">
        <h4><b>活跃概况</b></h4>
         <table class="table table-bordered table-condensed table-striped">
          <tr>
            <td width="120px">注册IP</td>
            <td width="300px">${other.getRegisterip() }</td>
            <td width="120px">注册时间</td>
            <td width="300px"><fmt:formatDate type="both" value="${other.getRegistrationtime() }" /></td>
          </tr>
          <tr>
            <td>最后访问时间</td>
            <td><fmt:formatDate type="both" value="${other.getOldlogintime() }" /></td>
            <td>本次登录时间</td>
            <td><fmt:formatDate type="both" value="${other.getLogintime() }" /></td>
          </tr>
          <tr>
            <td>上次访问IP</td>
            <td>${other.getIpaddress() }</td>
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