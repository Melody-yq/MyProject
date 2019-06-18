<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品展示主页</title>
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
<script type="text/javascript">
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
	var curr_pageno = 0;
	var curr_pagesum = 0;
	function menu(pageno) {
		var xmlhttp = getXMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var str = xmlhttp.responseText;
				//str就是json
				//将JavaScript对象表示法的JSON字符串转换为对象
				var object = JSON.parse(str);
				var products = object.products;
				curr_pageno = object.pageNo;
				curr_pagesum = object.pageSum;
				var temp = "";
				//设置间隔颜色
				for (var i = 0; i < products.length; i++) {
					var classString = "";
					if (i % 2 == 1) {
						classString = "class='info'";
					}
					temp = temp + "<tr "+classString+"><td>" + products[i].id
							+ "</td><td>" + products[i].name + "</td><td>"
							+ products[i].price + "</td><td>"
							+ products[i].superprice
							+ "</td><td><a href=\"list?id=" + products[i].id
							+ "\">修改</a></td><td><a href=\"delete?id="
							+ products[i].id + "\">删除</a></td></tr>"
				}
				document.getElementById("apper").innerHTML = temp;
				//计算应该有多少个按钮
				temp = "";
				//上一页
				temp = temp
						+ "<li><a href=\"#\" onclick=\"return gopage(-1)\">上一页</a></li>";
				for (var i = 0; i < object.pageSum; i++) {
					//数组对应页码
					temp = temp + "<li><a href=\"#\" onclick=\"return menu("
							+ (i + 1) + ")\">" + (i + 1) + "</a></li>";
				}
				//下一页
				temp = temp
						+ "<li><a href=\"#\" onclick=\"return gopage(1)\">下一页</a></li>";

				document.getElementById("pge").innerHTML = temp;
			}

		};
		var url = "page";
		//打开连接,以post方式打开url这个连接
		xmlhttp.open("post", url);
		//设置请求头信息
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("pagesize=5&pageno=" + pageno);
		//点击页码的时候，不会发生跳转
		return false;
	}

	//上一页下一页专用方法
	//n可能是-1或者1
	function gopage(n) {
		if (curr_pageno + n == 0) {
			//你点击的是第1页的前一页
			return false;
		}
		if (curr_pageno + n == curr_pagesum + 1) {
			//你点击的是最后一页的下一页
			return false;
		}

		curr_pageno = curr_pageno + n;
		menu(curr_pageno);
		return false;
	}
</script>
</head>
<body onload="menu(1)">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3>菜品展示</h3>
				<a href="add.jsp" class="btn btn-default">添加</a>
				<table class="table">
					<thead>
						<tr>
							<th>编号</th>
							<th>名称</th>
							<th>价格</th>
							<th>会员价格</th>
							<th colspan="2">操作</th>
						</tr>
					</thead>
					<tbody id="apper">
					</tbody>
				</table>
				<ul class="pagination" id="pge">
				</ul>
			</div>
		</div>
	</div>
</body>
</html>