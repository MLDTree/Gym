import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.Bean.*;

public class updateTypes extends HttpServlet
{
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException,IOException 
  {
    response.setContentType("text/html;charset=gb2312");
    response.setCharacterEncoding("gb2312");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    int u=Integer.parseInt(session.getAttribute("LAST").toString());
    int i;
    String sname;
    for (i=1;i<=u;i++)
    {
      sname=null;
      sname=request.getParameter("n"+i);
      String name=new String(sname.getBytes("ISO8859_1"),"gb2312");
      if (sname!=null)
      {
        try
        {
          DBControl.updateTypes(""+i,name);
        }
        catch (Exception E){}
      }
      else System.out.println("error "+i);
    }
    response.sendRedirect("../ntypeMan.jsp");
  }
};