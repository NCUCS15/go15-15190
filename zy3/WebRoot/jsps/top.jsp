<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
		background: #99CC99;
		margin: 0px;
		color: #ffffff;
	}
</style>
  </head>
  
<body>
<div>

<table align="center">
<form action="show.jsp",method="post" target="_blank">
<tr>
	<td>用户名</td>
	<td><input name="ms1" type="text"></td>
</tr>
<tr>
	<td>&nbsp;密码</td>
	<td><input name="ms2" type="password"></td>
</tr>
<tr>
	<td ><input type="submit" value="登录"></td>
</tr>
</form>
</table>
</div>

<a href="login.jsp" target="blank">登录</a>|<a href="regist.jsp" target="blank">注册</a>
</body>
</html>
