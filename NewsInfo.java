package com.Bean;

import java.util.*;

public class NewsInfo 
{
  ArrayList<String> nids;
  ArrayList<String> titles;
  ArrayList<String> texts; 
  ArrayList<String> visited;
  ArrayList<String> ntype;
  //ArrayList<String> commenttimes;
	
  public NewsInfo(ArrayList<String> nids,ArrayList<String> titles,ArrayList<String> texts,ArrayList<String> visited,ArrayList<String> ntype) 
  {
    this.nids = nids;
    this.titles = titles;
    this.texts = texts;
    this.visited = visited;
    this.ntype = ntype;
  }
  
  public ArrayList<String> getnids() 
  {
    return nids;
  }

  public ArrayList<String> getTitles() 
  {
    return titles;
  }

  public ArrayList<String> getTexts() 
  {
    return texts;
  }

  public ArrayList<String> getvisited() 
  {
    return visited;
  }

  public ArrayList<String> getntype() 
  {
    return ntype;
  }	
};