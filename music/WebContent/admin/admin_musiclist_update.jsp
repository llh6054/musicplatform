<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<form action="<%=request.getContextPath() %>/musicList/admin_musiclist_update?action=update" method="post" class="form-inline">
			<table class="table">
				<tr>
					<td>
						<label class="form-label">歌单图片：</label>
					</td>
					<td>
						<img src="<%=request.getContextPath() %>/${listinfo.image }">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">歌单名称：</label>
					</td>
					<td class="space">
						<input type="text" name="listName" value="${listinfo.listName }">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">歌单描述：</label>
					</td>
					<td class="space">
						<textarea name="listDesc" style="height:200px;">${listinfo.listDesc }</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">歌单类型：</label>
					</td>
					<td class="space">
						<input type="text" name="listType" value="${listinfo.listType }">
					</td>
				</tr>
			</table>
			<input type="hidden" value="${listinfo.id }" name="id" />
			<input type="submit" value="修改" class="btn btn-success">
			<input type="button" value="返回" class="btn btn-primary" onclick="history.go(-1)">
		</form>
	</div>
	
</body>
</html>