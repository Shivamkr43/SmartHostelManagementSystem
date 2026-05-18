<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="login-page">

<div class="login-wrapper">
    <div class="login-box">
        <form action="AdminLoginServlet" method="post">
            <h2>Admin Login</h2>

            <div class="input-box">
                <input type="text" name="username" required>
                <label>Username</label>
            </div>

            <div class="input-box password-box">
                <input type="password" id="adminPassword" name="password" required>
                <label>Password</label>
                <span class="toggle-eye" onclick="toggleAdminPassword()">&#128065;</span>
            </div>

            <button class="btn" type="submit">Login</button>

            <div class="register-link">
                <p><a href="index.jsp">Back to Home</a></p>
            </div>
        </form>
    </div>
</div>

<script>
function toggleAdminPassword() {
    const pass = document.getElementById("adminPassword");

    if (pass.type === "password") {
        pass.type = "text";
    } else {
        pass.type = "password";
    }
}
</script>

</body>
</html>