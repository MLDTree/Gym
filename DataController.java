package com.Bean;

import java.sql.*;
import java.util.*;

public class DataController 
{
  public static NewsInfo getNewsInfo() throws Exception
  {
    ArrayList<String> nids = new ArrayList<String>();
    ArrayList<String> titles = new ArrayList<String>();
    ArrayList<String> texts = new ArrayList<String>();
    ArrayList<String> visited = new ArrayList<String>();
    ArrayList<String> ntype = new ArrayList<String>();
    //ArrayList<String> commenttimes = new ArrayList<String>();
    ResultSet rs = DBControl.getNewsLists();
    
    while (rs.next())
    {
      nids.add(rs.getString("ID"));
      titles.add(rs.getString("title"));
      texts.add(rs.getString("content"));
      visited.add(rs.getString("visited"));
      ntype.add(rs.getString("ntype"));
    }
    /*
    for(String s:nids)
      commenttimes.add(DBControl.getCommentNum(s)+"");
    */
    return new NewsInfo(nids,titles,texts,visited,nids);
  }

  public static TypesInfo getTypesInfo() throws Exception
  {
    ArrayList<String> ntypes = new ArrayList<String>();
    ArrayList<String> names = new ArrayList<String>();
    ResultSet rs = DBControl.getNewstypeList();
    
    while (rs.next())
    {
      ntypes.add(rs.getString("ntype"));
      names.add(rs.getString("name"));
    }
    return new TypesInfo(ntypes,names);
  }

  /*
  public static NewsInfo getShortNewsInfo(String ID) throws Exception 
  {
    ArrayList<String> titles = new ArrayList<String>();
    ArrayList<String> dates = new ArrayList<String>();
    ArrayList<String> visited = new ArrayList<String>();
    ArrayList<String> commenttimes = new ArrayList<String>();
    ArrayList<String> nids = new ArrayList<String>();
    ResultSet rs = DBControl.getNewsLists();
    while (rs.next())
    {
      nids.add(rs.getString("ID"));
      titles.add(rs.getString("Title"));
      dates.add(rs.getString("Btime").substring(0,rs.getString("Btime").length()-2));
      visited.add(rs.getString("visited"));
    }
    for(String s:nids)
      commenttimes.add(DBControl.getCommentNum(s)+"");
    return new NewsInfo(titles,  dates,visited,commenttimes,nids);
  }
  */
	
  public static User getUser(String ID) throws Exception
  {
    ResultSet rs = DBControl.getUser(ID);
    if (rs.next())
    {
      String password = rs.getString("password");     
      String name = rs.getString("name");
      String email = rs.getString("email");
      return new User(ID,password,name,email);
    }
    return null;
  }

  public static User getUserbyName(String username) throws Exception
  {
    ResultSet rs = DBControl.getUserbyName(username);
    if (rs.next())
    {
      String ID = rs.getString("ID");
      String password = rs.getString("password");     
      String email = rs.getString("email");
      return new User(ID,password,username,email);
    }
    return null;
  }


  public static String getArrayFormArrayList(ArrayList<String>a) {
		if(a.size()==0)
			return "[]";
		String s = "[\""+a.get(0)+"\"";
		for(int i=1; i<a.size(); i++)
			s+=",\""+a.get(i)+"\"";
		s+="];";
		return s;
	}

  public static NewsContent getNewsContent(String ID) throws Exception 
  {
    ResultSet rs = DBControl.getComment(ID);
    ArrayList<CommentInfo> cList = new ArrayList<CommentInfo>();
    while (rs.next())
    {
      CommentInfo ci = new CommentInfo(rs.getString("ID"), rs.getString("uid"), rs.getString("nid"),rs.getString("content"));
      cList.add(ci);
    }
    rs = DBControl.getNews(ID);
    if (rs.next())
    {
      NewsContent bc = new NewsContent(rs.getString("ID"),rs.getString("title"), rs.getString("content"),rs.getInt("visited"),rs.getInt("ntype"),cList);
      return bc;
    }
    return null;
  }
};