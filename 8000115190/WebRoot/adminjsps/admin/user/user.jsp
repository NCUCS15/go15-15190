<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/list.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
  </head>
  
  <body>
  <h2>用户信息</h2>
<div class="divMain">
	<div class="divTitle">
		<span style="margin-left: 150px;margin-right: 120px;">用户ID</span>
		<span style="margin-left: 40px;margin-right: 100px;">用户名</span>
		<span style="margin-left: 50px;margin-right: 100px;">邮箱/span>
		<span style="margin-left: 50px;margin-right: 50px;">状态</span>
	</div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">

<c:forEach items="${userList}" var="order">

		<tr class="tt">
			<td width="320px">${order.uid }</td>
			<td width="200px">${order.loginname}</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>

			<td width="200px">
				<span class="price_t">&yen;${order.email }</span>
			</td>

		
</c:forEach>

</tr>
	</table>
</div>
  </body>
</html>
