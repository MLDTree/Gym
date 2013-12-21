package com.Bean;

import java.util.*;

public class TypesInfo
{
  ArrayList<String> ntypes;
  ArrayList<String> names;
	
  public TypesInfo(ArrayList<String> ntypes,ArrayList<String> names) 
  {
    this.ntypes = ntypes;
    this.names = names;
  }
  
  public ArrayList<String> getntypes() 
  {
    return ntypes;
  }

  public ArrayList<String> getnames() 
  {
    return names;
  }
};