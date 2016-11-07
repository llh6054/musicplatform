<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="keywords" content="音乐">
		<meta name="description" content="">

		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/main_music.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/cookie.js" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
		<style>
			body{backround:#fff}
			a{text-decoration:none; color:#000; font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif;}
			.container{width:1300px; height:480px; margin:0 auto; }		
			.singer_container{width:400px; height:460px; margin-left:10px; margin-top:10px; float:left;}
			.singer_header{width:400px; height:120px; }
			.singer_img{width:120px; height:120px; margin-top:0px; margin-left:60px; float:left;}
			.singer_name{width:120px; height: 120px; margin-top:0px; float:left; }
			.singer_name #wrapper{margin-top:50px;}
			.singer_desc{widht:360px; height:300px; margin-top:10px; line-height: 25px;color: #666;text-indent: 2em; font-size:14px;}
			
			/*start_music*/
			.music_container{ margin-left:30px; width:825px; height:480px; float:left;}
			.music_title{width:900px; height:30px;}
			.line{margin-top:0px; width:600px; margin-left:0px; border-bottom: 3px solid rgb(193, 13, 12);}
			.musicinfo_contianer{width:600px; height:430px; float:left;}
			.m_list{font-size:20px; font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif;}
			.cicon{cursor: pointer; display: block;width: 18px;height: 18px;background:url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") no-repeat;}
			.add{background-position:0 -413px;}
			.add:hover{background-position:-28 -413px;}
			.love{background-position: -28 -130px;right: 86px;}
			.love:hover{background-position: 0 -155px;}
			.start{cursor: pointer;display: block;width: 18px;height: 18px;background: url("<%=request.getContextPath() %>/images/play.png") 0 0;color:transparent;}
			.start:hover{background-position:-16px 0 ;}
			.page{margin-left:480px; margin-top:-20px;}
			/*end_music*/
			
			/*start similiar_singer*/
			.similiar_singer_container{margin-left:10px; width:200px; height:280px; float:left; border:1px solid #333}
		</style>
</head>
<body>

	<div class="container">
		<div class="singer_container">
			<div class="singer_header">
				<div class="singer_img">
					<img src="<%=request.getContextPath() %>/${singerinfo.img }" />
				</div>
				<div class="singer_name">
						<div id="wrapper">${singerinfo.singerName }</div>
				</div>
			</div>
			<div class="singer_desc">
					${singerinfo.singerInfo }
			</div>
		</div>
		
		<div class="music_container">
			<div class="music_title">
				<font class="m_list">热门单曲</font>
				<hr class="line">
			</div>
			<div class="musicinfo_contianer">
				<table class="table">
					<tr>
						<th></th>
						<th>歌曲</th>
						<th>演唱者</th>
						<th colspan="3">操作</th>
					</tr>
					<c:forEach var="music" items="${model.entityList }" varStatus="status">
					<tr>
						<td>
							<c:out value="${status.index + 11 + model.onLine}  " />
						</td>
						<td>
								<a href="#" singer="${music.singer }" title="${music.musicName }" data-url="<%=request.getContextPath() %>/${music.url }" class="items">${music.musicName }</a>
						</td>
						<td>${music.singer }</td>
						<td width="10px;">
								<a class="cicon add" singer="${music.singer }" title="${music.musicName }" data-url="<%=request.getContextPath() %>/${music.url }"></a>
						</td>
						<td width="10px;">
								<a class="cicon love" musicid="${music.id }" islove="0"></a>
						</td>
						<td width="20px;">
								<a href="#" class="start items" singer="${music.singer }" title="${music.musicName }" data-url="<%=request.getContextPath() %>/${music.url }"></a>
						</td>
						
								
						
					</tr>
					</c:forEach>
				</table>
					<div class="page">
						<c:if test="${model.onLine<0}">
						上一页
						</c:if>
						<c:if test="${model.onLine>=0}">	
						<a href="<%=request.getContextPath() %>/singer/singerMain?offset=${model.onLine }&id=${singerinfo.id}">上一页 </a> 
						</c:if>
						<c:if test="${model.nextLine>=model.allLine}">
					    	下一页
						</c:if>
						<c:if test="${model.nextLine<model.allLine}">
						<a href="<%=request.getContextPath() %>/singer/singerMain?offset=${model.nextLine }&id=${singerinfo.id}">下一页</a>
						</c:if>
					</div>
			</div>	
			<div class="similiar_singer_container">
			</div>
		</div>	
		
	</div>	
		
	
	
</body>
</html>
