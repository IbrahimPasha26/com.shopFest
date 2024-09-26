<%@page import="com.shopFest.dbHandler.DataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop-Fest</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<%
		List prodList = DataFetcher.fetchProductsInfo();
	%>
	<header>
		<h1>Shop-Fest</h1>
		<nav>
			<ul>
				<li><a href="#" class="view-cart">
					<i class="fas fa-shopping-cart"></i>
					<span>
						<a href="cart.jsp">
							<button class="add-to-cart">View Cart</button>
						</a>
					</span>
				</a>
				</li>
			</ul>
		</nav>
	</header>
	<main>
		<%
			String[] prodArr2 = null;;
			for(int i =0; i<prodList.size(); i++)
			{
				String[] prodArr=((String)prodList.get(i)).split(":");
				prodArr2=prodArr;
		%>
		
		<section class="product">
			<img src="prodImgs/<%= prodArr[4] %>" alt="Product 1">
			<h2><%= prodArr[1] %></h2>
			<p><%= prodArr[2] %></p>
			<span class="price"><%= prodArr[3] %></span>
			<form action="add-to-cart" method="post">
				<input type="hidden" name="productId" value="<%= Integer.parseInt(prodArr[0]) %>">
				<input type="Submit" value="Add to Cart">
			</form>
		</section>
		<%
			}
		%>
	</main>
</body>
</html>