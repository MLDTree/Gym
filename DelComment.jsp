<%@page import="com.Bean.*"%>
<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>

<head>
ɾ���ɹ���
</head>
<body background="1.jpg" >
<body>
  <%
    String ID=request.getParameter("ID");
    DBControl.DelComment(ID);
    String newsid="./AdminNews.jsp?nid="+request.getParameter("nid");
  %>
  <jsp:forward page="<%= newsid %>" />
</body>