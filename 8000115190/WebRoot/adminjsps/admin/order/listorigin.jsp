<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单列表</title>
    
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
<div class="divMain">
	<div class="divTitle">
		<span style="margin-left: 150px;margin-right: 120px;">订单号</span>
		<span style="margin-left: 40px;margin-right: 100px;">下单时间</span>
		<span style="margin-left: 50px;margin-right: 100px;">金额</span>
		<span style="margin-left: 50px;margin-right: 50px;">状态</span>
	</div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">

<c:forEach items="${adminorderList}" var="order">

		<tr class="tt">
			<td width="320px">${order.oid }</td>
			<td width="200px">${order.ordertime }</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>

			<td width="200px">
				<span class="price_t">&yen;${order.total }</span>
			</td>
			<td width="150px">
<c:choose>
	<c:when test="${order.status eq 1 }">等待付款</c:when>
	<c:when test="${order.status eq 2 }">准备发货</c:when>
	<c:when test="${order.status eq 3 }">等待确认</c:when>
	<c:when test="${order.status eq 4 }">交易成功</c:when>
	<c:when test="${order.status eq 5 }">已取消</c:when>
</c:choose>			

			</td>

		
</c:forEach>

</tr>
	</table>
</div>
  </body>
</html>
