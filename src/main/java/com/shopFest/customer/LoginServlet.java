package com.shopFest.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/log")
public class LoginServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	{
		try 
		{
			String un = req.getParameter("uname");
			String pas = req.getParameter("pass");
			boolean val = Validator.isValid(un, pas);
			if(val==true && un.equals("admin"))
			{
				resp.sendRedirect("admin.jsp");
			}
			else if(val == true )
			{
				resp.sendRedirect("home.jsp");
			}
			else
			{
				resp.sendRedirect("login.jsp");
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
