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
<body>
    <div class="help">
        <div class="help-info">
			
            <h1><img src="img/help4.png"><span class="help-text">消费者保障</span></h1>
			<br>
            <a class="help-a" href="#">保障条件</a>&nbsp;
            <a class="help-a" href="#">退货</a>
			
        </div>
        <div class="help-info">
        	<h1><img src="img/help1.png"><span class="help-text">新手指南</span></h1>
			<br>
			<a class="help-a" href="#">消费提示</a>&nbsp;
            <a class="help-a" href="#">交易安全</a>
			
        </div>
        <div class="help-info">
            <h1><img src="img/help2.png"><span class="help-text">付款方式</span></h1>
			<br>
			<a class="help-a" href="#">在线快捷支付</a>&nbsp;
            <a class="help-a" href="#">货到付款</a>
		
        </div>
    </div>
    <!--footer-->
    <div class="footer">
        <div class="footer-right">
            <div class="footer-nav">
				<span class="help-text">友情链接</span>
                <a href="#">当当网</a>|
                <a href="#">二手书屋</a>|
                <a href="#">天猫</a>|
                <a href="#">支付宝</a>|
            </div>
		</div>
    </div>
	
    <div class="backtoTop" id="backToTop1">
        <div id="backToTop-up" class="up-back"><i class="fa fa-angle-up"></i></div>
        <div id="backToTop-down" class="down-back"><i class="fa fa-angle-down"></i></div>
    </div>
   <script src="js/jquery_1.9.js"></script>
    	<script src="js/main.js"></script>
    	<script src="js/img-show.js"></script>
</body>
</html>
