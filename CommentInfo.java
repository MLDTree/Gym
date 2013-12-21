package com.Bean;

public class CommentInfo
{
  String ID;
  String uid;
  String nid;
  String content;

  public CommentInfo (String ID,String uid,String nid,String content)
  {
    this.ID = ID;
    this.uid = uid;
    this.nid = nid;
    this.content = content;
  }

  public String getID() 
  {
    return ID;
  }

  public String getuid() 
  {
    return uid;
  }

  public String getnid() 
  {
	return nid;
  }

  public String getContent() 
  {
    return content;
  }	
};
