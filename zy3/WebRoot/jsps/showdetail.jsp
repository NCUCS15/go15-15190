<%@ page language="java" import="java.util.*,java.sql.*,cn.itcast.goods.book.domain.Book,cn.itcast.goods.category.domain.Category" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>detail</title>
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
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/desc.css'/>">
	<script src="<c:url value='/jsps/js/book/desc.js'/>"></script>
</head>
<body>
<% 
		request.setCharacterEncoding("UTF-8");
		String param2=(String)request.getParameter("param2");
        String method = request.getMethod();  
		if("GET".equals(method)){
		      param2 = new String(param2.getBytes("iso-8859-1"),"gb2312");
		}
		param2 = request.getParameter("param2").trim();
        param2 = new String(param2.getBytes("iso-8859-1"),"gb2312");

		String sql="select * from t_book where bid = '"+param2.toString()+"'";
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
		String dis=rs.getString("discount");
		String date=rs.getString("publishtime");
		Book book =new Book();
		book.setBname(bname);
		book.setAuthor(author);
		book.setImage_w(imgw);
		book.setImage_b(imgb);
		book.setPress(press);
		book.setCurrPrice(Double.parseDouble(curr));
		books.add(book);
		}
		
		session.setAttribute("showdetails", books);
		rs.close();	
%>
<c:forEach items="${showdetails}" var="book">
 
  <div style="font-size:20px">
    <img align="top" src="<c:url value='/${book.image_w }'/>" class="img_image_w"/>
    <div class="divBookName">${book.bname }
	<table style="width: 60%;margin:auto">
			<tr>
				<td colspan="3">现价：${book.currPrice }</td>
	    	</tr>
	    		
			<tr>
				<td colspan="3">原价：${book.price }</td>
	    	</tr>
			<tr>
				<td colspan="3">
					作者：${book.author } 著
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：${book.press }
				</td>
			</tr>
		</table>
	</div>
  </div>
 </c:forEach>
   </body>
</html>
