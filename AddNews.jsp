<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>
<head>
  <div class="MAINDIV">	
    <div class="BAR">
      <div style="width:750px; height:30px;float:left;margin-top:6px;">
        <b>添加场馆使用信息</b>;
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
  场馆号：<input type="text" name="ID">
  <br>
  场馆名称：<input type="text" name="title">
  <br>
  场馆使用情况：<textarea name="content" cols="30" rows="5"></textarea>
  <br>
  场馆类型：<input type="text" name="ntype">
 <br>
  <%
    int i;
    for (i=0;i<20;i++)
      out.print("&nbsp;");
  %>
  <input type="submit" value="提交">
</div>
</form>
<body>