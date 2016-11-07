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
			.container{width:1300px; height:480px; margin:0 auto;}		
			
			/*start musicinfo*/
			.music_container{ margin-left:30px; width:900px; height:480px; float:left;}
			.music_title{width:900px; height:30px;}
			.line{margin-top:0px; border-bottom: 3px solid rgb(193, 13, 12); width:900px;}
			.musicinfo_contianer{width:900px; height:370px;}
			.m_list{font-size:20px; font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif;}
			.m_order{margin-left:0px; float:left; width:40px; height:370px;}
			.m_music{float:left; margin-left:10px; width:300px; height:370px;}
			.m_singer{float:left; margin-left:10px; width:200px; height:370px;}
			.m_hot{float:left; margin-left:10px; width:50px; height:370px; text-align:center;}
			.m_operate{float:left; margin-left:10px; width:250px; height:370px; text-align:center;}
			.music_title_contianer{width:900px; height:20px;}
			.mtc_title{text-align:center; width:300px; height:20px; float:left; margin-left:52px;}
			.mtc_singer{text-align:center; width:200px; height:20px; float:left; margin-left:10px;}
			.mtc_hot{text-align:center; float:left; margin-left:10px; width:50px; height:20px; }
			.mtc_operate{text-align:center; float:left; margin-left:10px; width:250px; height:20px;}
			.m_line{line-height:25px;}
			.cicon{cursor: pointer; display: block;width: 18px;height: 18px;background:url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") no-repeat;}
			.add{background-position:0 -413px;}
			.add:hover{background-position:-28 -413px;}
			.love{background-position: -28 -130px;right: 86px;}
			.love:hover{background-position: 0 -155px;}
			.start{cursor: pointer;display: block;width: 18px;height: 18px;background: url("<%=request.getContextPath() %>/images/play.png") 0 0;color:transparent;}
			.start:hover{background-position:-16px 0 ;}
			.items , .f_size{font-size:15px; margin-left:10px;}
			/*end musicinfo*/
			
			/*start singer*/
			.singer_container{margin-left:30px; width:200px; height:480px;float:left;}
			.interest_singer_title{text-align:center; width:200px; height:20px;}
			.interest_singer{width:200px; height:120px; margin-top:20px;}
			.singer_img{margin-left:45px; border-radius:60px; width:120px; height:120px;}
			/*end singer*/
			.page{width:200px; height:30px; border:1px solid #333; margin-right:-5px; margin-top:420px; float:right;}
		</style>
</head>
<body>

	<div class="container">
		<div class="music_container">
			<div class="music_title">
				<font class="m_list">歌曲列表</font>
				<hr color="#C10D0C" class="line">
			</div>
			<div class="music_title_contianer">
				<table class="table" style="width:900px">
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
						<td>
						<a href="<%=request.getContextPath() %>/singer/singerMain?id=${music.singerId}">${music.singer }</a>
						
						</td>
						<td width="10px;">
								<a class="cicon add" singer="${music.singer }" title="${music.musicName }" data-url="<%=request.getContextPath() %>/${music.url }"></a>
						</td>
						<td width="10px;">
								<a class="cicon love"></a>
						</td>
						<td width="10px;">
								<a href="#" class="start items" singer="${music.singer }" title="${music.musicName }" data-url="<%=request.getContextPath() %>/${music.url }"></a>
						</td>
						
								
						
					</tr>
					</c:forEach>
				</table>
				</div>
			<div class="page">
				<c:if test="${model.onLine<0}">
				上一页
				</c:if>
				<c:if test="${model.onLine>=0}">	
				<a href="<%=request.getContextPath() %>/music/lateMusic?offset=${model.onLine }">上一页 </a> 
				</c:if>
				<c:if test="${model.nextLine>=model.allLine}">
			    	下一页
				</c:if>
				<c:if test="${model.nextLine<model.allLine}">
				<a href="<%=request.getContextPath() %>/music/lateMusic?offset=${model.nextLine }">下一页</a>
				</c:if>
			</div>
		</div>	
			
		<div class="singer_container">
			<div class="sc_interest_singer">
				<div class="interest_singer_title">
					你可能感兴趣的歌手
				</div>
				<div class="interest_singer">
					<img src="<%=request.getContextPath() %>/${interestSinger[0].img }" alt="${interestSinger[0].singerName }" class="singer_img">
				</div>
				<div class="interest_singer">
					<img src="<%=request.getContextPath() %>/${interestSinger[1].img }" alt="${interestSinger[1].singerName }" class="singer_img">
				</div>
				<div class="interest_singer">
					<img src="<%=request.getContextPath() %>/${interestSinger[2].img }" alt="${interestSinger[2].singerName }" class="singer_img">
				</div>
			
			</div>	
		</div>
	</div>
	
</body>
</html>
