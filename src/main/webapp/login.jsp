<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopKey - Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h2>Login to Start Shopping</h2>
            <p>Welcome back! Please enter your details.</p>
        </div>
        <div class="login-form">
            <form id="login" action="log" method="post">
                <div class="input-group">
                    <label for="uname">Username</label>
                    <input type="text" id="uname" name="uname" class="input-field" placeholder="Enter your username" required>
                </div>

                <div class="input-group">
                    <label for="pass">Password</label>
                    <input type="password" id="pass" name="pass" class="input-field" placeholder="Enter your password" required>
                </div>

                <div class="input-group">
                    <button type="submit" class="btn-submit">Log In</button>
                </div>

                <div class="signin-link">
                    <p>New to ShopKey? <a href="register.jsp">Register Here</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
