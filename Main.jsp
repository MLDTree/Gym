<%@page import="com.Bean.DBControl"%>
<%@page import="com.Bean.DataController"%>
<%@page import="com.Bean.NewsInfo"%>
<%@page import="com.Bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<head>
<title>哈工大体育场馆信息管理</title>

<link href="css/submain.css" rel="stylesheet" type="text/css" />

		<%
			if (!DBControl.isConnected())
			  DBControl.connctTo("forJavaEE");
			String ID1=""; //发起访问的人的ID
			if (session.getAttribute("USER")!=null)
			  ID1 = session.getAttribute("USER").toString();
			NewsInfo ni = DataController.getNewsInfo();
			ArrayList<String> nids = ni.getnids();
			ArrayList<String> titles = ni.getTitles();
			ArrayList<String> texts = ni.getTexts();
			ArrayList<String> visited = ni.getvisited();
			ArrayList<String> ntype = ni.getntype();
	 	%>

</head>

<body background="1.jpg">

<div class="container">
  <div class="header">欢迎用户：<%=ID1%><width="180" height="90" style="background: #C6D580; display:block;" />
    <!-- end .header --></div>

  <div class="sidebar1">
    <ul class="nav">
      <li><strong>导出文件：</strong><a href="Download.jsp"><strong>我的健身计划.txt</strong></a></li>
    </ul>
    <!-- end .sidebar1 --></div>

  <div class="content">
		<%
		
	    	  int u,i;
		  u=nids.size();
	  	  out.println("<br>");
		  for (i=0;i<u;i++)
		  {
		    out.println("<h2><a href=\"News.jsp?nid="+nids.get(i)+"\">"+titles.get(i)+"</a></h2>");
	  	    out.println("<br><p>");
		    out.println(texts.get(i));
		    out.println("</p><br>");
		    out.println("---------------------------------------------------");
		    out.println("<br>");
		  }
		  
		%>
	
    </div>
	
  </div>
</body>
</html>