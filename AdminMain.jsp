<%@page import="com.Bean.DBControl"%>
<%@page import="com.Bean.DataController"%>
<%@page import="com.Bean.NewsInfo"%>
<%@page import="com.Bean.User"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312" pageEncoding="utf-8" %>

<head>
<title><strong>哈工大体育场馆信息管理</strong></title>

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
<body background="1.jpg" >
<body>

<div class="container">
  <div class="header">欢迎管理员：<%=ID1%><width="180" height="90" style=" display:block;" />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <a href="./AddNews.jsp"><strong>添加场馆信息</strong></a>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <a href="./ntypeMan.jsp"><strong>场馆信息管理</strong></a>
    <!-- end .header --></div>

  <div class="sidebar1">
<p><strong>请选择要上传的文件:</strong></p>
<form METHOD="POST" ACTION="upload.jsp" ENCTYPE="multipart/form-data">
<div><input type="FILE" name="FILE1" size="30"></div>
<input type="submit" name="Submit" value="上传">
</form>
    <!-- end .sidebar1 --></div>
<div><img src="3.jpg" width="300px" height="100px" style="margin-top: 20px" /></div>
  <div class="content">
	<%
	    	  int u,i;
		  u=nids.size();
	  	  out.println("<br>");
		  for (i=0;i<u;i++)
		  {
		    out.println("<a href=\"AdminNews.jsp?nid="+nids.get(i)+"\">"+titles.get(i)+"</a>");
	  	    out.println("<br>");
	  	    out.println("<br>");
		    out.println(texts.get(i));
		    out.println("<br>");
		    out.println("---------------------------------------------------");
		    out.println("<br>");
			//<div><img src="1.jpg" width="300px" height="100px" style="margin-top: 20px" /></div>
		  }
		%>

    </div>
  </div>
</body>
</html>