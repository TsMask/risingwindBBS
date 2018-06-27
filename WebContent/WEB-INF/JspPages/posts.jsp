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
	<title>${tf.getForumtitle()}-翼风之下</title>
  	<link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  	<link rel="icon" href="/pictures/pic_main/icon.png">
  	<link rel="stylesheet" href="/risingwind/css/bootstrap.min.css">
  	<link rel="stylesheet" href="/risingwind/css/index.css">
  	<script src="/risingwind/js/jquery.min.js"></script>
  	<script src="/risingwind/js/bootstrap.min.js"></script>
  	<style type="text/css">
	    .panel-primarys {border-color: #fd7b5d; }
	    .panel-headings {padding: 10px 15px; border-bottom: 1px solid transparent; border-top-left-radius: 3px; border-top-right-radius: 3px; font-size: 16px;font-weight: 700;background-color: #fd7b5d;}
	    .media {margin-top: 0px;padding: 18px 15px;border-bottom: 1px solid #dadada; }
	    .media:hover {background-color: #fafafa; border-radius: 5px;} 
	    .media-object {display: block; border-radius: 8px; }
	    .pipe {margin: 0 5px; color: #CCC; } 
	    .sub-infos, .sub-infos a, .sub-infos a:visited {color: #8a8a8a; font-size: 12px; margin-left: 5px; margin-left: 5px;margin-top: 10px} 
	    .sub-infos span {margin: 0 2px; } 
  	</style>
</head>
<body>
<jsp:include page="top.jsp" flush="true"></jsp:include>

<div class="container">
  <div class="row clearfix">
    <div class="col-md-8 column" style="background-color: #ffffff;border: 1px solid #f2f2f2; border-radius: 5px;padding-top: 15px;">

	    <ol class="breadcrumb" style="margin-bottom: 5px;">
	      <li><a href="${pageContext.request.contextPath }" title="首页"><span class="glyphicon glyphicon-home"></span></a></li>
	      <li class="active"><a href="posts${tf.getForumid()}">${tf.getForumtitle()}</a></li>
	    </ol>
    
		<c:forEach items="${listPost }" var="tp" varStatus="is" begin="${pageover+0 }" end="${pageover+9 }">
	    <div class="media">
	      <a class="media-left" href="${pageContext.request.contextPath }/otherinfo${listUser[is.index].getUid() }/${tf.getForumid() }">
	        <img class="media-object" alt="50x50" src="/pictures/${listUser[is.index].getHeadportrait() }" style="width: 50px; height: 50px;">
	      </a>
	      <div class="media-body">
	        <h4 class="media-heading"><a href="reply${tp.getPostid() }">${tp.getPosttitle() }</a></h4>
	      <div class="sub-infos">
	        <a href="${pageContext.request.contextPath }/otherinfo${listUser[is.index].getUid() }/${tf.getForumid() }">${listUser[is.index].getUsername() }</a>
	        <span class="pipe">|</span>浏览：<span>${tp.getPageviews() }</span>
	        <span class="pipe">|</span>回复：<span>${tp.getRegen() }</span>
	        <span></span>
	        <span title="发帖时间"><fmt:formatDate type="both" value="${tp.getPosttime() }" /></span>
	      </div>
	      </div>
	    </div>         
		</c:forEach>
           
	      <div style="text-align: center;">
	         <ul class="pagination">
                <li><a href="${pageContext.request.contextPath }/posts${tf.getForumid()}/<c:if test="${id-1>0 }">${id-1}</c:if>">«</a></li>
   				<li id="page1" class="active"><a href="${pageContext.request.contextPath }/posts${tf.getForumid()}/1">1</a></li>
   				<c:forEach items="${listPost }" varStatus="ov" begin="0" end="15">
  					<li id="page${ov.index+2 }"><a href="${pageContext.request.contextPath }/posts${tf.getForumid()}/${ov.index+2 }">${ov.index+2 }</a></li>
   				</c:forEach>
   				<li><a href="${pageContext.request.contextPath }/posts${tf.getForumid()}/${id+1}">»</a></li>
	         </ul>
	       </div>
           <script type="text/javascript">
          	$(function(){
				$("<c:if test="${id>1 }">#page1</c:if>").removeClass("active");
          		$("<c:if test="${id>1 }">#page${id }</c:if>").addClass("active");
          	});
          </script>
    </div>
    <div class="col-md-4 column visible">
		<jsp:include page="right.jsp" flush="true"></jsp:include>
    </div>
  </div>
</div>

<jsp:include page="bottom.jsp" flush="true"></jsp:include>
</body>
</html>