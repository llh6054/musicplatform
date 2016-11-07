<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<title></title>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin/common.css" />

</head>
<body>
	<div class="operate">
		<div class="search">
			<form action="<%=request.getContextPath() %>/singer/admin_singer_operate" method="post" class="form-inline">
				<input type="text" name="inputinfo" placeholder="歌手名" value="<%=request.getParameter("inputinfo") == null ? "" : request.getParameter("inputinfo")%>" class="form-control"/>
				<input type="submit" value="查询" class="btn btn-success"/>
				<input type="button" value="返回主页" class="btn btn-primary" onclick="window.location.href='<%=request.getContextPath() %>/home/admin'"/>
			</form>
		</div>
	</div>
	<div>
		<table class="table">
			<tr>
				<th>排序</th>
				<th>添加时间</th>
				<th>性别</th>
				<th>歌手图片</th>
				<th>歌手信息</th>
				<th>歌手名称</th>
				<th>更新时间</th>
				<th>操作</th>
			</tr>
			<c:forEach var="singer" items="${model.entityList}">
				<tr>
					<td>
						${singer.id } 
					</td>
					<td>
						${singer.getDate(singer.addTime) }		
					</td>
					<td>
						<c:choose>
							<c:when test="${singer.gender == 0 }">
								未知
							</c:when>
							<c:when test="${singer.gender == 1 }">
								男
							</c:when>
							<c:otherwise>
								女
							</c:otherwise>
						</c:choose>	
					</td>
					<td>
						<c:choose>
							<c:when test="${singer.img == null }">
								----
							</c:when>
							<c:otherwise>
								<img src="<%=request.getContextPath() %>/${singer.img }" />
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${singer.singerInfo == null}">
									----
							</c:when>
							<c:otherwise>
								${singer.singerInfo }
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						${singer.singerName }
					</td>
					<td>
						<c:choose>
							<c:when test="${singer.updateTime == 0 }">
								${singer.getDate(singer.addTime) }
							</c:when>
							<c:otherwise>
								${singer.getDate(singer.updateTime) }
							</c:otherwise>
						</c:choose>
					</td>
					<td>						
						<a href="<%=request.getContextPath() %>/singer/admin_singer_addinfo?singerid=${singer.id }"><input type="button" value="添加信息" class="btn btn-success"></a>
						<a href="<%=request.getContextPath() %>/singer/admin_delSinger?singerid=${singer.id }"><input type="button" value="删除" class="btn btn-primary"></a>
					</td>			
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="page">
		<ul class="pager">
			<c:if test="${model.onLine<0}">
			上一页
			</c:if>
			<c:if test="${model.onLine>=0}">	
			<li><a href="<%=request.getContextPath() %>/singer/admin_singer_operate?offset=${model.onLine }">上一页 </a></li>
			</c:if>
			<c:if test="${model.nextLine>=model.allLine}">
		    	下一页
			</c:if>
			<c:if test="${model.nextLine<model.allLine}">
			<li><a href="<%=request.getContextPath() %>/singer/admin_singer_operate?offset=${model.nextLine }">下一页</a></li>
			</c:if>
		</ul>
	</div>	
		
</body>
</html>
