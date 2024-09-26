<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShopKey - Customer Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h2>Create Your ShopKey Account</h2>
            <p>Join us and experience the best online shopping!</p>
        </div>
        <div class="register-form">
            <form method="post" action="reg">
                <div class="input-group">
                    <label for="uname">Username</label>
                    <input type="text" id="uname" name="uname" class="input-field" placeholder="Enter your username" required>
                </div>

                <div class="input-group">
                    <label for="mail">Email</label>
                    <input type="email" id="mail" name="mail" class="input-field" placeholder="Enter your email" required>
                </div>

                <div class="input-group">
                    <label for="pass">Password</label>
                    <input type="password" id="pass" name="pass" class="input-field" placeholder="Enter your password" required>
                </div>

                <div class="input-group">
                    <label>Gender</label>
                    <div class="radio-group">
                        <label><input type="radio" name="gender" value="male" required> Male</label>
                        <label><input type="radio" name="gender" value="female"> Female</label>
                        <label><input type="radio" name="gender" value="other"> Other</label>
                    </div>
                </div>

                <div class="input-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" class="input-field" rows="4" placeholder="Enter your address"></textarea>
                </div>

                <div class="input-group">
                    <button type="submit" class="btn-submit">Register</button>
                </div>

                <div class="signin-link">
                    <p>Already have an account? <a href="login.jsp">Sign in</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
