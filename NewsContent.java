package com.Bean;

import java.util.*;

public class NewsContent 
{
  String ID;
  String title;
  String text;
  int visited;
  int ntype;
  ArrayList<CommentInfo> cList = new ArrayList<CommentInfo>();

  public NewsContent(String ID,String title,String text,int visited,int ntype,ArrayList<CommentInfo> cList) 
  {
    this.ID = ID;
    this.title = title;
    this.text = text;
    this.visited = visited;
    this.ntype = ntype;
    this.cList = cList;
  }

	public String getID() {
		return ID;
	}
	public String getTitle() {
		return title;
	}
	public String getText() {
		return text;
	}
	public int getvisited() {
		return visited;
	}
	public ArrayList<CommentInfo> getcList() {
		return cList;
	} 
  
  public int getCommentSize()
  {
    return cList.size();
  }

  public int getntype()
  {
    return ntype;
  }
};