<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>
<head>
  <div class="MAINDIV">	
    <div class="BAR">
      <div style="width:750px; height:30px;float:left;margin-top:6px;">
        <b>��ӳ���ʹ����Ϣ</b>;
      </div>
      <div style="float:left;margin-top:6px;"></div>
    </div>		
  </div>
</head>
<body background="1.jpg" >
<body>
  <form action="servlet/NewNews" method="post">
<div style="height:30px; width:250px">
  <br>
  ���ݺţ�<input type="text" name="ID">
  <br>
  �������ƣ�<input type="text" name="title">
  <br>
  ����ʹ�������<textarea name="content" cols="30" rows="5"></textarea>
  <br>
  �������ͣ�<input type="text" name="ntype">
 <br>
  <%
    int i;
    for (i=0;i<20;i++)
      out.print("&nbsp;");
  %>
  <input type="submit" value="�ύ">
</div>
</form>
<body>