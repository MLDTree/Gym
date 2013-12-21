import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.Bean.*;

public class A extends HttpServlet 
{
  public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=gb2312");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user;
     //---------
    String remember=request.getParameter("remember");
    if (remember!=null)
      if (remember.equalsIgnoreCase("remember"))
      {
        Cookie c=new Cookie("IamUser",username+"*"+password);
        c.setMaxAge(60*60*24*14);
        c.setPath("/");
        response.addCookie(c);
      }
    //----------
		if (DBControl.login(username, password))
		{
			session.setAttribute("USER", username);
			session.setAttribute("loginError", "&nbsp");
			session.setAttribute("SELF", "true");
                                                if (username.equals("flx"))
 			  response.sendRedirect("../AdminMain.jsp?name="+username);
			else
			  response.sendRedirect("../Main.jsp?name="+username);
		}
		else {
			
			
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("../index.jsp");
			
			session.setAttribute("loginError", "µÇÂ¼Ê§°Ü");
			response.sendRedirect("../");
			//requestDispatcher.forward(request, response);
			
		}
	}

	public void init() throws ServletException {
		// Put your code here
		DBControl.connctTo("forJavaEE");
	}

};
