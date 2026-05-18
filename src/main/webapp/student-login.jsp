<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="login-page">

<div class="login-wrapper">
    <div class="login-box">
        <form action="StudentLoginServlet" method="post">
            <h2>Student Login</h2>

            <div class="input-box">
                <input type="email" name="email" required>
                <label>Email</label>
            </div>

            <div class="input-box password-box">
                <input type="password" id="studentPassword" name="password" required>
                <label>Password</label>
                <span class="toggle-eye" onclick="toggleStudentPassword()">&#128065;</span>
            </div>

            <button class="btn" type="submit">Login</button>

            <div class="register-link">
                <p>Don't have an account? <a href="register.jsp">Register</a></p>
                <p><a href="index.jsp">Back to Home</a></p>
            </div>
        </form>
    </div>
</div>

<script>
function toggleStudentPassword() {
    const pass = document.getElementById("studentPassword");

    if (pass.type === "password") {
        pass.type = "text";
    } else {
        pass.type = "password";
    }
}
</script>

</body>
</html>