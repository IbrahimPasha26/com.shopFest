 package com.shopFest.dbHandler;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

public class DataInjector 
{
	
	@SuppressWarnings("finally")
	public static String addCustomer(String uname, String mail, String pass, String gender, String address)
	{
		String path = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String un = "System";
		String pas = "system";
		String sql = "Insert Into customers Values( ? , ? , ? , ? , ? )";
		String regStatus = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		try 
		{
			Class.forName(path);
			con = DriverManager.getConnection(url, un, pas);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, mail);
			pstmt.setString(3, pass);
			pstmt.setString(4, gender);
			pstmt.setString(5, address);
			
			pstmt.executeUpdate();
			
			regStatus = "success";
		}
		catch (Exception e) 
		{
			System.out.println("Problem in Adding customer");
			e.printStackTrace();
			regStatus = "fail";
		}
		finally
		{
			return regStatus;
		}
	}
	public static boolean addProduct(int pid, String pname, String pdesc, int pprice, String pimg)
	{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String un = "System";
		String pas = "system";
		String sql = "Insert into Products values( ? , ? , ? , ? , ? )";
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, un, pas);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, pname);
			pstmt.setString(3, pdesc);
			pstmt.setInt(4, pprice);
			pstmt.setString(5, pimg);
			pstmt.executeUpdate();
		}
		catch (Exception e) 
		{
			System.out.println("Problem in adding Product");
			e.printStackTrace();
			return false;
		}
		return true;	
	}
}
