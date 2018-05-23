<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'left.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/left.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/left.css'/>">
<style>

/* 下拉按钮样式 */
.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    width:180px;   
    font-size: 16px;
    cursor: pointer;
     border: 2px solid #4CAF50;
}

/* 容器 <div> - 需要定位下拉内容 */
.dropdown {
    position: relative;
    display: inline-block;
    width:180px;
}

/* 下拉内容 (默认隐藏) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 180px;
    
}
a:hover { background-color:yellow; } 
/* 下拉菜单的链接 */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    border:1px;
}

/* 鼠标移上去后修改下拉菜单链接颜色 */
.dropdown-content a:hover {background-color: #f1f1f1}

/* 在鼠标移上去后显示下拉菜单 */
.dropdown:hover .dropdown-content {
    display: block;
}

/* 当下拉内容显示后修改下拉按钮的背景颜色 */
.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}
</style>
</head>
<body bgcolor="#497940">		
<a href="/admin/AdminCategoryServlet?method=findAll/>" target="_body" > <button class="dropbtn">分类管理</button></a>
<a href="<c:url value='/adminjsps/admin/body.jsp'/>" target="_body"><button class="dropbtn">用户管理</button></a>
<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>" target="_body"><button class="dropbtn">订单管理</button></a>
<div class="dropdown">
<button class="dropbtn">图书</button>
<div class="dropdown-content">
    <a href="<c:url value='/8000115190/AdminBookServlet?method=addPre'/>" target="_body">添加图书</a>
    <a target="_body" href="<c:url value='/adminjsps/admin/book/gj.jsp'/>" >图书查询</a>
</div>
</div>
</body>
</html>
