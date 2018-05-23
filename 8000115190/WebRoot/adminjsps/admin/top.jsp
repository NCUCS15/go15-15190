<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    <base target="body">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {font-size: 10pt; bgcolor:#99CC99;}
	a {color: #aaa;}
	.button {  
    display: inline-block;  
    zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */  
    *display: inline;  
    vertical-align: baseline;  
    margin: 0 2px;  
    outline: none;  
    cursor: pointer;  
    text-align: center;  
    text-decoration: none;  
    font: 14px/100% Arial, Helvetica, sans-serif;  
    padding: .5em 2em .55em;  
    text-shadow: 0 1px 1px rgba(0,0,0,.3);  
    -webkit-border-radius: .5em;   
    -moz-border-radius: .5em;  
    border-radius: .5em;  
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);  
    box-shadow: 0 1px 2px rgba(0,0,0,.2);  
}  
.button:hover {  
   text-decoration: none;  
}  
.button:active {  
    position: relative;  
    top: 1px;  
}  
 
.bigrounded {  
    -webkit-border-radius: 2em;  
    -moz-border-radius: 2em;  
    border-radius: 2em; 
}
.red {  
   color: #faddde;  
    border: solid 1px #980c10;  
    background: #d81b21;  
    background: -webkit-gradient(linear, left top, left bottom, from(#ed1c24), to(#aa1317));  
    background: -moz-linear-gradient(top,  #ed1c24,  #aa1317);  
   filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ed1c24', endColorstr='#aa1317');  
}  
.red:hover {  
    background: #b61318;  
    background: -webkit-gradient(linear, left top, left bottom, from(#c9151b), to(#a11115));  
    background: -moz-linear-gradient(top,  #c9151b,  #a11115);  
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#c9151b', endColorstr='#a11115');  
}  
.red:active {  
    color: #de898c;  
    background: -webkit-gradient(linear, left top, left bottom, from(#aa1317), to(#ed1c24));  
    background: -moz-linear-gradient(top,  #aa1317,  #ed1c24);  
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#aa1317', endColorstr='#ed1c24');  
}  
</style>
</head>
  
<body bgcolor="#497940">
<div style="line-height: 10px;" >
	<div><p style="color:white ;font-size:20px">尊敬的 ${sessionScope.admin.adminname },欢迎进入本系统！
	<a target="_top" href="<c:url value='/adminjsps/login.jsp'/>" class="button red bigrounded">退出</a></p></div>
<span style="padding-left:50px;">
		<a href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>">分类管理</a>
		<a href="<c:url value='/adminjsps/admin/book/body.jsp'/>">图书管理</a>
		<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>" target="body">订单管理</a>
		<a href="<c:url value='/admin/AdminOrderServlet?method=finduser'/>" target="body">用户管理</a>
	</span>
</div>
	
</body>
</html>
