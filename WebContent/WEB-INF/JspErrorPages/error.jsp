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
  <title>翼风之下-论坛社区</title>
  <link rel="apple-touch-icon" href="img/icon.png">
  <link rel="icon" href="img/icon.png">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/index.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../JspPages/top.jsp" flush="true"></jsp:include>
	<h1 style="text-align: center;">${message }</h1>
	<div style="width:200px; margin:0 auto;color:red;">
		<h2>《累》</h2>
		<p>人啊，</p>
		<p>不怕身累，就怕心累！</p>
		<p>身累，可以歇过来；</p>
		<p>心累，该如何走出来？</p>
		<p>人啊，</p>
		<p>不怕没人疼，就怕没人懂！</p>
		<p>没人疼，可以自己疼；</p>
		<p>没人懂，该如何说出来！</p>
		<p>再能干的人，也有疲惫；</p>
		<p>再乐观的人，也有流泪；</p>
		<p>再无畏的人，也有后退；</p>
		<p>再坚强的人，也有心碎！</p>
		<p>别让自己撑得那么狼狈，</p>
		<p>你不是那铁打的壁垒；</p>
		<p>别让自己装得那么无所谓</p>
		<p>你也会偶尔脆弱一回！</p>
		<p>我们是人，不是神，</p>
		<p>难过的时候也需要人陪；</p>
		<p>我们是人，不是神，</p>
		<p>心累的时候也需要安慰！</p>
		<p>其实，我们需要的都不多：</p>
		<p>哪怕是一杯热水，</p>
		<p>也能化解劳累；</p>
		<p>哪怕是一个拥抱，</p>
		<p>也能暖透心肺！</p>
		<p>生活忙碌，</p>
		<p>请体谅一个人的辛苦；</p>
		<p>赚钱不易，</p>
		<p>请看到一个人的付出！</p>
		<p>有时：</p>
		<p>一个理解的眼神，</p>
		<p>一句疼惜的话语，</p>
		<p>一次体贴的陪伴，</p>
		<p>一声真心的懂得，</p>
		<p>就是我们每个人想要的幸福！</p>
	</div>
<jsp:include page="../JspPages/bottom.jsp" flush="true"></jsp:include>
</body>
</html>