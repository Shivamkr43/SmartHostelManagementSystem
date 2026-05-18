<%
String email = (String) session.getAttribute("studentEmail");

if (email == null) {
    response.sendRedirect("student-login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="app-page">

<nav class="glow-nav">
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="student-dashboard.jsp">Dashboard</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</nav>

<div class="page-container">
    <div class="card" style="max-width: 650px; margin: auto;">
        <h2>Update Profile</h2>

        <form action="UpdateProfileServlet" method="post">
            <label>Phone</label>
            <input type="text" name="phone" required>

            <br><br>

            <label>Old Password</label>
            <input type="password" name="oldPassword" required>

            <br><br>

            <label>New Password</label>
            <input type="password" name="newPassword" required>

            <br><br>

            <button class="btn" type="submit">Update Profile</button>
        </form>
    </div>
</div>

</body>
</html>