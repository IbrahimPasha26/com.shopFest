<%@page import="com.shopFest.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shopFest.product.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop-Fest Cart</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<% 
		Cart c = (Cart)session.getAttribute("cart");
		List itemsList = c.getItems();
	%>
	
	<header>
		<h1>Shop-Fest Cart</h1>
		<nav>
			<ul>
				<li>
				
				</li>
			</ul>
		</nav>
	</header>
	<main>
		<%
			for(int i=0; i<itemsList.size(); i++)
			{
				String p = ((Product)(itemsList.get(i))).getPname();
		%>
		<section class="product">
				<h2><%= p %></h2>
				<p> <%= ((Product)(itemsList.get(i))).getPprice() %></p>	
				<span class="price">Test</span>		
		</section>
		<%
			}
		%>
	</main>
	<br>
	<table>
		<tfoot>
			<tr>
				<td colspan="3">Total :</td>
				<td><h1><%= c.getTotal() %></h1></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>