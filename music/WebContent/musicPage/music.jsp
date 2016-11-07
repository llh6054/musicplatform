<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="keywords" content="音乐">
		<meta name="description" content="">

		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/main_music.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/cookie.js" charset="utf-8"></script>
		<style>
			body{backround:#fff}
			.container{margin:10px auto; width:1300px; height:500px;}
			a{text-decoration:none; color:#000; font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif; font-size:10px;}
			/*start music_list*/
			#music_list{float:left; margin-top:10px; margin-left:10px; width:750px; height:480px; }
			.list_tag {float:left; margin-top:0px; width:750px; height:35px;}
			.list_tag a{float:left; margin-left:10px;margin-top:12px; text-decoration:none; color:#000; font-size:15px;}
			#hot_list{float:left;margin-top:8px;font-size:15px; font-weight:bold;}
			#hot_list_more{float:right; margin-right:15px;}
			#list_items_top{margin-top:10px; margin-left:5px; width:740px; height:210px;}
			#list_items_bottom{margin-bottom:10px; margin-left:5px; width:740px; height:210px;}
			.item{float:left;margin-right:70px; width:130px; height:190px;}
			.last{margin-right:0;}
			.image_item{width:130px; height:150px;}
			.item a{text-decoration:none; color:#000; font-size:15px;}
			/*end music_list*/
			
			/*start billboard*/
			.billboard{float:right; margin-top:10px; margin-right:10px; width:500px; height:480px;}
			.b_tag{width:450px; height:35px;}
			#b_bill{float:left; font-size:15px; font-weight:bold; margin-top:10px; margin-left:10px;}
			#b_more{float:right; margin-right:10px; margin-top:12px}
			.b_box{width:450px; height:100px; color:#2D6727}
			.image_bill{width:90px; height:90px; float:left; margin-left:50px}
			.b_box p{float:left; margin-top:40px; color:#2D6727; font-size:20px;}
			.b_new{width:240px; height:340px; float:left}
			.b_history{width:240px; height:340px; float:right}
			.items{line-height:33px; font-size:15px;}
			/*end billboard*/
		</style>
</head>
<body>

	<div class="container">
		<!-- start music_list -->
		<div id="music_list">
			<div class="list_tag">
				<font id="hot_list">热门歌单</font>
				<a href="#">华语</a>
				<a href="#">流行</a>
				<a href="#">英文</a>
				<a href="#">抒情</a>
				<a href="#">摇滚</a>
				<a href="<%=request.getContextPath() %>/musicList/list" id="hot_list_more">更多</a>
			</div>
			<div class="line">
				<hr color="#C10D0C">
			</div>
			<div id="list_items_top">
				<div class="item">
					<a href="#" style="font-size:15px;">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[0].image }" class="image_item">				
							${listPage.entityList[0].listName }		
					</a>
				</div>
				<div class="item">
					<a href="#">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[1].image }" class="image_item">
						${listPage.entityList[1].listName }
					</a>
				</div>
				<div class="item">
					<a href="#">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[2].image }" class="image_item">
						${listPage.entityList[2].listName }
					</a>					
				</div>
				<div class="item last">
					<a href="#">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[3].image }" class="image_item">
						${listPage.entityList[3].listName }
					</a>
				</div>						
			</div>
			<div id="list_items_bottom">
				<div class="item">
					<a href="#">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[4].image }" class="image_item">
						${listPage.entityList[4].listName }
					</a>
				</div>
				<div class="item">
					<a href="#">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[5].image }" class="image_item">
						${listPage.entityList[5].listName }
					</a>
				</div>
				<div class="item">
					<a href="#">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[6].image }" class="image_item">
						${listPage.entityList[6].listName }
					</a>					
				</div>
				<div class="item last">
					<a href="#">
						<img src="<%=request.getContextPath() %>/${listPage.entityList[7].image }" class="image_item">
						${listPage.entityList[7].listName }
					</a>					
				</div>						
			</div>
			
		</div>
		
		<!-- end music_list -->
		<div class="billboard">
			<!-- billboard header start-->
			<div class="b_box">
				<a href="<%=request.getContextPath() %>/music/lateMusic">
					<div>
						<img src="<%=request.getContextPath() %>/images/new_bill.jpg" class="image_bill">
					</div>
					<div>
						<p>新歌榜</p>	
					</div>				
				</a>
				<a href="<%=request.getContextPath() %>/music/lateMusic">
					<div>
						<img src="<%=request.getContextPath() %>/images/history_bill.jpg" class="image_bill">
					</div>
					<div>
						<p>历史点击榜</p>	
					</div>				
				</a>
			</div>
			<!-- billboard header end-->
			<div class="b_new">
				<c:forEach var="music" items="${latestPage.entityList }">
					<a href="#" singer="${music.singer }"  title="${music.musicName }" data-url="<%=request.getContextPath() %>/${music.url }" class="items">${music.musicName }</a><br>
				</c:forEach>
			</div>
			
			<div class="b_history">
				<c:forEach var="music" items="${hottestPage.entityList }">
					<a href="#" singer="${music.singer}" title="${music.musicName }" data-url="<%=request.getContextPath() %>/${music.url }" class="items">${music.musicName }</a><br>
				</c:forEach>
			</div>
			
		</div>
	</div>
	
</body>
</html>
