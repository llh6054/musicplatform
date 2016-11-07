<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bootstrap.css" />
<style>
	.container{width:600px; height:600px;  margin:10px auto;}
 	.check{color:red;}
 	tr{height:50px;}
 	#add{margin-right:80px; margin-top:50px; float:right}
 	form{margin-top:50px;}
/*  	#back{marginn-right:20px; margin-top:50px; float:right} */
</style>
<script type="text/javascript">

	
	//验证用户名
	function checkName() {
		var userName = document.getElementsByName("userName")[0].value;
		if(userName == "" || userName == null) {
			document.getElementById("ck_userName").innerHTML= "用户名不能为空";
		}else{
			document.getElementById("ck_userName").innerHTML = "*";
		}
	}
	
	//验证密码
	function checkPassword() {
		var password = document.getElementsByName("password")[0].value;
		if(password == "") {
			document.getElementById("ck_password").innerHTML= "密码不能为空";
		}else if(password.length <6) {
			document.getElementById("ck_password").innerHTML = "密码应大于6位";
		}else{
			document.getElementById("ck_password").innerHTML = "*";
		}
	}
	
	//确认密码
	function reCheckPassword() {
		var password = document.getElementsByName("password")[0].value;
		var re_password = document.getElementsByName("re_password")[0].value;
		if(password !== re_password) {
			document.getElementById("ck_re_password").innerHTML = "两次密码不一致，请重新输入";
		}else {
			document.getElementById("ck_re_password").innerHTML = "*";
		}
		
	}
	
	//验证邮箱
	function checkEmail() {
		var email = document.getElementsByName("email")[0].value;
		if(email == "") {
			document.getElementById("ck_email").innerHTML= "邮箱不能为空";
		}
// 		else if(password.length <6) {
// 			document.getElementById("ck_email").innerHTML = "邮箱格式不正常";
// 		}
		else{
			document.getElementById("ck_email").innerHTML = "*";
		}
	}
	
	//注册
	function register() {
		var userName = document.getElementsByName("userName")[0].value;
		var password = document.getElementsByName("password")[0].value;
		var re_password = document.getElementsByName("re_password")[0].value;
		var	gender = document.getElementsByName("gender")[0].value;
		var email = document.getElementsByName("email")[0].value;
		
		if(userName != "" && password != "" && re_password != "" && gender != "" && email != "" && password == re_password) {
			var form = document.forms[0];
//			window.location.href = "<%=request.getContextPath() %>/user/register?action=register";
	 		form.action = "<%=request.getContextPath() %>/user/register?action=register";
 	 		form.method = "post";
 	 		form.target = "music";
 	 		form.submit();
		}else {
			window.confirm("请填写必填项");
		}
		
		
// 		
	}
</script>
</head>
<body>
	<div class="container">
		<form target="music">
			<table class="table">
				<tr>
					<td>用户名：</td>
					<td>
						<input type="text" placeholder="用户名" name="userName" onBlur="checkName()" />
						<span class="check" id="ck_userName">*</span>
					</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td>
						<input type="password" placeholder="密码" name="password" onBlur="checkPassword()"/>
						<span class="check" id="ck_password">*</span>
					</td>	
				</tr>
				<tr>
					<td>确认密码：</td>
					<td>
						<input type="password" placeholder="验证密码" name="re_password" onBlur="reCheckPassword()"/>
						<span class="check" id="ck_re_password">*</span>
					</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						男：<input type="radio" name="gender" value="1" />
						女：<input type="radio" name="gender" value="2" />
						<span class="check" id="ck_gender">*</span>
					</td>
				</tr>
				<tr>
					<td>邮箱：</td>
					<td>
						<input type="text" placeholder="邮箱" name="email" onBlur="checkEmail()"/>
						<span class="check" id="ck_email">*</span>
					</td>
				</tr>
			</table>
			<input type="button" value="注册" onclick="register()" id="add" class="btn btn-primary"/>
<!-- 			<input type="button" value="返回" onclick="history.go(-1)" id="back" /> -->
		</form>
	</div>
	
</body>
</html>