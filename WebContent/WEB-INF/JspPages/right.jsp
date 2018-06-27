<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%response.setContentType("text/html");response.setCharacterEncoding("utf-8"); %>

	<h5>${message }</h5>
    <c:choose>
		<c:when test="${user!=null || not empty user }">
	<a href="${pageContext.request.contextPath }/newspost" type="button" class="btn btn-block btn-lg btn-warning" title="发布新帖">
      <span class="glyphicon glyphicon glyphicon glyphicon-edit"></span>&nbsp;&nbsp;&nbsp;&nbsp;发布新帖
    </a>
    <a href="${pageContext.request.contextPath }/signin${user.getUid() }" type="button" class="btn btn-block btn-lg btn-info" title="签到">
      <span class="glyphicon glyphicon glyphicon-flag"></span>&nbsp;&nbsp;&nbsp;&nbsp;签到
    </a>
		</c:when>
		<c:otherwise>
	<button type="button" class="btn btn-block btn-lg btn-warning" title="发布新帖" onclick="alert('请登录后操作！');">
       <span class="glyphicon glyphicon glyphicon glyphicon-edit"></span>&nbsp;&nbsp;&nbsp;&nbsp;发布新帖
    </button>
    <button type="button" class="btn btn-block btn-lg btn-info" title="签到" onclick="alert('请登录后操作！');">
       <span class="glyphicon glyphicon glyphicon-flag"></span>&nbsp;&nbsp;&nbsp;&nbsp;签到
    </button>
		</c:otherwise>
	</c:choose>
      <c:if test="${user!=null && not empty user }">
      <div class="panel panel-primarys">
        <div class="panel-headings">用户姓名:${user.getUsername() }</div>
        <div class="list-group">
          <ul style="list-style: none;">
            <li>本次登录时间:<fmt:formatDate type="both" value="${user.getLogintime() }" /></li>
            <li>上次登录时间:<fmt:formatDate type="both" value="${user.getOldlogintime() }" /></li>
            <li>签到次数:${user.getSigninnum() }</li>
            <li>经验值:${user.getEmpiricvalue() }</li>
          </ul>
        </div>
      </div>
	  </c:if>
    <div class="panel panel-primarys">
      <div class="panel-headings">热贴排行</div>
      <div class="panel-bodys">
       <img style="width:100%;height: 60px;" src="/pictures/pic_main/brand.png" />
      </div>
      <ul style="list-style: none;padding: 12px 16px;">
        <c:forEach items="${tpB }" var="tpb" begin="0" end="9">
        <li>
          <a href="${pageContext.request.contextPath }/reply${tpb.getPostid() }" title="${tpb.getPosttitle() } " style="display: block;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${tpb.getPosttitle() }</a>
        </li>
        </c:forEach>
      </ul>
    </div>

      <div class="panel panel-primarys">
        <div class="panel-headings">推荐版块</div>
        <div class="list-group">
        <c:forEach items="${tfr }" var="tfr" begin="0" end="6" varStatus="isr">
         <a href="${pageContext.request.contextPath }/posts${tfr.getForumid()}" class="list-group-item">${tfr.getForumtitle() }<span class="badge" title="帖子量">${countFPost[isr.index] }</span></a>
        </c:forEach>
        </div>
      </div>

      <div class="panel panel-primarys">
        <div class="panel-headings">论坛APP</div>
         <img style="width: 100%;padding: 5px 10px;" src="/pictures/pic_main/app.png" />
         <p align="center">APP</p>
      </div>