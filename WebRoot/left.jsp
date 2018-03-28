<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="css/reset.css"/> 
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<div class="content-top">
        <div class="sidebar">
            <h3>书籍分类</h3>
            <!--sidebar-info-->
            <div class="sidebar-info">
                <ul class="side-li">
                    <li ><h3>编程书籍<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li ><h3>小说<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li ><h3>散文<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li ><h3>诗集<span class="fa fa-angle-right fa-loc"></span></h3></li>
                    <li ><h3>传记<span class="fa fa-angle-right fa-loc"></span></h3></li>
                </ul>
                <ul class="hiden-box">
               
				</ul>
			</div>
		</div>
	</div>
	<script src="js/jquery_1.9.js"></script>
    	<script src="js/main.js"></script>
    	<script src="js/img-show.js"></script>            
</body>
</html>
