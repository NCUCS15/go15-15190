<%@ page language="java" import="java.util.*,java.sql.*,cn.itcast.goods.book.domain.Book,cn.itcast.goods.category.domain.Category" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/list.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/left.css'/>">

</head>
<body>
<% 
		request.setCharacterEncoding("UTF-8");
		String param=(String)request.getParameter("param");
        String method = request.getMethod();  
		if("GET".equals(method)){
		      param = new String(param.getBytes("iso-8859-1"),"gb2312");
		}
		param = request.getParameter("param").trim();
        param = new String(param.getBytes("iso-8859-1"),"gb2312");
		String sql="select * from t_book where cid = '"+param.toString()+"'";
		Class.forName("org.sqlite.JDBC");
		Connection conn=DriverManager.getConnection("jdbc:sqlite::resource:mydb.db");
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		ArrayList books= new ArrayList();
		while(rs.next()){
		String bname=rs.getString("bname");
		String author=rs.getString("author");
		String imgw=rs.getString("image_w");
		String imgb=rs.getString("image_b");
		String press=rs.getString("press");
		String price=rs.getString("price");
		String curr=rs.getString("currPrice");
		String bid=rs.getString("bid");
		Book book =new Book();
		book.setBname(bname);
		book.setAuthor(author);
		book.setImage_w(imgw);
		book.setImage_b(imgb);
		book.setPress(press);
		book.setCurrPrice(Double.parseDouble(curr));
		book.setPrice(Double.parseDouble(price));
		book.setBid(bid);
		books.add(book);
		} 
		session.setAttribute("showbooks", books);
		rs.close();

		
%>
<ul>

<c:forEach items="${showbooks}" var="book">
 <li>
  <div class="inner">
    <a href="showdetail.jsp?param2=${book.bid}" target="body"><img src="<c:url value='/${book.image_b }'/>" border="0"/></a>
    <p class="price">
    	<span class="price_n">&yen;${book.currPrice }</span>
		<span class="price_r">&yen;${book.price }</span>
	</p>
	<p><a id="bookname" title="${book.bname }" href="showdetail.jsp?param2=${book.bid}">${book.bname }</a></p>
	<p><a href="showdetail.jsp?param2=${book.bid}" name='P_zz' title='${book.author }'>${book.author }</a></p>
	<p class="publishing">
		<span>出 版 社：</span>${book.press }
	</p>
	
  </div>
  </li>
</c:forEach>
</ul>
<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>
  </body>
</html>
