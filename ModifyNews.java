import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.Bean.*;

public class ModifyNews extends HttpServlet
{
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException,IOException 
  {
    response.setContentType("text/html;charset=gb2312");
    PrintWriter out = response.getWriter();

    String ID = request.getParameter("ID");

    String tmp = request.getParameter("title");
    String title=new String(tmp.getBytes("ISO8859_1"),"gb2312");
    tmp = request.getParameter("content");
    String content=new String(tmp.getBytes("ISO8859_1"),"gb2312");

    String ntype = request.getParameter("ntype");

    DBControl.ModifyNews(ID,title,content,ntype);
    response.sendRedirect("../AdminNews.jsp?nid="+ID);
  }
};