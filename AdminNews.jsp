<%@page import="com.Bean.DBControl"%>
<%@page import="com.Bean.DataController"%>
<%@page import="com.Bean.NewsInfo"%>
<%@page import="com.Bean.NewsContent"%>
<%@page import="com.Bean.User"%>
<%@page import="com.Bean.CommentInfo"%>
<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>

<html>
<head>
  <link href="css/main.css" rel="stylesheet" type="text/css" />
  <%
    if (!DBControl.isConnected())
    DBControl.connctTo("forJavaEE");
    String ID1=""; //发起访问的人的ID
    if (session.getAttribute("USER")!=null)
    ID1 = session.getAttribute("USER").toString();
  %>
		
  <div class="MAINDIV">	
    <div class="BAR">
      <div style="width:750px; height:30px;float:left;margin-top:6px;">
        <b>欢迎管理员&nbsp;<%=ID1%></b>
      </div>
      <div style="float:left;margin-top:6px;"></div>
    </div>		
  </div>
</head>
	<div><img src="3.jpg" width="300px" height="100px" style="margin-top: 20px" /></div>
	<body background="1.jpg" >
	
<body>
        <%
	  NewsContent x=DataController.getNewsContent(request.getParameter("nid"));
          session.setAttribute("NID",request.getParameter("nid"));
	  int i,u;
	  ArrayList<CommentInfo> cList=x.getcList();
	  u=x.getCommentSize();
	  out.println("<br>");
	  out.println("<strong>"+x.getTitle()+"</strong>");
                  for (i=0;i<15;i++)
                    out.println("&nbsp;");
                  out.println("<a href=\"ModifyNews.jsp?nid="+x.getID()+"\">修改</a>");
                  out.println("&nbsp;&nbsp;");
                  out.println("<a href=\"DelNews.jsp?nid="+x.getID()+"\">删除</a>");
                  out.println("&nbsp;&nbsp;");
                  out.println("<a href=\"AdminMain.jsp?name="+ID1+"\">回到首页</a>");
	  out.println("<br>");
	  out.println("<br>");
	  out.println(x.getText());
	  out.println("<br>");
	  out.println("===================================");
	  out.println("<br>");
	  out.println("评论：");
	  out.println("<br>");
          session.setAttribute("ID",DataController.getUserbyName(ID1).getID());
	  for (i=0;i<u;i++)
	  {
	    out.println(cList.get(i).getContent());
	    out.println("<br>");
	    String username=DataController.getUser(cList.get(i).getuid()).getName();
  	    for (int j=0;j<10;j++)
	      out.println("&nbsp;");
	    out.println("by "+username);
                    out.println("&nbsp;&nbsp;");
                    out.println("<a href=\"DelComment.jsp?ID="+cList.get(i).getID()+"&nid="+x.getID()+"\">删除该评论</a>");
	    out.println("<br>");
	    out.println("-----------------------------------");
	    out.println("<br>");
	  }
	%>	
</body>
</html>