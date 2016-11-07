<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
		<meta charset=utf-8>
		<title>音乐</title>
		<meta name="keywords" content="音乐">
		<meta name="description" content="">
		
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/header.css" />
	<script>


// 		function creadeOnLoad() {
// 			window.frames['player'].createMp3("/GraduateDesign/mp3/1462709769811.mp3");
// 		}
					

		function findMusic() {
			var inputinfo = document.getElementById("inputinfo").value;
			//inputinfo = escape(inputinfo); 
			alert(inputinfo);
			if(inputinfo == "") {
				window.confirm("请输入查询信息");
				return false;
			}else {
				window.frames["music"].location = "<%=request.getContextPath() %>/music/searchMusic?inputinfo="+inputinfo;
			}
		}
		
</script>
	</head>
	<style>
		#music{width:100%; height:645px;}
		#player{width:100%; height:140px; position:fixed; bottom:0;}
		body{overflow-x:hidden;}
	</style>
	

	
<body>
	<!--header start-->
	 <div class="header">
 		 <div class="m_logo">
	 		<img src="<%=request.getContextPath() %>/images/header.png" alt="header_logo" width="80px" height="70px">
		 </div>
		 <div class="m_words">
		 	Music
		 </div>		 	
 			 <a href="<%=request.getContextPath() %>/music/playlist" target="music" >我的音乐</a>
		 	 <a href="<%=request.getContextPath() %>/home/indexList" target="music">推荐</a>
		 	 <a href="<%=request.getContextPath() %>/musicList/list" target="music">歌单</a>
		 	 <a href="<%=request.getContextPath() %>/singer/singer" target="music">歌手</a>
<!-- 		 	 <a href="#" target="music">排行榜</a> -->
	 	 <div class="m_search">
	 	 	<input type="text" placeholder="单曲/歌手" id="inputinfo"/>
	 	 	<a class="search" href="javascript:void(0)" onclick="findMusic()" target="music"></a>
	 	 </div>
	 	 <div id="login_regis">
	 	 	<input type="hidden" value="${currentUserId }" id="userid" />
	 	 	<c:choose>
				<c:when test="${currentUserName == null}">
						<a href="<%=request.getContextPath()%>/user/login" target="music">登录</a>
						<a href="<%=request.getContextPath()%>/user/register" target="music">注册</a>
				</c:when>
				<c:otherwise>
					<div class="login_out">
						<a href="#">${currentUserName }</a>
						<a href="<%=request.getContextPath()%>/user/logout">注销</a>
					</div>
				</c:otherwise>
			</c:choose>
	 	 </div>
	</div>	
	 <!--header end--> 
	<iframe src="<%=request.getContextPath()%>/home/indexList" id="music" name="music" scrolling="no">
	</iframe> 
	<iframe src="<%=request.getContextPath()%>/musicPage/player.jsp" id="player" name="player" scrolling="no" frameborder="0">
	</iframe> 
</body>
</html>
