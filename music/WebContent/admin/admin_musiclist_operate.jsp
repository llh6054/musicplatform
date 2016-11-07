<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<title></title>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
<style>
	
</style>
</head>
<body>
	<div class="operate">
		<form action="<%=request.getContextPath() %>/musicList/admin_musiclist_operate" method="post" class="form-inline">
			<input type="text" name="inputinfo" value="<%=request.getParameter("inputinfo") == null ? "" : request.getParameter("inputinfo") %>" class="form-control" placeholder="歌单名" />
			<input type="submit" value="查询" class="btn btn-success" />
			<input type="button" value="添加" class="btn btn-primary" onclick="window.location.href='<%=request.getContextPath() %>/musicList/admin_musiclist_add'"/>
			<input type="button" value="返回主页" class="btn btn-primary" onclick="window.location.href='<%=request.getContextPath() %>/home/admin'">
		</form>
	</div>
	<div class="music">
		<table class="table">
			<tr>
				<th>排序</th>
				<th>添加时间</th>
				<th width="300px">歌单描述</th>
				<th>图片url</th>
				<th>点击量</th>
				<th>歌单名称</th>
				<th>歌单类型</th>
			</tr>
			<c:forEach var="list" items="${model.entityList}">
				<tr>
					<td>
						${list.id } 
					</td>
					<td>
						${list.getDate(list.addTime) }
					</td>
					<td>
						<c:choose>
							<c:when test="${list.listDesc == null}">
									----
							</c:when>
							<c:otherwise>
								${list.listDesc }
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						${list.image }
					</td>
					<td>
						${list.hot }
					</td>
					<td>
						${list.listName }
					</td>
					<td>
						${list.listType }
					</td>
					<td>
						<a href="<%=request.getContextPath() %>/musicList/admin_musiclist_update?listid=${list.id }"><input type="button" value="修改" class="btn btn-success"></a>
						<a href="<%=request.getContextPath()%>/musicList/delList?id=${list.id}"><input type="button" value="删除" class="btn btn-primary"></a>
					</td>			
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="page" style="float:right; margin-right:20px;">
		<ul class="pager">
			<c:if test="${model.onLine<0}">
			上一页
			</c:if>
			<c:if test="${model.onLine>=0}">	
			<li><a href="<%=request.getContextPath() %>/musicList/admin_musiclist_operate?offset=${model.onLine }">上一页 </a></li>
			</c:if>
			<c:if test="${model.nextLine>=model.allLine}">
		    	下一页
			</c:if>
			<c:if test="${model.nextLine<model.allLine}">
			<li><a href="<%=request.getContextPath() %>/musicList/admin_musiclist_operate?offset=${model.nextLine }">下一页</a></li>
			</c:if>
		</ul>
	</div>	
	
</body>
</html>
