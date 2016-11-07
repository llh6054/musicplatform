<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.min.js"></script>
<style>
	.container{margin:0 auto; width:500px; height:500px; }
	.login{margin:100px; }
 	
</style>
<script type="text/javascript">
	//异步登录
	function login() {
		var userName = document.getElementsByName("userName")[0].value;
		var password = document.getElementsByName('password')[0].value;
		if(userName == "") {
			window.confirm("请填写用户名!!!");
			return false;
		}
		if(password == ""){
			windows.confirm("请填写密码！！！");
			return false;
		}else {
			$.post('<%=request.getContextPath()%>/user/login', {'userName':userName, 'password':password, 'action':"action"}, function(data) {
				//alert(data);
				if(data == 1)
					window.parent.location.href = "<%=request.getContextPath()%>/home/index";
				else
					window.confirm("用户名或密码错误,请重新输入");
			}, 'json');
		}
	}
	
	
</script>
</head>
<body>
	<div class="container">
		<div class="login">
			<form class="form-inline">
				用户名：<input type="text"  name="userName" placeholder="用户名" class="form-control"/><br>
				密码：　<input type="password" name="password" placeholder="密码" class="form-control"/><br>
				<input type="button" onclick="login()" value="登录" class="btn btn-success"/>
				<input type="reset" value="重置" class="btn btn-primary">
			</form>
		</div>
	</div>
	
</body>
</html>