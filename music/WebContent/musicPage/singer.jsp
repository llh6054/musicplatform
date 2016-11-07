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
		
		<style>
			body{backround:#fff}
			a{text-decoration:none; color:#000; font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif;}
			.container{width:1300px; height:480px; margin:0 auto; }		
			
			/*start hot_singer*/
			.hot_singer_container{ margin-left:30px; width:930px; height:480px; float:left;}
 			.hs_title_container{width:150px; height:480px; float:left; } 
			.hs_title{width:100px; height:90px; margin:26px auto; font-size:30px; text-align:center;}
			.hs_contianer{width:760px; height:480px; margin-left:20px ; float:left;}
			.hs_singer{width:120px; height:140px; margin-left:55px; float:left; margin-top:50px;}
			.hs_singer_img{width:120px; height:120px;}
			.singer_name{width:120px; height:20px; text-align:center;}
			/*end hot_singer*/
			
			/*start singer*/
			.singer_container{width:200px; height:480px;float:left; border:1px solid #333;}
			.interest_singer_title{text-align:center; width:200px; height:20px;}
			.interest_singer{width:200px; height:120px; margin-top:20px;}
			.singer_img{margin-left:45px; border-radius:60px; width:120px; height:120px;}
			/*end singer*/
			.page{width:200px; height:30px; border:1px solid #333; margin-right:40px; margin-top:35px; float:right;}
		</style>
</head>
<body>

	<div class="container">
			<div class="hot_singer_container">
			
				<div class="hs_title_container">
					<div class="hs_title">
							人
					</div>
					<div class="hs_title">
							气
					</div>
					<div class="hs_title">
							歌
					</div>
					<div class="hs_title">
							手
					</div>
				</div>
				<div class="hs_contianer">	
					<c:forEach var="singer" items="${singer.entityList }">
						<div class="hs_singer">
							<div class="hs_singer_img">
								<a href="<%=request.getContextPath() %>/singer/singerMain?id=${singer.id }">
									<c:choose>
										<c:when test="${singer.img != null }">
											<img src="<%=request.getContextPath()%>/${ singer.img}" alt="${singer.singerName }">
										</c:when>
										<c:otherwise>
											<img src="<%=request.getContextPath()%>/images/singer/6649846326157603.jpg" />
										</c:otherwise>
									</c:choose>				
								</a>
							</div>
							<div class="singer_name">
								<a href="<%=request.getContextPath() %>/singer/singerMain?id=${singer.id }">
									${singer.singerName }
								</a>
							</div>
						</div>
					</c:forEach>	
					<div class="page">
						<c:if test="${singer.onLine<0}">
						上一页
						</c:if>
						<c:if test="${singer.onLine>=0}">	
						<a href="<%=request.getContextPath() %>/singer/singer?offset=${singer.onLine }">上一页 </a> 
						</c:if>
						<c:if test="${singer.nextLine>=singer.allLine}">
					    	下一页
						</c:if>
						<c:if test="${singer.nextLine<singer.allLine}">
						<a href="<%=request.getContextPath() %>/singer/singer?offset=${singer.nextLine }">下一页</a>
						</c:if>
					</div>
				</div>
			</div>
			
			<div class="singer_container">
				<div class="sc_interest_singer">
					<div class="interest_singer_title">
						你可能感兴趣的歌手
					</div>
					<div class="interest_singer">
						<img src="/GraduateDesign/images/singer/6649846326157603.jpg" alt="${interestSinger[0].singerName }" class="singer_img">
					</div>
					<div class="interest_singer">
						<img src="/GraduateDesign/images/singer/7986852465882529.jpg"" alt="${interestSinger[1].singerName }" class="singer_img">
					</div>
					<div class="interest_singer">
						<img src="/GraduateDesign/images/singer/2381542185826719.png" alt="${interestSinger[2].singerName }" class="singer_img">
					</div>			
				</div>	
			</div>
		</div>	
	</div>	
		
	
	
</body>
</html>
