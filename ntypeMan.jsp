<%@page import="com.Bean.*"%>
<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>
<head>
   <b>������Ϣ����</b>
<br>
</head>
<body background="1.jpg" >
<body>
<br>
<br>
  <table border="1">
    <tr>
      <th>���ݺ�</th>
      <th>��������</th>
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

//    out.println("<td><a href=\"DelTypes.jsp?ntype="+ntypes.get(i)>ɾ��</a></td>");
    
    out.println("</tr>");
  }
  session.setAttribute("LAST",ntypes.get(i-1));
%>
  <tr>
    <td><input type="submit" name="xiugai" value="�޸�"></td>
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
      <input type="submit" name="add" value="����">
    </td>
  </tr>
</form>
<form action="servlet/DelType" method="post">
  <tr>
    <td>
    ������Ҫɾ���ı�ţ�
    </td>
    <td>
      <input type="text" name="del_ntype">
    </td>
    <td>
      <input type="submit" name="del" value="ɾ��">
    </td>
  </tr>
  </table>
</form>
</body>