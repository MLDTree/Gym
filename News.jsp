<%@page import="com.Bean.DBControl"%>
<%@page import="com.Bean.DataController"%>
<%@page import="com.Bean.NewsInfo"%>
<%@page import="com.Bean.NewsContent"%>
<%@page import="com.Bean.User"%>
<%@page import="com.Bean.CommentInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>


<html>
<head>
<title>����������������Ϣ����</title>
<link href="css/submain.css" rel="stylesheet" type="text/css" />
  <%
    if (!DBControl.isConnected())
    DBControl.connctTo("forJavaEE");
    String ID1=""; //������ʵ��˵�ID
    if (session.getAttribute("USER")!=null)
    ID1 = session.getAttribute("USER").toString();
  %>
</head>
	<body background="1.jpg" >
	
<body>

<div class="container">
  <div class="header"><strong>��ӭǰ��ʹ�ù���������������Ϣ����ϵͳ�������Բ鿴������Ϣ����ԤԼ���ݣ�<%=ID1%><width="180" height="90" style=" display:block;" />
    <!-- end .header --><strong></div>	
  <div class="content">
  <div class="booking">
  <table style="border: 1px solid gray;">
	<tr>
	<td>&nbsp;</td>
	<td>ʹ�����</td>
	<td>
		ԤԼ
	</td>
	</tr>
	<tr>
	<td>8:00-9:30</td>
	<td >�п�λ</td>
	<td  ><button name="button1" style="cursor: pointer;">ԤԼ</button></td>
	</tr>
	<tr>
	<td  >9:30-11:00</td>
	<td  >�޿�λ</td>
	<td  ><button name="button1" style="cursor: pointer;">ԤԼ</button></td>
	</tr>
	<tr>
	<td  >1:30-15:00</td>
	<td  >�п�λ</td>
	<td  ><button name="button1" style="cursor: pointer;">ԤԼ</button></td>
	</tr>
	<tr>
	<td  >3:30-17:00</td>
	<td  >�п�λ</td>
	<td  ><button name="button1" style="cursor: pointer;">ԤԼ</button></td>
	</tr>
  </table>
  <div><img src="3.jpg" width="300px" height="100px" style="margin-top: 20px" /></div>
  </div>
  <form action="servlet/Change" method="post">

        <%
	  NewsContent x=DataController.getNewsContent(request.getParameter("nid"));
          session.setAttribute("NID",request.getParameter("nid"));
	  int i,u;
	  ArrayList<CommentInfo> cList=x.getcList();
	  u=x.getCommentSize();
	  out.println("<br>");
	  out.println("<h2><strong>"+x.getTitle()+"</strong>");
                  out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                  out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                  out.println("<a style='color: black;' href=\"Main.jsp?name="+ID1+"\">�ص���ҳ</a></h2>");
	  out.println("<br><p>");
	  out.println(x.getText());
	  out.println("</p><br>");
	  out.println("===================================");
	  out.println("<br>");
	  out.println("���������ۻ��߽�����룺");
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
	    out.println("<br>");
	    out.println("-----------------------------------");
	    out.println("<br>");
	  }
	%>

  <br><br>
  
  <div style="height:30px; width:250px">
    �����ƻ���<input type="text" name="comment">
    <br>
    <%
      for (i=0;i<20;i++)
        out.print("&nbsp;");
    %>
    <input type="submit" value="����">
  </div>
  </form>
    </div>	
</body>
</html>