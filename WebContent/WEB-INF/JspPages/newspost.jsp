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
  <title>${user.getUsername() }-发表新帖-翼风之下</title>
  <link rel="apple-touch-icon" href="/pictures/pic_main/icon.png">
  <link rel="icon" href="/pictures/pic_main/icon.png">
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
  <style type="text/css">
    .hearlike {border-bottom: 3px solid #eee;padding-bottom: 5px;}
    .hearlike strong {border-bottom: 3px solid #ff5f19;padding: 6px 15px;}
  </style>
</head>
<body>
<jsp:include page="top.jsp" flush="true"></jsp:include>

<div class="container">
  <ol class="breadcrumb" style="margin-bottom: 5px;">
    <li><a href="${pageContext.request.contextPath }" title="首页"><span class="glyphicon glyphicon-home"></span></a></li>
    <li class="active">发表新帖</li>
  </ol>

  <div class="hearlike">
    <strong>发表帖子</strong>
  </div>

</div>
<form action="${pageContext.request.contextPath }/donewspost" method="post" role="donewspost">
<div class="container">
  <!-- 指定版块与帖子名称 -->
  <div class="row clearfix" style="padding-top: 20px;">
    <div class="col-md-2 column">
      <select class="form-control input-sm" name="forumid">
        <option>请选择主题分类</option>
        <c:forEach items="${listtf }" var="tf">
        <option  value="${tf.getForumid() }">${tf.getForumtitle() }</option>
        </c:forEach>
      </select>
    </div>
    <div class="col-md-4 column">
      <input type="hidden" id="uid" name="uid" value="${user.getUid() }">
      <input type="hidden" id="posttime" name="posttime" value="">
      <input type="text" id="postTitle" name="posttitle" class="form-control input-sm" placeholder="帖子标题">
    </div>
    <script type="text/javascript">
		var d = new Date();$("#posttime").val(d.toUTCString());
	</script>
    <div class="col-md-6 column">
      <span id="total" style="line-height: 3;">&nbsp;</span>
    </div>
    <script type="text/javascript">
	 $("input[name='posttitle']").keyup(function(){
	  var max_lenght = 30;
	  var in_lenght = $.trim($(this).val().length);
	  var total = max_lenght-in_lenght
	  if(total<0){alert("标题请少于30个字符");}
	  $("#total").html("<span style='line-height: 3;'>还可输入<strong>"+total+"</strong>个字符</span>");
	 });
    </script>
  </div>
  <!-- 输入信息内容 -->
  <div style="width: 100%;padding-top: 5px;padding-bottom: 20px;">
      <!--style给定宽度可以影响编辑器的最终宽度-->
      <script type="text/plain" id="myEditor" name="postcontent" style="width:100%;height:400px;">
        <p></p>
      </script>
      <script type="text/javascript">
        //实例化编辑器
        var um = UM.getEditor('myEditor',{toolbar:[
            'undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
            'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
            '| justifyleft justifycenter justifyright justifyjustify |',
            'link unlink | emotion image video ',
            '| horizontal preview fullscreen'
    ],autoClearinitialContent:true,wordCount:false});
      </script>
  </div>
  <button type="submit" class="btn btn-warning">
   <span class="glyphicon glyphicon glyphicon-edit"></span>&nbsp;发表帖子
  </button>
  <h3>${message }</h3>
</div>
</form>

<jsp:include page="bottom.jsp" flush="true"></jsp:include>
</body>
</html>