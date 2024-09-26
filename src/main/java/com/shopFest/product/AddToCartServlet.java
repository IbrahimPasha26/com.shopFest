package com.shopFest.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopFest.dbHandler.DataFetcher;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		int productId = Integer.parseInt(req.getParameter("productId"));
		Product product = DataFetcher.getProductById(productId);
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null)
		{
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		cart.addItem(product);
		res.sendRedirect("cart.jsp");
	}
}
