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
			<form action="<%=request.getContextPath() %>/user/admin_user_operate" method="post" class="form-inline">
				<input type="text" name="inputinfo" placeholder="用户名" value="<%=request.getParameter("inputinfo") == null ? "" : request.getParameter("inputinfo")%>" class="form-control"/>
				<input type="submit" value="查询" class="btn btn-success"/>
				<input type="button" value="返回主页" class="btn btn-primary" onclick="window.location.href='<%=request.getContextPath() %>/home/admin'"/>
			</form>
		</div>
	</div>
	<div>
		<table class="table">
			<tr>
				<th>排序</th>
				<th>性别</th>
				<th>用户名</th>
				<th>邮箱</th>
				<th>操作</th>
			</tr>
			<c:forEach var="user" items="${model.entityList}">
				<tr>
					<td>
						${user.id } 
					</td>
					<td>
						<c:choose>
							<c:when test="${user.gender == 0 }">
								未知
							</c:when>
							<c:when test="${user.gender == 1 }">
								男
							</c:when>
							<c:otherwise>
								女
							</c:otherwise>
						</c:choose>	
					</td>
					<td>
						${user.userName }
					</td>
					<td>
						${user.email }
					</td>
					<td>
						<c:choose>
							<c:when test="${user.isDel == 0 }">
								<a href="<%=request.getContextPath() %>/user/delUser?id=${user.id }">
									<input type="button" value="禁用" class="btn btn-danger">
								</a>
							</c:when>						
							<c:otherwise>
								<a href="<%=request.getContextPath() %>/user/awakeUser?id=${user.id }">
									<input type="button" value="启用" class="btn btn-primary">
								</a>
							</c:otherwise>
						</c:choose>							
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
			<li><a href="<%=request.getContextPath() %>/user/admin_user_operate?offset=${model.onLine }">上一页 </a></li>
			</c:if>
			<c:if test="${model.nextLine>=model.allLine}">
		    	下一页
			</c:if>
			<c:if test="${model.nextLine<model.allLine}">
			<li><a href="<%=request.getContextPath() %>/user/admin_user_operate?offset=${model.nextLine }">下一页</a></li>
			</c:if>
		</ul>
	</div>	
		
</body>
</html>
