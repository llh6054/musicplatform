<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.12.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
<script>


	function addMusicList(){
		//alert("uploadFile");
		var file = document.getElementById("file").value;
		if(file.length != 0) {
			var form = document.forms[0];
			form.enctype = "multipart/form-data";
			form.action = "<%=request.getContextPath() %>/musicList/admin_musiclist_add?action=add";
			form.method = "post";
			form.submit();
		}else {
			window.confirm("请选择歌单图片上传！");
		}
	}
</script>
</head>
<body>
	<div class="container">
		<form>
			<table class="table">
				<tr>
					<td>
						<label class="form-label">歌单图片：</label>
					</td>
					<td>
						<input type="file" name="file" id="file"/>
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">歌单名称：</label>
					</td>
					<td class="space">
						<input type="text" name="listName">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">歌单描述：</label>
					</td>
					<td class="space">
						<textarea name="listDesc" style="heigth:400px;"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">歌单类型：</label>
					</td>
					<td class="space">
						<input type="text" name="listType">
					</td>
				</tr>
			</table>
			<input type="button" value="添加" class="btn btn-success" onclick="addMusicList()">
			<input type="button" value="返回" class="btn btn-primary" onclick="history.go(-1)">
		</form>
	</div>
	
</body>
</html>