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
  <title>翼风之下-论坛社区</title>
  <link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  <link rel="icon" href="/pictures/pic_main/icon.png">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/index.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="WEB-INF/JspPages/top.jsp" flush="true"></jsp:include>

<!-- 轮播图 -->
<div id="banner" class="container">
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- 轮播（carousel）指标 -->
  <ol class="carousel-indicators">
   <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
   <li data-target="#myCarousel" data-slide-to="1"></li>
   <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <!-- 轮播（carousel）项目图 建议用高350px -->
  <div class="carousel-inner img-rounded">

  <c:forEach items="${tpB }" var="tpb" begin="0" end="2" varStatus="iso">
   <div class="item" id="carousel${iso.index+1 }">
    <a href="${pageContext.request.contextPath }/reply${tpb.getPostid() }" title="${tpb.getPosttitle() }"><img src="/pictures/${tpb.getPic() }" alt="${tpb.getPosttitle() }"></a>
   </div>
  </c:forEach>
  </div>
  <!-- 轮播（carousel）导标 -->
  <a href="#myCarousel" class="carousel-control ctl-left" data-slide="prev">
   <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
   <span class="sr-only">Previous</span>
  </a>
  <a href="#myCarousel" class="carousel-control ctl-right" data-slide="next">
   <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
   <span class="sr-only">Next</span>
  </a>
  <!-- 轮播跳转时间 -->
   <script type="text/javascript">
   $(function(){
   		$("#carousel1").addClass("active");
   		$('#myCarousel').carousel('cycle');
   });
   </script>
 </div>
</div>

<!-- 主体 -->
<div class="container">
  <div class="row clearfix">
    <div class="col-md-8 column" style="border: 1px #eaeaea solid; background-color: #fff;">
    
 		<c:forEach items="${tpB }" var="tpb" varStatus="isb" begin="${pageover+3 }" end="${pageover+6 }">
           <div class="thumbnails">
            <h3 style="display: block;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"> <a href="${pageContext.request.contextPath }/reply${tpb.getPostid() }" title="${tpb.getPosttitle() }">${tpb.getPosttitle() }</a></h3>
            <a href="${pageContext.request.contextPath }/reply${tpb.getPostid() }"><img src="/pictures/${tpb.getPic() }" alt="${tpb.getPosttitle() }" style="height: 200px; width: 100%; display: block;border-radius: 6px;"></a>
            <p>&nbsp;</p>
            <div class="capttion">
             <div class="article_info clearfix">
                  <p class="article_info_left">
                  	  <a href="/risingwind/otherinfo${ltutpb[isb.index].getUid() }/${tpb.getForumid() }">
                      <img src="/pictures/${ltutpb[isb.index].getHeadportrait() }">
                      <span class="author">${ltutpb[isb.index].getUsername() }</span></a> 
                      <span>发布于 <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${tpb.getPosttime() }" /></span>
                  </p>
                  <p class="article_info_right">
                      <span class="article_info_right_0">浏览:${tpb.getPageviews() }</span>
                      <span class="article_info_right_1">评论:${tpb.getRegen() }</span>
                  </p>
              </div>
            </div>
           </div>
		</c:forEach>
		
          <div style="text-align: center;">
             <ul class="pagination">
                <li><a href="${pageContext.request.contextPath }/<c:if test="${id-1>0 }">index${id-1 }</c:if>">«</a></li>
                <li id="page1" class="active"><a href="${pageContext.request.contextPath }/index1">1</a></li>
                <c:forEach items="${tpB }" varStatus="ov" begin="0" end="4">
                <li id="page${ov.index+2 }"><a href="${pageContext.request.contextPath }/index${ov.index+2 }">${ov.index+2 }</a></li>
                </c:forEach>
                <li><a href="${pageContext.request.contextPath }/index${id+1 }">»</a></li>
             </ul>
          </div>
          <script type="text/javascript">
          	$(function(){
			   $("<c:if test="${id>1 }">#page1</c:if>").removeClass("active");
          	   $("<c:if test="${id>1 }">#page${id }</c:if>").addClass("active");
          	});
          </script>
 
    </div>
    <div id="tf" class="col-md-4 column visible">
      <jsp:include page="WEB-INF/JspPages/right.jsp" flush="true"></jsp:include>
    </div><!-- /col-md-4 column -->
  </div>
</div>

<jsp:include page="WEB-INF/JspPages/bottom.jsp" flush="true"></jsp:include>
</body>
</html>