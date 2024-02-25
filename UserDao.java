package com.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hospital.entity.User;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean UserRegister(User u)
	{
		boolean f=false;
		
		try{
			String sql="insert into user_dtls(fullname,email,password) values(?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getfullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			
	        int i = ps.executeUpdate();
	        
	        if(i==1){
	        	f=true;
	        }
	        
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User login(String em,String psw){
		
		User u=null;
		
		try{
			String sql="select * from user_dtls where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setfullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return u;
	}
	
	public boolean checkOldPassword(int userId,String oldPassword)
	{
		boolean f=false;
		
		try{
			String sql="select * from user_dtls where id=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				f=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean changePassword(int userId,String newPassword)
	{
		boolean f=false;
		
		try{
			String sql="update user_dtls set password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
		
			ps.setString(1, newPassword);
			ps.setInt(2, userId);
			
			
			int i=ps.executeUpdate();
			if(i==1){
				f=true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
}
