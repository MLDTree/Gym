import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.Bean.*;

public class DelType extends HttpServlet
{
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException,IOException
  {
    response.setContentType("text/html;charset=gb2312");
    response.setCharacterEncoding("gb2312");
    PrintWriter out = response.getWriter();
    String in=request.getParameter("del_ntype");
    try
    {
      DBControl.DelNewsType(in);
    }
    catch(Exception E) {}
    response.sendRedirect("../ntypeMan.jsp");
  }
};