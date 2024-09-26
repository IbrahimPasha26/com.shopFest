<%@page import="com.shopFest.dbHandler.DataInjector"%>
<%@page import="com.shopFest.dbHandler.DataFetcher"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<link rel="stylesheet" href="adminStyle.css">
</head>
<body>
    <% List userList = DataFetcher.fetchUsersInfo(); 
       List prodList = DataFetcher.fetchProductsInfo(); 
    %>
    <div class="panel">
        <div class="button-container">
            <button class="active" data-tab="tab1">View Customers Info</button>
            <button data-tab="tab2">View Products Info</button>
            <button data-tab="tab3">Add New Product</button>
        </div>
        <div class="content-container">
            <div class="tab active" id="tab1">
                <table border>
                    <thead>
                        <tr>
                            <th>User-Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(int i=0; i<userList.size(); i++) {
                            String[] custArr=((String)userList.get(i)).split(":"); %>
                        <tr>
                            <td><%= custArr[0] %></td>
                            <td><%= custArr[1] %></td>
                            <td><%= custArr[2] %></td>
                            <td><%= custArr[3] %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="tab" id="tab2">
                <table border>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Image</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(int i=0; i<prodList.size(); i++) {
                            String[] prodArr = ((String)prodList.get(i)).split(":"); %>
                        <tr>
                            <td><%= prodArr[0] %></td>
                            <td><%= prodArr[1] %></td>
                            <td><%= prodArr[2] %></td>
                            <td><%= prodArr[3] %></td>
                            <td><img src="prodImgs/<%= prodArr[4] %>" alt="Product Image" width="80"></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="tab" id="tab3">
                <form action="addP" method="post">
                    <div class="form-group">
                        <label for="product-id">Product ID:</label>
                        <input type="text" id="product-id" name="product-id" required>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="product-name">Product Name:</label>
                        <input type="text" id="product-name" name="product-name" required>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="product-description">Product Description:</label>
                        <textarea id="product-description" name="product-description" required></textarea>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="product-price">Product Price:</label>
                        <input type="text" id="product-price" name="product-price" required>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="product-image">Product Image File Name:</label>
                        <input type="text" id="product-image" name="product-image" required>
                    </div>
                    <br><br>
                   <div class="form-group">
            <button type="submit">Submit</button>
        </div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    const buttons = document.querySelectorAll('.button-container button');
    const tabs = document.querySelectorAll('.tab');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const tabId = button.dataset.tab;
            const tab = document.getElementById(tabId);

            // Hide all tabs and remove active classes
            tabs.forEach(t => {
                t.classList.remove('active');
                t.style.display = 'none';
            });
            buttons.forEach(b => b.classList.remove('active'));

            // Show the clicked tab and add active class
            button.classList.add('active');
            tab.style.display = 'block';
            tab.classList.add('active');
        });
    });
    </script>
</body>
</html>
