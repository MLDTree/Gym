package com.Bean;

import java.sql.*;

public class DBControl 
{
  static String driverName = "org.gjt.mm.mysql.Driver";
  //static String dbURL = "jdbc:sqlserver://localhost:1433;database=";
  //static String dbURL = "jdbc:sqlserver://localhost:55638;database=";
  static String dbURL = "jdbc:mysql://localhost:3306/";
  static String username = "root";
  static String password = "ihe";
  static String DBname = "Pro_news";
  static Connection con = null;
  static Statement st = null;
  static boolean connected = false;
	
  public static boolean connctTo(String database) 
  {
    database=DBname;
    try 
    {
      Class.forName(driverName);
      con = DriverManager.getConnection(dbURL+database,username,password);
      st = con.createStatement();
      connected = true;
      return true;	
    } 
    catch (Exception e) 
    {
      e.printStackTrace();
      return false;
    }
  }
	
  public static boolean login(String ID,String password) 
  {
    //return true; 通通登陆成功
    try 
    {
      ResultSet rs=st.executeQuery("select * from Users where name='"+ID+"' and password='"+password+"'");
      if (rs.next())
      {
	return true;
      }
      else 
	return false;
    } 
    catch (Exception e) 
    {
      e.printStackTrace();
      return false;
    }
  }
  
  public static boolean insertNews(String id,String title,String content,String ntype) 
  {
    try 
    {
      st.executeUpdate(String.format("insert into News values(%s,'%s','%s',0,%s);",id,title,content,ntype));
      return true;
    } 
    catch (Exception e) 
    {
      e.printStackTrace();
      return false;
    }
  }

  public static boolean ModifyNews(String ID,String title,String content,String ntype) 
  {
    try 
    {
      st.executeUpdate(String.format("update News set title='%s',content='%s',ntype=%s where ID=%s;",title,content,ntype,ID));
      return true;
    } 
    catch (Exception e) 
    {
      e.printStackTrace();
      return false;
    }
  }

  public static void DelNews(String in) throws Exception
  {
    st.executeUpdate("delete from News where ID="+in);
  }

  public static boolean insertNewsType(String in1,String in2) 
  {
    try 
    {
      st.executeUpdate(String.format("insert into Newstype values(%s,'%s');",in1,in2));
      return true;
    } 
    catch (Exception e) 
    {
      e.printStackTrace();
      return false;
    }
  }

  public static void updateTypes(String id,String name) throws Exception
  {
    ResultSet rs = st.executeQuery("update Newstype set name='"+name+"' where ntype="+id);
  }

  public static void DelNewsType(String in) throws Exception
  {
    st.executeUpdate("delete from Newstype where ntype="+in);
  }
  
  public static boolean insertCom(String uid,String nid,String content) 
  {
    try 
    {
      int id=getComMax();
      st.executeUpdate(String.format("insert into Comment values(%d,%s,%s,'%s');",id+1,uid,nid,content));
      return true;
    } 
    catch (Exception e) 
    {
      e.printStackTrace();
      return false;
    }
  }

  public static void DelComment(String in) throws Exception
  {
    st.executeUpdate("delete from Comment where ID="+in);
  }

  public static ResultSet getNewsLists() throws Exception
  {
    ResultSet rs = st.executeQuery("select * from News order by ID DESC");
    return rs;
  }

  public static ResultSet getNews(String ID) throws Exception 
  {
    ResultSet rs = st.executeQuery("select * from News where ID="+ID);
    return rs;
  }

  public static ResultSet getUser(String ID) throws Exception 
  {
    ResultSet rs = st.executeQuery("select * from Users where ID="+ID);
    return rs;
  }

  public static ResultSet getUserbyName(String username) throws Exception 
  {
    ResultSet rs = st.executeQuery("select * from Users where name='"+username+"';");
    return rs;
  }

  public static ResultSet getComment(String ID) throws Exception
  {
    ResultSet rs = st.executeQuery("select * from Comment where nid="+ID);
    return rs;
  }

  public static ResultSet getNewstypeList() throws Exception
  {
    ResultSet rs = st.executeQuery("select * from Newstype order by ntype;");
    return rs;
  }

  public static int getComMax() throws Exception 
  {
    ResultSet rs = st.executeQuery("select C1.ID from Comment C1 where not exists (select * from Comment C2 where C1.ID<C2.ID);");
    rs.next();
    return rs.getInt(1);
  }

  public static boolean isConnected() 
  {
    return connected;
  }
};