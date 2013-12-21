<%@page import="com.Bean.*"%>
<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>
<head>
   <b>场馆信息管理</b>
<br>
</head>
<body background="1.jpg" >
<body>
<br>
<br>
  <table border="1">
    <tr>
      <th>场馆号</th>
      <th>场馆名称</th>
    </tr>


<form action="servlet/updateTypes" method="post">
<%
  if (!DBControl.isConnected())
    DBControl.connctTo("Pro_News");
  TypesInfo ni = DataController.getTypesInfo();
  ArrayList<String> ntypes = ni.getntypes();
  ArrayList<String> names = ni.getnames();
  int u,i;
  u=ntypes.size();
  for (i=0;i<u;i++)
  {
    out.println("<tr>");
    out.println("<td>");
    out.println(ntypes.get(i));
    out.println("</td>");
    out.println("<td>");
    out.println("<input type=\"text\" name=\"n"+ntypes.get(i)+"\" value=\""+names.get(i)+"\">");
    out.println("</td>");

//    out.println("<td><a href=\"DelTypes.jsp?ntype="+ntypes.get(i)>删除</a></td>");
    
    out.println("</tr>");
  }
  session.setAttribute("LAST",ntypes.get(i-1));
%>
  <tr>
    <td><input type="submit" name="xiugai" value="修改"></td>
  </tr>
</form>
<form action="servlet/AddType" method="post">
  <tr>
    <td>
      <input type="text" name="in_ntype">
    </td>
    <td>
      <input type="text" name="in_name">
    </td>
    <td>
      <input type="submit" name="add" value="新增">
    </td>
  </tr>
</form>
<form action="servlet/DelType" method="post">
  <tr>
    <td>
    请输入要删除的编号：
    </td>
    <td>
      <input type="text" name="del_ntype">
    </td>
    <td>
      <input type="submit" name="del" value="删除">
    </td>
  </tr>
  </table>
</form>
</body>