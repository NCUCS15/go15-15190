<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 	<frameset rows="25%,55%,20%" border="0" id="mmm">
		<frame src="top.jsp" noresize scrolling="no" name="top"></frame>
		<frameset cols="15%,85%">
			<frame src="left.jsp" noresize scrolling="no" name="left"></frame>
			<frame src="right.jsp" noresize scrolling="no" name="right"></frame>
		</frameset>
		<frame src="bottom.jsp" noresize scrolling="no" name="bottom"></frame>
	</frameset>
	<script src="js/jquery_1.9.js"></script>
    	<script src="js/main.js"></script>
    	<script src="js/img-show.js"></script>
</html>
