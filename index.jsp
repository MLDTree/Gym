<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<html>
<head>
    <title>哈工大体育场馆信息管理</title>
    <style type="text/css">
		.asd
		{
			height:30px;
			width:250px;
			font-size:24px;
		}
    </style>
</head>
   
   
   
   <body background="2.jpg" >
</body>
  <%
  	String errorMessage="&nbsp";
  	HttpSession s = request.getSession();
  	if(s.getAttribute("loginError")!=null)
  	errorMessage = s.getAttribute("loginError").toString();
  	//errorMessage=request.getSession().getClass().toString()+"<br>"+session.getClass()+"<br>"+s.getClass();

        Cookie[] cook=request.getCookies();
        String c_name="";
        String c_pass="";
        if (cook!=null)
        {
	  boolean flag=false;
          for (int i=0;i<cook.length;i++)
          {
            Cookie c = cook[i];
            if (c.getName().equalsIgnoreCase("IamUser"))
            {
                c_pass=c.getValue();
	flag=true;
                break;
            }
          }
          if (flag)
          {
            int i;
            for (i=0;i<c_pass.length();i++)
              if (c_pass.charAt(i)=='*')
                break;
            c_name=c_pass.substring(0,i);
            c_pass=c_pass.substring(i+1,c_pass.length());
          }
          else c_pass="";
        }
   %>

  <body >
    <form action="servlet/A" method="post">
    	<div style="margin-left:10%; margin-right:10%; height:600px; margin-top:0; ">
            <div style="height:200px"></div>
            <div style="margin-left:600px; height:249px; width:295px; border:1px solid white;" >
                <div style="margin-left:23px; margin-top:55px">用户：<input type="text" name="username" value="<%=c_name%>" class="asd"></div>
		<div style="margin-left:23px; margin-top:37px">密  码：<input type="password" name="password" value="<%=c_pass%>" class="asd"></div>
          <div style="margin-left:20px; color:red"><%=errorMessage%></div>      
                <div style="margin-left:18px; margin-top:36px; margin-right:5%;" >
                    <div style="width:30px; float:left"><input type="checkbox" name="remember" value="remember"></div>
		    记住密码
                    <div style="width:50px; margin-left:165px; float:left"><input type="submit" value="登录" > </div>
                </div>          
            </div>
        </div>
        
    	
    </form>
  </body>
</html>