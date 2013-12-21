import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.Bean.*;

public class AddType extends HttpServlet
{
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException,IOException 
  {
    response.setContentType("text/html;charset=gb2312");
    response.setCharacterEncoding("gb2312");
    PrintWriter out = response.getWriter();
    String in1=request.getParameter("in_ntype");
    String x=request.getParameter("in_name");
    String in2=new String(x.getBytes("ISO8859_1"),"gb2312");
    DBControl.insertNewsType(in1,in2);
    response.sendRedirect("../ntypeMan.jsp");
  }
};