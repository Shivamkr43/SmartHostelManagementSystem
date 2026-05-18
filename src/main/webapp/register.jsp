<!DOCTYPE html>
<html>
<head>
    <title>Student Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="login-page">

<div class="login-wrapper">
    <div class="login-box" style="min-height: 620px;">
        <form action="RegisterServlet" method="post">
            <h2>Student Register</h2>

            <div class="input-box">
                <span class="icon">👤</span>
                <input type="text" name="name" required>
                <label>Name</label>
            </div>

            <div class="input-box">
                <span class="icon">✉</span>
                <input type="email" name="email" required>
                <label>Email</label>
            </div>

            <div class="input-box">
                <span class="icon">☎</span>
                <input type="text" name="phone" required>
                <label>Phone</label>
            </div>

            <div class="input-box">
                <span class="icon">🔒</span>
                <input type="password" name="password" required>
                <label>Password</label>
            </div>

            <button class="btn" type="submit">Register</button>

            <div class="register-link">
                <p>Already registered? <a href="student-login.jsp">Login</a></p>
            </div>
        </form>
    </div>
</div>

</body>
</html>