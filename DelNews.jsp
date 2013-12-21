<%@page import="com.Bean.*"%>
<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>

<head>
É¾³ý³É¹¦£¡
</head>
<body background="1.jpg" >
<body>
  <%
    String ID=request.getParameter("nid");
    DBControl.DelNews(ID);
    String name=session.getAttribute("USER").toString();
  %>
  <jsp:forward page="./AdminMain.jsp?name=<%name%>"/>
</body>