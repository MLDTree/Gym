package com.Bean;

import java.util.*;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class User 
{
  String ID;
  String password;
  String name;
  String email;

  public  User(String ID,String password,String name,String email) 
  {	
    this.ID = ID;
    this.password = password;
    this.name = name;
    this.email = email;
  }

  public User(String ID,String name)
  {
    this.ID = ID;
    this.name = name;
  }

  public String getID() 
  {
    return ID;
  }

  public String getName()
  {
    return name;
  }

  public String getEmail() 
  {
    return email;
  }
};