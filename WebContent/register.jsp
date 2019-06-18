<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var n = 0;
	function onimg() {
		//使得img的src重新请求图片验证码的那个servlet
		document.getElementById("img").src = "imagecode?n=" + n;
		n++;
	}
</script>
<script>
	function getXMLHttpRequest() {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			//主流浏览器
			xmlhttp = new XMLHttpRequest();
		} else {
			//ie6,7……
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		return xmlhttp;
	}
	var tpu = false;
	var tpp = false;
	var tpc = false;
	function onusername() {
		var username = document.getElementById("username").value;
		var usernametext = document.getElementById("usernametext");
		if (username.length < 6) {
			//用户名不可少于6位。
			usernametext.style.color = "red";
			usernametext.innerHTML = "用户名不可少于6位";
			tpu = false;
			return;
		} else {
			usernametext.style.color = "green";
			usernametext.innerHTML = "用户名可用";
			tpu = true;
		}

		var xmlhttp = getXMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				//请求状态是成功（200），读取响应完成（4）
				var str = xmlhttp.responseText;
				if (str == "true") {
					//可用
					usernametext.style.color = "green";
					usernametext.innerHTML = "用户名可用";
					tpu = true;
				} else {
					//不可用
					usernametext.style.color = "red";
					usernametext.innerHTML = "用户名已经存在";
					tpu = false;
				}
			}
		};
		var url = "checkusername";
		xmlhttp.open("post", url);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("username=" + username);
		return false;
	}

	function oncheckcode() {
		var userCheckCode = document.getElementById("checkcode").value;
		var checkcodetext = document.getElementById("checkcodetext");
		if (userCheckCode.length != 4) {
			//断定，验证码输入错误
			checkcodetext.style.color = "red";
			checkcodetext.innerHTML = "验证码位数不对";
			tpc = false;
			return;
		}
		var xmlhttp = getXMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				//把str和用户输入的checkcode对比
				if (str == userCheckCode) {
					//验证码输入正确
					checkcodetext.style.color = "green";
					checkcodetext.innerHTML = "验证码正确";
					tpc = true;
				} else {
					//验证码输入错误
					checkcodetext.style.color = "red";
					checkcodetext.innerHTML = "验证码有误";
					tpc = false;
				}
			}
		};
		var url = "textcode";
		//打开连接,以post方式打开url这个连接
		xmlhttp.open("post", url);
		//设置请求头信息
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send();
		//永远让登录点击失效
		return false;
	}

	function onpassword() {
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		var passwordtext = document.getElementById("passwordtext");
		if (password == repassword) {
			passwordtext.style.color = "green";
			passwordtext.innerHTML = "两次密码输入一致";
			tpp = true;
		} else {
			passwordtext.style.color = "red";
			passwordtext.innerHTML = "两次密码输入不一致";
			tpp = false;
		}
	}
	function onregister() {
		if (tpu && tpc && tpp) {
			return true;

		}
		return false;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row clearfix" style="height: 150px;">
			<div class="col-md-12 column">
				<ul class="nav nav-tabs" style="height: 60px; font-size: 20px;">
					<li><a href="#">首页</a></li>
					<li><a href="#">简介</a></li>
					<li><a href="#">信息</a></li>
					<li class="dropdown pull-right"><a href="login.jsp"
						class="dropdown-toggle">登录</a></li>
				</ul>
				<h2 align="center">欢迎注册</h2>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-8 column" style="height: 400px">

				<div id="myCarousel" class="carousel slide">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner" style="height: 400px">
						<div class="item active">
							<img src="images/1.jpg">
						</div>
						<div class="item">
							<img src="images/2.jpg">
						</div>
						<div class="item">
							<img src="images/3.jpg">
						</div>
						<div class="item">
							<img src="images/4.jpg">
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-md-4 column">
				<form method="post" name="form"
					action="${pageContext.request.contextPath }/adduser">
					<div class="form-group">
						<label id="usernametext">用户名</label><input type="text"
							onkeyup="onusername()" class="form-control" id="username"
							name="username" />
					</div>
					<div class="form-group">
						<label>用户密码</label><input type="password" class="form-control"
							id="password" name="password" />
					</div>
					<div class="form-group">
						<label id="passwordtext">确认密码</label><input onblur="onpassword();"
							type="password" class="form-control" id="repassword" />
					</div>
					<div class="form-group">
						<label id="checkcodetext">验证码</label><input
							onblur="oncheckcode();" type="text" class="form-control"
							id="checkcode" name="checkcode" /> <img id="img" src="imagecode"
							onclick="onimg();" />&nbsp;&nbsp;<font size="1px"
							color="#C0C0C0">点击图片切换验证码</font>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" />同意并愿意遵守 <a href="#">用户协议</a></label>
					</div>
					<button type="submit" class="btn btn-default"
						onclick="return onregister();">注册</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>