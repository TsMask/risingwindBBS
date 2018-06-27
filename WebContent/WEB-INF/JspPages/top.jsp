<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%response.setContentType("text/html");response.setCharacterEncoding("utf-8"); %>



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
                <a class="navbar-brand" href="${pageContext.request.contextPath }" title="翼风之下"><img src="/pictures/pic_main/brand.png" style="position: relative;top: -30px;"></a>  
            </div>  
            <div class="collapse navbar-collapse" id="example-navbar-collapse"> 
                <!-- 左边 -->
                <ul class="nav navbar-nav">  
                    <li><a href="${pageContext.request.contextPath }">首页</a></li>  
                    <li><a href="${pageContext.request.contextPath }/forums">版块</a></li>  
                    <li><a href="${pageContext.request.contextPath }/posts2">极客播报</a></li> 
                    <li><a href="http://www.miui.com/index.html" target="_blank">原仿MIUI论坛首页</a></li>  
                    <li><a href="/pictures/risingwindforum0008.apk">APP下载</a></li>  
                   <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多<strong class="caret"></strong></a>
                    <ul class="dropdown-menu" style="background-color: rgba(253, 100, 64, 0.74902);">
                      <li>
                     	 <a href="${pageContext.request.contextPath }/posts4">游戏</a>
                         
                      </li>
                      <li>
                         <a href="${pageContext.request.contextPath }/posts9">Bug反馈</a>
                      </li>
                    </ul>
                  </li>
                </ul> <!-- /左边 -->
                <!-- 右边 -->
                <ul class="nav navbar-nav navbar-right">
                  <!-- 用户信息头像 -->
			<c:choose>  
   				<c:when test="${user!=null && not empty user }">
                  <li class="dropdown">
                   <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                   <img src="/pictures/${user.getHeadportrait() }" style="width:30px;height:25px; border-radius: 50%;"></a>
                   <ul class="dropdown-menu" role="menu" style="background-color: rgba(0,0,0,.65);">
                    <li class="dropdown-header" style="color: red;">用户：${user.getUsername() }</li>
                    <li><a href="javascript:void(0)">职位：${user.getPositi() }</a></li>
                    <li><a href="javascript:void(0)">积分：${user.getSigninpoints() }</a></li>
                    <li><a href="javascript:void(0)">帖子：34</a></li>
                    <li><a href="${pageContext.request.contextPath }/userinfo">更多信息</a></li>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath }/outlogin${user.getUid()}"><button class="btn btn-like btn-block btn-danger">退出登录</button></a></li>
                   </ul>
                  </li>
   				</c:when>  
   				<c:otherwise>
   				    <li><a href="${pageContext.request.contextPath }/login" title="-_-|| 请点击登录"><img src="/pictures/pic_user/noLogin.jpg" style="width:30px;height:25px; border-radius: 50%;"></a></li>
   				</c:otherwise>  
			</c:choose> 
                  <li>
                    <!-- 搜索 -->
                    <form class="navbar-form navbar-right" action="#" method="post" role="search">
                      <div class="form-group">
                        <input type="text" class="form-control" placeholder="搜索"/>
                      </div>
                      <button type="submit" class="btn btn-default btn-primary">搜索</button>
                    </form>
                  </li>
                </ul><!-- /右边 -->
            </div>  
        </div>  
    </nav>
</div>

<!-- 滚动条导航栏渐变 -->
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