<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<title></title>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
</head>
<body>
	<div class="operate">
		<form action="<%=request.getContextPath() %>/music/musicPage" method="post" class="form-inline" >
			<input type="text" name="inputinfo" placeholder="歌曲名/歌手名" class="form-control" value="<%=request.getParameter("inputinfo") == null ? "" : request.getParameter("inputinfo")%>"/>
			<input type="submit" value="查询" class="btn btn-success" />
			<input type="button" value="添加" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/music/admin_add_music'"/>
			<input type="button" value="返回主页" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/home/admin'"/>
		</form>
	</div>
	
	<div class="music">
		<table class="table">
			<tr>
				<th>排序</th>
				<th>添加时间</th>
				<th>歌曲名称</th>
				<th>点击量</th>
				<th>歌曲信息</th>
<!-- 				<th>歌曲原名称</th> -->
				<th>歌手</th>
				<th>链接</th>
				<th>操作</th>
			</tr>
			<c:forEach var="music" items="${model.entityList}">
				<tr>
					<td>
						${music.id } 
					</td>
					<td>
						${music.getDate(music.addTime) }		
					</td>
					<td>
						${music.musicName }
					</td>
					<td>
						${music.hot }
					</td>
					<td>
						<c:choose>
							<c:when test="${music.musicInfo == null}">
									----
							</c:when>
							<c:otherwise>
								${music.musicInfo }
							</c:otherwise>
						</c:choose>
					</td>
<!-- 					<td> -->
<%-- 						${music.musicOriginalName } --%>
<!-- 					</td> -->
					<td>
						${music.singer }
					</td>
					<td>
						${music.url }
					</td>
					<td>						
						<a href="<%=request.getContextPath() %>/music/admin_add_music?musicid=${music.id }"><input type="button" value="修改" class="btn btn-primary"></a>
						<a href="<%=request.getContextPath() %>/music/delMusic?musicid=${music.id }"><input type="button" value="删除" class="btn btn-success"></a>
					</td>			
				</tr>
			</c:forEach>
		</table>
	</div>
	<nav>
		<div class="page" style="float:right; margin-right:20px;">
		<ul class="pager">
			<c:if test="${model.onLine<0}">
		<li>上一页</li>
		</c:if>
		<c:if test="${model.onLine>=0}">	
		<li><a href="<%=request.getContextPath() %>/music/admin_music_operate?offset=${model.onLine }">上一页 </a></li> 
		</c:if>
		<c:if test="${model.nextLine>=model.allLine}">
	    	<li>下一页</li>
		</c:if>
		<c:if test="${model.nextLine<model.allLine}">
		<li><a href="<%=request.getContextPath() %>/music/admin_music_operate?offset=${model.nextLine }">下一页</a></li>
		</c:if>
		</ul>
	</div>	
	</nav>
</body>
</html>
