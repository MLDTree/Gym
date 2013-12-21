import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.Bean.*;

public class Change extends HttpServlet
{
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException,IOException 
  {
    response.setContentType("text/html;charset=gb2312");
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    String uid = session.getAttribute("ID").toString();
    String nid = session.getAttribute("NID").toString();
    String tmp = request.getParameter("comment");
    String comment=new String(tmp.getBytes("ISO8859_1"),"gb2312");
    DBControl.insertCom(uid,nid,comment);
    response.sendRedirect("../News.jsp?nid="+nid);
  }
};