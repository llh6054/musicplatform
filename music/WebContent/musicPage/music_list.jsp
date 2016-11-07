<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="keywords" content="音乐">
		<meta name="description" content="">

		<script type="text/javascript" src="/GraduateDesign/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="/GraduateDesign/js/main_music.js" charset="utf-8"></script>
		
		<style>
			.container{margin:0 auto; width:1300px; height:500px;}
			a{text-decoration:none; color:#000; font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif; font-size:10px;}
			/*start music_list*/
			#music_list{float:left; margin-top:10px; margin-left:10px; width:1300px; height:500x; }
			.list_tag {float:left; margin-top:0px; width:1300px; height:35px;}
			.line{width:1150px;}
			.list_tag a{float:left; margin-left:10px;margin-top:12px; text-decoration:none; color:#000; font-size:15px;}
			#list_items_top{margin-top:10px; margin-left:5px; width:1300px; height:210px;}
			#list_items_bottom{margin-bottom:10px; margin-left:5px; width:1300px; height:210px;}
			.item{float:left;margin-right:70px; margin-top:15px;width:130px; height:190px;}
			.image_item{width:130px; height:150px;}
			.item a{text-decoration:none; color:#000; font-size:13px;}
			/*end music_list*/
			
			/*page start*/
			.page{border:1px solid red; width:300px; height:35px; float:right; margin-right:200px}
			/*page end*/
		</style>
</head>
<body>
	<div class="container">
		<!-- start music_list -->
		<div id="music_list">
			<div class="list_tag">
				<a href="#">华语</a>
				<a href="#">流行</a>
				<a href="#">英文</a>
				<a href="#">抒情</a>
				<a href="#">摇滚</a>
			</div>
			<div class="line">
				<hr color="#C10D0C">
			</div>
			<div id="list_items_top">
					<c:forEach var="list" items="${list.entityList }">
						<div class="item">
							<a href="#">
								<img src="<%=request.getContextPath()%>/${ list.image }" alt="歌单图片" />	
								<p>${list.listName }</p>
							</a>
						</div>
					</c:forEach>	
			</div>
			<div id="list_items_bottom">
				<div class="page">
					<c:if test="${list.onLine<0}">
					上一页
					</c:if>
					<c:if test="${list.onLine>=0}">	
					<a href="<%=request.getContextPath() %>/musicList/list?offset=${list.onLine }">上一页 </a> 
					</c:if>
					<c:if test="${list.nextLine>=list.allLine}">
				    	下一页
					</c:if>
					<c:if test="${list.nextLine<list.allLine}">
					<a href="<%=request.getContextPath() %>/musicList/list?offset=${list.nextLine }">下一页</a>
					</c:if>
				</div>	
			</div>	
		</div>
	</div>
	
</body>
</html>
