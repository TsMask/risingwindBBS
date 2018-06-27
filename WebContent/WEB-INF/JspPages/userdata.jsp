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
	<title>设置个人信息-翼风之下</title>
	<link rel="apple-touch-icon" href="img/icon.png">
	<link rel="icon" href="img/icon.png">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/index.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
  <link href="umeditor1.2.3/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="umeditor1.2.3/third-party/jquery.min.js"></script>
  <script type="text/javascript" src="umeditor1.2.3/third-party/template.min.js"></script>
  <script type="text/javascript" charset="utf-8" src="umeditor1.2.3/umeditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="umeditor1.2.3/umeditor.min.js"></script>
  <script type="text/javascript" src="umeditor1.2.3/lang/zh-cn/zh-cn.js"></script>
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  <script src="js/bootstrap-datetimepicker.min.js"></script>  
  <style type="text/css">
    .panel-headings {padding: 10px 15px; border-bottom: 2px solid #ddd; border-top-left-radius: 3px; border-top-right-radius: 3px; font-size: 23px; font-weight: 700; }
    .list-group a {position: relative;display: block; color: #444444; padding: 10px 15px; margin-bottom: -1px; border-bottom: 1px solid #ddd;}
    .list-group a>.badge {float: right; } 
    #baseData {margin-top: 30px;}
    #infoData {margin-top: 30px;}
    #userPhoto {margin-top: 30px;}
  </style>
</head>
<body>
<jsp:include page="top.jsp" flush="true"></jsp:include>

<div class="container">
  <ol class="breadcrumb" style="margin-bottom: 5px;">
    <li><a href="${pageContext.request.contextPath }" title="首页"><span class="glyphicon glyphicon-home"></span></a></li>
	<li><a href="${pageContext.request.contextPath }/userinfo">个人资料</a></li>
	<li class="active">设置</li>
  </ol>
</div>
	    


<div class="container" style="background-color: whitesmoke;border: 1px solid #ddd;border-radius: 4px;">
  <!-- 用户信息 -->
  <div class="row clearfix">
    <div class="col-md-2 column">
      <div class="panel-primarys">
        <div class="panel-headings">设置</div>
        <div class="list-group">
         <a id="photo" href="javascript:void(0)">修改头像</a>
         <a id="date" href="javascript:void(0)">个人资料</a>
        </div>
      </div>
    </div>
    <div class="col-md-10 column" style="background-color: #fff;min-height: 560px;">
      <!-- 修改头像 -->
      <div id="userPhoto" style="display: block;">
          <div class="row clearfix">
            <div class="col-md-12 column">
             <div class="thumbnail">
              <img src="/pictures/${user.getHeadportrait() }" alt="用户头像200x200" style="width: 200px;height: 200px;display: block;">
             </div>
              <form class="form-horizontal" role="updateHeadportrait" action="${pageContext.request.contextPath }/updateHeadportrait" method="post" enctype="multipart/form-data">
                <div class="form-group">
                  <label for="headPortrait" class="col-sm-3 control-label">上传头像：</label>
                  <div class="col-sm-4">
                 	<input type="hidden" class="form-control" id="uid" name="uid" value="${user.getUid() }"/>
                    <input type="file" class="form-control" id="headPortrait" name="headPortrait"/>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-4">
                     <button type="submit" class="btn btn-info">提交保存</button>
                  </div>
                </div>
              </form>
              <h1 style="color:red;text-align:center;">${message }</h1>
            </div>
          </div>
      </div>
      <!-- 个人资料 -->
      <div id="userData" style="display:none;">
        <ul class="nav nav-tabs">
         <li id="b" class="active"><a id="bad" href="javascript:void(0)">基本资料</a></li>
         <li id="i"><a id="ifd" href="javascript:void(0)">个人信息</a></li>
        </ul>
        <!-- 基本资料 -->
        <div id="baseData" style="display: block;">
          <div class="row clearfix">
            <div class="col-md-12 column">
              <form class="form-horizontal" role="updateBaseDate" action="${pageContext.request.contextPath }/updateBaseDate" method="post">
                <div class="form-group">
                   <label for="userName" class="col-sm-2 control-label">用户名：</label>
                  <div class="col-sm-4">
                    <input type="hidden" class="form-control" id="uid" name="uid" value="${user.getUid() }"/>
                    <input type="text" class="form-control" id="username" name="username" value="${user.getUsername() }" />
                  </div>
                </div>
                <div class="form-group">
                  <label for="sex" class="col-sm-2 control-label">性别：</label>
                  <div class="col-sm-4">
                  <label><input type="radio" name="sex" id="man" value="男" <c:if test="${user.getSex()== '男'}">checked="checked"</c:if>>男</label>&nbsp;&nbsp;
                  <label><input type="radio" name="sex" id="walmen" value="女" <c:if test="${user.getSex()== '女'}">checked="checked"</c:if>>女</label>
                  </div>
                </div>
                <div class="form-group">
                  <label for="birthday" class="col-sm-2 control-label">生日：</label>
                  <div class="col-sm-4">
                  <input type="text" value="${user.getBirthday() }" id="birthday" name="birthday" class="form-control">
                  </div>
                </div>
                <script type="text/javascript">$('#birthday').datetimepicker({format: 'yyyy-mm-dd'}); </script>
                <div class="form-group">
                   <label for="address" class="col-sm-2 control-label">地址：</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="address" name="address" value="${user.getAddress() }" />
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-4">
                     <button type="submit" class="btn btn-info">提交保存</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- 个人信息 -->
        <div id="infoData" style="display: none;">
          <div class="row clearfix">
            <div class="col-md-12 column">
              <form class="form-horizontal" role="updateInfoData" action="${pageContext.request.contextPath }/updateInfoData" method="post">
                <div class="form-group">
                   <label for="phoneNum" class="col-sm-2 control-label">手机号：</label>
                  <div class="col-sm-4">
                    <input type="hidden" class="form-control" id="uid" name="uid" value="${user.getUid() }" />
                    <input type="text" class="form-control" id="phonenum" name="phonenum" value="${user.getPhonenum() }" />
                  </div>
                </div>
                <div class="form-group">
                   <label for="qqNum" class="col-sm-2 control-label">QQ号：</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" id="qqnum" name="qqnum" value="${user.getQqnum() }" />
                  </div>
                </div>
                <div class="form-group">
                  <label for="email" class="col-sm-2 control-label">邮箱：</label>
                  <div class="col-sm-4">
                    <input type="email" class="form-control" id="email" name="email" value="${user.getEmail() }" />
                  </div>
                </div>
                <div class="form-group">
                   <label for="qianming" class="col-sm-2 control-label">个性签名：</label>
                  <div class="col-sm-4">
                    <div style="width: 100%;padding-bottom: 20px;">
                        <!--style给定宽度可以影响编辑器的最终宽度-->
                        <script type="text/plain" id="myEditor" name="qianming" style="height:120px;">
                          <p>${user.getQianming() }</p>
                        </script>
                        <script type="text/javascript">
                          //实例化编辑器
                          var um = UM.getEditor('myEditor',{toolbar:['bold strikethrough|','link emotion']});
                        </script>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-4">
                     <button type="submit" class="btn btn-info">提交保存</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- /col-md-10 -->
    <script type="text/javascript">
      $(document).ready(function(){
       $("#photo").click(function(){
          $("#userData").hide();
          $("#userPhoto").show();
        });
        $("#date").click(function(){
          $("#userPhoto").hide();
          $("#userData").show();
        });
       $("#bad").click(function(){
          $("#infoData").hide();
          $("#i").removeClass("active");
          $("#b").addClass("active");
          $("#baseData").show();
        });
       $("#ifd").click(function(){
          $("#baseData").hide();
          $("#b").removeClass("active");
          $("#i").addClass("active");
          $("#infoData").show();
        });
      });
    </script>
  </div><!-- /用户信息 -->
</div> <!-- container -->


<jsp:include page="bottom.jsp" flush="true"></jsp:include>
</body>
</html>