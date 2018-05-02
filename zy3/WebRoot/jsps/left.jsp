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
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/left.css'/>">

</head>




<body>  
 <% 
		String sql="select * from t_category where pid is null";
		Class.forName("org.sqlite.JDBC");
		Connection conn=DriverManager.getConnection("jdbc:sqlite::resource:mydb.db");
		Statement stat=conn.createStatement();
		ResultSet rs=stat.executeQuery(sql);
		ArrayList categorys= new ArrayList();
		while(rs.next()){
		String Name=rs.getString("cname");
		Category category =new Category();
		category.setCname(Name);
		
		String sqlchildren = "select t2.cname from t_category t1,t_category t2 where t1.cname='"+Name.toString()+"' and t1.cid=t2.pid";
		String sqlcid = "select t2.cid from t_category t1,t_category t2 where t1.cname='"+Name.toString()+"' and t1.cid=t2.pid";

		Connection childconn=DriverManager.getConnection("jdbc:sqlite::resource:mydb.db");
		
		Statement childstat=childconn.createStatement();
		Statement childcid=childconn.createStatement();
		ResultSet rschildren=childstat.executeQuery(sqlchildren);
		ResultSet rscid=childcid.executeQuery(sqlcid);
		ArrayList childrencategorys= new ArrayList();
		while(rschildren.next() && rscid.next()){
		String childrenName=rschildren.getString("cname");
		String childrencid=rscid.getString("cid");
		Category childrencategory =new Category();
		childrencategory.setCname(childrenName);
		childrencategory.setCid(childrencid);
		childrencategory.setParent(category);
		childrencategorys.add(childrencategory);
		}
		category.setChildren(childrencategorys);
		categorys.add(category);
		} 
		session.setAttribute("parents", categorys);
		rs.close();
%>

<c:forEach items="${parents}" var="parent">
	<div class="menuItem" ><h2>${parent.cname}</h2></div>
  <c:forEach items="${parent.children}" var="child">
	<a href="showbook.jsp?param=${child.cid}" target="body"><div class="menuchild">${child.cname}</div></a>
  </c:forEach>
</c:forEach>
</body>
</html>
