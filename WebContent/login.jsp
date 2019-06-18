<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<script type="text/javascript">
	// 检查用户是否输入信息
	function checkInput() {
		var username = form1.username;
		var password = form1.password;

		if (username.value.length == 0) {
			alert("请输入用户名!");
			username.focus();
			return false;
		}
		if (password.value.length == 0) {
			alert("请输入密码!");
			password.focus();
			return false;
		}
		return true;
	}
	//用户登录
	function userLogin() {
		// 判断用户是否输入信息, 若输入信息则设置 action 跳转到 checkLoginServlet
		if (checkInput()) {
			form1.action = "checklogin";
			form1.submit();
		}
	}
</script>

</head>
<body >
	<h1 align="center">登录界面</h1>
	<form method="post" name="form1">
		<table align="center">
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password" /> <br /></td>
			</tr>

			<tr>
				<td><input type="button" value="登录" onclick="userLogin()" /></td>
				<td align="right"><input type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</body>

</html>