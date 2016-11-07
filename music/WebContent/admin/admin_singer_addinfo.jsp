<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.design.entity.Singer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<form action="<%=request.getContextPath() %>/singer//admin_singer_addinfo?action=add" enctype="multipart/form-data" method="post">
			<table class="table">
				<tr>
					<td>添加时间:</td>
					<td class="space">${singerinfo.getDate(singerinfo.addTime)}</td>
					<td>性别:</td>
					<td class="space">
						<input type="radio" name="gender" value="1" 
							<c:if test="${singerinfo.gender==1 }">
								checked="checked"
							</c:if>
						/>男
						<input type="radio" name="gender" value="2" 
							<c:if test="${singerinfo.gender==2 }">
								checked="checked"
							</c:if>
						/>女
					</td>
				</tr>
				<tr>
					<td>热度:</td>
					<td class="space">${singerinfo.hot }</td>
					<td>歌手图片:</td>
					<td class="space">
						<c:choose>
							<c:when test="${singerinfo.img == null }">
								<input type="file" name="imgUrl" id="img">
							</c:when>
							<c:otherwise>
								<img src="<%=request.getContextPath() %>/${singerinfo.img }" width="60px" height="80px">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>歌手信息:</td>
					<td rowspan="2"><textarea rows="20" cols="30" name="singerInfo" style="height:200px;">${singerinfo.singerInfo }</textarea></td>
				</tr>
				<tr></tr>
				<tr>
					<td>修改时间：</td>
					<td>
						<c:choose>
							<c:when test="${singerinfo.updateTime == 0 }">
								${singerinfo.getDate(singerinfo.addTime) }
							</c:when>
							<c:otherwise>
								${singerinfo.getDate(singerinfo.updateTime) }
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>歌手名称：</td>
					<td>
						${singerinfo.singerName }
					</td>
				</tr>	
				<tr>
					<td><input type="hidden" name="id" value="${singerinfo.id }"></td>
				</tr>	
			</table>
			<div class="opera">
				<input type="submit" value="添加" class="btn btn-success">
				<input type="button" value="返回" onclick="history.go(-1)" class="btn btn-primary">
			</div>
		</form>
	</div>
	
</body>
</html>