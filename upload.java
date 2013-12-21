import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.jspsmart.upload.*;

public class upload extends HttpServlet 
{
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
  {
    doPost(request,response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
  {
    request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
    response.setContentType("text/html;charset=gb2312");		
    
    SmartUpload su = new SmartUpload();
		
    String allowedFilesList = "txt,doc";
    String denidFilesList = "exe,bat,jsp,htm,html,,";
        
    su.initialize(this.getServletConfig(), request, response);        
    su.setAllowedFilesList(allowedFilesList);                        
    try 
    {
      su.setDeniedFilesList(denidFilesList);
      su.upload();
		 
      File file = su.getFiles().getFile(0);
      if (!file.isMissing())
      {
        System.out.println(file.getFieldName());
        System.out.println(file.getSize());
        System.out.println(file.getFileName());
        System.out.println(file.getFileExt());
        System.out.println(file.getFilePathName());
        file.saveAs("/upload/" + file.getFileName(),SmartUpload.SAVE_VIRTUAL);
        request.getRequestDispatcher("/richy/manage.jsp").forward(request, response);
      }
    } 
    catch (SQLException e) 
    {
      e.printStackTrace();
    }
    catch (SmartUploadException e) 
    {
      e.printStackTrace();
    }        
  }
};