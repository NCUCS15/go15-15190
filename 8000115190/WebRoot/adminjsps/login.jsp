<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/css/style.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
	function checkForm() {
			if(!$("#adminname").val()) {
				alert("用户名不能为空！");
				return false;
			}
			if(!$("#adminpwd").val()) {
				alert("密码不能为空！");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
<h1>Admin Login</h1>
<div class="login-form">
	<div class="close"> </div>
		<div class="head-info">
			<label class="lbl-1"> </label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
			<div class="clear"> </div>
	<div class="avtar">
	</div>
	<form action="<c:url value='/AdminServlet?method=login'/>" method="post" onsubmit="return checkForm()" target="_top">
			<input type="text"  name="adminname" value="123" id="adminname" >
				<div class="key">
			<input type="password" value="123" name="adminpwd" id="adminpwd" >
				</div>
			<div class="signin">
				<input type="submit" value="Login" >
			</div>
	</form>

</div>
</body>
</html>