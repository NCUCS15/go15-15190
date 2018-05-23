<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>left</title>
    <base target="body"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/left.css'/>">
</head>
<body>  
<c:forEach items="${parents}" var="parent">
	<div class="menuItem" >${parent.cname}</div>
  <c:forEach items="${parent.children}" var="child">
	<a href="/8000115190/BookServlet?method=findByCategory&cid=${child.cid}" target="body"><div class="menuchild">${child.cname}</div></a>
  </c:forEach>
</c:forEach>
</body>
</html>
