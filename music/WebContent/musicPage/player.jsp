<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset=utf-8>
		<title></title>
		<meta name="keywords" content="音乐">
		<meta name="description" content="">

		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/cookie.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/main_play.js" charset="utf-8"></script>	
	</head>
	<style type="text/css">
		/*底部按键*/
		.bottom{position: absolute;left: 0;bottom: 0;width: 100%;height: 80px;background:#333;}
		.playerWrap{position: relative;height: 100%;padding-left: 278px;padding-right: 330px;}
		.playerCon{position: absolute;top: 0;left: 0;width: 278px;height: 100%;}
		.pbtn{display: block;width: 30px;height: 30px;position: absolute;background-image: url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png");}
		.prevBtn{top: 25px;left: 38px;background-position: 0 -90px;}
		.playBtn{top: 25px;left: 91px;}
		.nextBtn{background-position: 0 -60px;top:25px;left: 144px;}
		.mode{display: block;width:20px;height: 18px;position: absolute;top: 31px;left: 202px;background:url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") 0 -181px; }
		.playInfo{height: 100%;position: relative;}
		.trackInfo{position: absolute;width: 100%;height:18px;line-height: 18px;top: 20px;color: #fff;}
		.trackInfo a{color: #fff;font-size: 14px;text-decoration: none;}
		.trackCon{float: right;width: 100px;height: 18px;}
		.tc1{width: 18px;height: 18px;display: block;position: absolute;top: 0;right: 66px;}
		.songName,.songPlay{float: left;}
		.tc1{position: absolute;width: 18px;height: 18px;top: 0;right: 66px;background-image: url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png");background-position: 0 -241px;}
		.tc2{position: absolute;width: 18px;height: 18px;top: 0;right: 33px;background-image: url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png");background-position: 0 -259px;}
		.tc3{position: absolute;width: 18px;height: 18px;top: 0;right: 0;background-image: url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png");background-position: 0 -277px;}
		.playerLength{width: 100%;height: 20px;font-size: 10px;position: absolute;top: 43px;}
		.position{width: 40px;height: 18px;line-height: 18px;position: absolute;left:0;color: #fff;opacity: 0.3}
		.duration{width: 40px;height: 18px;line-height: 18px;position: absolute;right:0;color: #fff;opacity: 0.3;text-align: right;}
		.progress{position: absolute;left: 40px;right: 40px;height: 18px;}
		.pro1,.pro2{position: absolute;left: 0;height: 100%;width: 100%;background: url("<%=request.getContextPath() %>/images/pro.png") repeat-x 0 50%;}
		.dian,.dian2{display: block;width: 10px;height: 18px;position: absolute;top: 0;background: url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") no-repeat -32px -338px;}
		.dian2{left: 79px;}
		.vol{position: absolute;top: 0;right: 0;width:270px;height: 100%;}
		.pinBtn{display: block;position: absolute;top: 28px;right: 176px;width: 80px;height: 32px;background: url("<%=request.getContextPath() %>/images/T1ldFHFpxtXXaLghZR-80-832.png") no-repeat;}
		.volm{position: absolute;width: 110px;height: 18px;top: 31px;right:40px;}
		.volSpeaker{position: absolute;width: 18px;height: 18px;background: url("<%=request.getContextPath() %>/images/T1bMh.FxNXXXb_r3IF-72-730.png") no-repeat 0 -295px;}
		.volControl{position: absolute;left:24px;width: 80px;height: 18px;background: url("<%=request.getContextPath() %>/images/pro.png") repeat-x 0 50%;}
	</style>
<body>

	
<!-- 	<div class="player"> -->
<!-- 		<div class="p_picture"> -->
<!-- 			<img src="/GraduateDesign/images/Jacky Cheung.jpg" alt="张学友" width="90px" height="90px"/> -->
<!-- 			<p class="p_title" id="title">音乐</p> -->
<!-- 		</div> -->
<!-- 		<div class="btn"> -->
<!-- 			<a href="#" class="b_prev"></a> -->
<!-- 			<a href="#" class="b_play"></a> -->
<!-- 			<a href="#" class="b_pause"></a> -->
<!-- 			<a href="#" class="b_next"></a> -->
<!-- 		</div> -->
<!-- 		<div class="open_list" title="特别的人" style="display:block"></div> -->
<!-- 		<div class="open_list" title="展开播放列表" style="display:block"></div> -->
<!-- 		<div class="p_packup"></div> -->
<!-- 		<div id="audiobox"></div> -->
<!-- 	</div> -->

		<div class="bottom">
			<div class="playerWrap">
				<div class="playerCon">
					<a href="#" class="pbtn prevBtn"></a>
					<a href="#" class="pbtn playBtn" isplay="0"></a>
					<a href="#" class="pbtn nextBtn"></a>
					<a href="#" class="mode"></a>
				</div>
				<div class="playInfo">
					<div class="trackInfo">
						<a href="#" class="songName" id="songName">漂洋过海来看你(Live)</a>
						-
						<a href="#" class="songPlayer" id="singerName">刘明湘</a>
						<div class="trackCon">
							<a href="#" class="tc1"></a>
							<a href="#" class="tc2"></a>
							<a href="#" class="tc3"></a>
						</div>
					</div>
					<div class="playerLength">
						<div class="position">00:00</div>
						<div class="progress">
							<div class="pro1"></div>
							<div class="pro2" id="pro2">
								<a href="#" class="dian"></a>
							</div> 
						</div>
						<div class="duration">03:35</div>
					</div>
				</div>
				<div class="vol">
					<a href="#" class="pinBtn"></a>
					<div class="volm">
						<div class="volSpeaker"></div>
						<div class="volControl">
							<a href="#" class="dian2"></a>
						</div>
					</div>
				</div>
				<div id="audiobox"></div>
			</div>
		</div>
</body>
</html>
