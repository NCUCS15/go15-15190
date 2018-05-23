<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/login.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/css/style.css'/>">
	<script src="<c:url value='/js/common.js'/>"></script>

<script type="text/javascript">
	$(function() {/*Map<String(Cookie名称),Cookie(Cookie本身)>*/
		// 获取cookie中的用户名
		var loginname = window.decodeURI("${cookie.loginname.value}");
		if("${requestScope.user.loginname}") {
			loginname = "${requestScope.user.loginname}";
		}
		$("#loginname").val(loginname);
	});
</script>
  </head>
  
  <body>
<h1>User Login</h1>
<div class="login-form">
	<div class="close"><a href="<c:url value='/jsps/user/regist.jsp'/>"> 注册</a>&nbsp;&nbsp;&nbsp;<a href="<c:url value='/adminjsps/login.jsp'/>">管理员登陆</a></div>
	
		<div class="head-info">
			<label class="lbl-1"> </label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
			<div class="clear"> </div>
	<div class="avtar">
	</div>
	<form target="_top" action="<c:url value='/UserServlet?method=login'/>" method="post" >
			<input type="text" name="loginname" id="loginname" value="zhangsan"/>
			<input type="password" name="loginpass" id="loginpass" value="123"/>
			<div class="signin">
				<input type="submit" value="Login" id="submit">
			</div>
	</form>

</div>

</html>
	