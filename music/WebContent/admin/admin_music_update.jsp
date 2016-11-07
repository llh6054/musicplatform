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
		<form  action="<%=request.getContextPath() %>/music/addMusic?action=update" method="post">
			<table class="table">
				<tr>
					<td>
						<label class="form-label">专辑：</label>
					</td>
					<td class="space"><input type="text" name="ablum" value="${musicinfo.ablum }"></td>
					<td>添加时间:</td>
					<td class="space">${musicinfo.getDate(musicinfo.addTime) }</td>
				</tr>
				<tr>
					<td>热度:</td>
					<td class="space">${musicinfo.hot }</td>
				</tr>
				<tr>
					<td>歌曲名称:</td>
					<td class="space">${musicinfo.musicName }</td>
				</tr>
				<tr>
					<td>歌曲信息</td>
					<td rowspan="2"><textarea rows="20" cols="15" name="musicInfo" style="height:200px;">${musicinfo.musicInfo }</textarea></td>
					<td>歌曲原名称：</td>
					<td>${musicinfo.musicOriginalName }</td>
				</tr>
				<tr></tr>
				<tr>
					<td>歌手：</td>
					<td>${musicinfo.singer }</td>
					<td>歌曲链接</td>
					<td>
						${musicinfo.url }
					</td>
				</tr>	
				<tr>
					<td>修改时间：</td>
					<td>
						<c:choose>
							<c:when test="${musicinfo.updateTime == 0 }">
								${musicinfo.getDate(musicinfo.addTime) }
							</c:when>
							<c:otherwise>
								${musicinfo.getDate(musicinfo.updateTime) }
							</c:otherwise>
						</c:choose>
					</td>
				</tr>	
				<tr>
					<td><input type="hidden" name="id" value="${musicinfo.id }"></td>
				</tr>	
			</table>
			<input type="submit" value="修改" class="btn btn-success">
			<input type="button" value="返回" onclick="history.go(-1)" class="btn btn-primary">
		</form>
	</div>
	
</body>
</html>