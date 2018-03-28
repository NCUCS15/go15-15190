<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <title>书店</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>

<body>
    <!--scroll-head-->
    <div class="scroll-head"></div>
    <!--top-->
    <div class="top-wrapper">
        <div class="top-info">
            <div class="top-left">
                <div data-toggle="arrowdown" id="arrow1" class="user-name">
                    <a href="#">书店</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow2" class="msg-info">
                    <i class="fa fa-envelope fa-gray"></i>
                    <a href="#">消息</a>
                    <span class="down-icon"></span>
                </div>
                <!--hidden-box-->
                <div data-toggle="hidden-box" id="nav-box1" class="user-box">
                    <img class="my-head" src="img/user-head.jpg" />
                    <div class="my-grow">
                        <h1><a href="#">登录</a>&nbsp;|&nbsp;<a href="#">注册</a><br></h1>
                    </div>
                    <p style="height: 10px; clear: both;">&nbsp;</p> 
                </div>
                <div data-toggle="hidden-box" id="nav-box2" class="msg-box">
                    <h1>新消息<a href="#" class="fa fa-pencil-square-o pencil"></a></h1>
                    <div class="msg-setting">
                        <a href="#" class="fa fa-cog"></a>
                        <a href="#" class="fa fa-pencil-square-o"></a>
                        <a style="margin-left: 70px" href="#">买家消息&nbsp;|&nbsp;</a>
                        <a href="#">卖家消息</a>
                    </div>
                </div>
            </div>
            <!--top-right-->
            <div class="top-right">
                <div data-toggle="arrowdown" id="arrow3" class="user-name">
                    <a href="#">我的书店</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <a href="#">购物车</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-star fa-gray"></i>
                    <a href="#">收藏夹</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">商品分类</a>
                <span class="vertical-line">|</span>
                <div data-toggle="arrowdown" id="arrow6" class="user-name">
                    <a href="#">卖家中心</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">联系客户</a>
                <div data-toggle="arrowdown" id="arrow7" class="user-name">
                    <i class="fa fa-list-ul fa-orange"></i>
                    <a href="#">网站导航</a>
                    <span class="down-icon"></span>
                </div>
                <!--hidden-box-->
                <div data-toggle="hidden-box" id="nav-box3" class="my-taobao-box">
                    <ul>
                        <li>已购书籍</li>
                        <li>我的足迹</li>
                        <li>书籍上新</li>
                        <li>优惠券</li>
                    </ul>
                </div>
                <div data-toggle="hidden-box" id="nav-box4" class="shopping-box">
                    <a class="check-shopp" href="#">查看我的购物车</a>
                </div>
                <div data-toggle="hidden-box" id="nav-box5" class="get-box">
                    <ul>
                        <li>收藏的书籍</li>
                        <li>收藏的店铺</li>
                    </ul>
                </div>
                <div data-toggle="hidden-box" id="nav-box6" class="center-box">
                    <ul>
                        <li>已卖书籍</li>
                        <li>服务市场</li>
                    </ul>
                </div>
                <div data-toggle="hidden-box" id="nav-box7" class="nav-box">
                    <div class="sub-nav top-sub-nav">
                
                     
                        <div class="sub-nav-cell right-shadow">
                            <h3 class="red-now">热卖书籍</h3>
                         
                        </div>
                        <div class="sub-nav-cell">
                            <h3 class="blue-more">更多精彩</h3>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
      
                      <form action="message.jsp" target="mmm">
                       <input class="search-in-scroll" type="text" name="message1" style="border:2px,solid">
                       <input type="submit" class="search-but-scroll" value="搜索">
                   </form>                    
         
   
	    <div class="top-main">
        <img src="img/logo.jpg" />
		&nbsp;&nbsp;&nbsp;
        <div class="search-wrapper">
            <div class="search-box">
                <div data-toggle="arrowdown" id="arrow8" class="search-toggle">
                    书籍<span class="down-icon"></span>
                </div>
                <input class="search-in" type="text" >
				
                <input type="button" class="search-but" value="搜索">
				
                <div data-toggle="hidden-box" id="nav-box8" class="search-toggle-box">店铺<span class="down-icon"></span></div>
            </div> 
        </div>
    </div>
    	<script src="js/img-show.js"></script>
		<script src="js/jquery_1.9.js"></script>
    	<script src="js/main.js"></script>
    	
</body>

</html>
