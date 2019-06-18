<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/`	" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">
<!-- 利用js输出 -->
	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">	
		d = new dTree('d');
		d.add('0',-1,'系统菜单');//在树中增加节点。节点id是0，父节点是-1(根节点)
		d.add('1','0','菜单栏','','','mainFrame');
		d.add('11','1','现有菜单','${pageContext.request.contextPath}/index.jsp','','mainFrame');//根节点的子节点(父节点是0)，将question.jsp跳转到mainFrame页面
		d.add('12','1','主食','${pageContext.request.contextPath}/admin/category/list.jsp','','mainFrame');
		d.add('13','1','汤类','${pageContext.request.contextPath}/admin/category/list.jsp','','mainFrame');
		d.add('2','0','餐桌预定');
		d.add('21','2','现有餐桌','${pageContext.request.contextPath}/admin/product/list.jsp','','mainFrame');
		d.add('3','0','客服');
		d.add('31','3','帮助','${pageContext.request.contextPath}/admin/category/list.jsp','','mainFrame');
		document.write(d);
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
