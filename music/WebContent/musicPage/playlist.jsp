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

			/*start leftBar*/
			.leftBar{width: 190px;height: 100%;padding: 0 10px;position: absolute;top:0;left: 0;}
			.menuUL{width: 100%;padding: 10px 0;border-bottom: 1px solid #ccc;}
			.menuLi{width: 100%;height: 36px;}
			.menuLi a{font-size: 12px; display: block;height: 36px;line-height: 36px;padding-left: 36px;border-radius: 4px;position: relative;color: #333;text-decoration: none;}
			.cur a{background-color: #f0f0f0;}
			.icon{position: absolute;top: 9px;left: 9px;width: 18px;height: 18px;}
			.iplay{background: url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") 0 -358px;}
			.ihst{background:url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") 0 -376px;}
			.ishouc{background:url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") 0 -394px;}
			.collectOut{width: 190px;height: 30px;padding-top: 10px;line-height: 30px;}
			.colS{float: left;color: #aaa;font-size: 12px;font-weight: bold;}
			.colA{float: right;width: 18px;height: 18px;background:url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") 0 -412px;margin: 5px 0;}
			.cellectList{width: 185px;height: 89px;margin: 0 2.5px;background-image: url("<%=request.getContextPath() %>/images/T11aF_Fx4aXXcxTH6l-185-89.png");} 
			/*end leftBar*/
			
			/*start_music*/
			.music_container{ margin-left:260px; width:1020px; height:480px; float:left;}
			.music_title{width:900px; height:30px;}
			.line{margin-top:0px; width:600px; margin-left:0px; border-bottom: 3px solid rgb(193, 13, 12);}
			.box{width:600px; height:430px; float:left;}
			.m_list{font-size:20px; font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif;}
			.cicon{cursor: pointer; display: block;width: 18px;height: 18px;background:url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") no-repeat;}
			.add{background-position:0 -413px;}
			.add:hover{background-position:-28 -413px;}
			.love{background-position: -0 -130px;right: 86px;}
			.love:hover{background-position: 0 -155px;}
			.start{cursor: pointer;display: block;width: 18px;height: 18px;background: url("<%=request.getContextPath() %>/images/play.png") 0 0;color:transparent;}
			.start:hover{background-position:-16px 0 ;}
			.page{margin-left:480px; margin-top:-20px;}
			/*end_music*/
			
			/*start similiar_singer*/
			.similiar_singer_container{margin-left:130px; width:200px; height:280px; float:left; border:1px solid #333}
		</style>
</head>
<body onload="loadPlaylist()">

	<div class="middle">
			<div class="mainWrap">
				<div class="leftBar">
					<ul class="menuUL">
						<li class="menuLi cur">
							<a href="#" onclick="play()">
								<i class="icon iplay"></i>
								正在播放
							</a>
						</li>
						<li class="menuLi">
							<a href="<%=request.getContextPath() %>/music/playlist">
								<i class="icon ihst"></i>
								播放列表
							</a>
						</li>
						<li class="menuLi">
							<a href="<%=request.getContextPath() %>/music/myCollectedMusic">
								<i class="icon ishouc"></i>
								我收藏的单曲
							</a>
						</li>
					</ul>
					<div class="collectOut">
						<span class="colS">我创建的精选集</span>
						<a href="#" class="colA"></a>
					</div>
					<div class="cellectList"></div>		
				</div>
				
			</div>
		</div>

	<div class="container">
		<div class="music_container">
			<div class="music_title">
				<font class="m_list">播放列表</font>
				<hr class="line">
			</div>
			<div class="box">
			</div>	
			<div class="similiar_singer_container">
			</div>
		</div>	
		
	</div>	
		
	
	
</body>
</html>
