package com.shopFest.dbHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shopFest.product.Product;

public class DataFetcher 
{
	public static String fetchPasswrod(String uname)
	{
	 String path = "oracle.jdbc.driver.OracleDriver";
	 String url = "jdbc:oracle:thin:@localhost:1521:xe";
	 String un = "System";
	 String pas = "system";
	String sql = "Select pass from Customers Where uname = ? ";
	String dbPass = " ";
	try
	{
		Class.forName(path);
		Connection con = DriverManager.getConnection(url, un, pas);
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, uname);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		dbPass = rs.getString(1);
	}
	catch(Exception e)
	{
		System.out.println("Login Issues");
		e.printStackTrace();
	}
	return dbPass;
  }
	
	public static List fetchUsersInfo()
	{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String un = "System";
		String pas = "system";
		String sql = "Select uname,mail,gender,address from customers";
		List ulist = new ArrayList();
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, un, pas);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				String temp=rs.getString(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getString(4);
				ulist.add(temp);
			}
		} 
		catch (Exception e) 
		{
			System.out.println("Problem in Login");
			e.printStackTrace();
		}
		return ulist;
	}
	public static List fetchProductsInfo()
	{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String un = "System";
		String pas = "system";
		String sql = "select * from Products";
		List ilist = new ArrayList();
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, un, pas);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				String temp=rs.getInt(1)+":"+rs.getString(2)+":"+rs.getString(3)+":"+rs.getInt(4)+":"+rs.getString(5);
				ilist.add(temp);
			}
		}
		catch (Exception e) 
		{
			System.out.println("Problem in Login");
			e.printStackTrace();
		}
		return ilist;
	}
	public static Product getProductById(int pid)
	{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String un = "System";
		String pas = "system";
		String sql = "Select pname,pprice from Products where pid = ?";
		Product p = null;
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, un, pas);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String pname = rs.getString(1);
			int pprice = rs.getInt(2);
			
			p = new Product(pid, pname, pprice);
		}
		catch (Exception e) 
		{
			System.out.println("Problem in fetching Product by id");
			e.printStackTrace();
		}
		finally
		{
			return p;
		}
	}
}
