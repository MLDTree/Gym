<%@page import="com.Bean.*"%>
<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>

<html>
<head>
  <link href="css/main.css" rel="stylesheet" type="text/css" />
  <%
    if (!DBControl.isConnected())
    DBControl.connctTo("forJavaEE");
    String ID1=""; //������ʵ��˵�ID
    if (session.getAttribute("USER")!=null)
    ID1 = session.getAttribute("USER").toString();
  %>
		
  <div class="MAINDIV">	
    <div class="BAR">
      <div style="width:750px; height:30px;float:left;margin-top:6px;">
        <b>��ӭ����Ա&nbsp;<%=ID1%></b>
      </div>
      <div style="float:left;margin-top:6px;"></div>
    </div>		
  </div>
</head>
	<body background="1.jpg" >
	
<body>
<form action="servlet/ModifyNews" method="post">
        <%
	  NewsContent x=DataController.getNewsContent(request.getParameter("nid"));
          session.setAttribute("NID",request.getParameter("nid"));
	  int i,u;
	  ArrayList<CommentInfo> cList=x.getcList();
	  u=x.getCommentSize();

	  out.println("<br>");
                  out.println("<input type=\"hidden\" name=\"ID\" value=\""+x.getID()+"\">");
                  out.println("�����������ƣ�<input type=\"text\" name=\"title\" value=\""+x.getTitle()+"\">");
	  out.println("<br>");
	  out.println("<br>");
                  out.println("���������<input type=\"text\" name=\"ntype\" value=\""+x.getntype()+"\">");
                  out.println("<br><br>");
                  out.println("�������ݵ�ʹ�������");
                  out.println("<br><br>");
                  out.println("<textarea name=\"content\" cols=\"30\" rows=\"5\">");
                  out.println(x.getText());
                  out.println("</textarea>");
	  out.println("<br><br>");
	%>	
  <input type="submit" value="�޸�">
</form>
</body>
</html>