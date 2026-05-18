<%
String admin = (String) session.getAttribute("adminName");

if (admin == null) {
    response.sendRedirect("admin-login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Admin Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="app-page">

<nav class="glow-nav">
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="admin-dashboard.jsp">Dashboard</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</nav>

<div class="page-container">
    <div class="card" style="max-width: 650px; margin: auto;">
        <h2>Update Admin Password</h2>

        <form action="AdminUpdateProfileServlet" method="post">
            <label>Old Password</label>
            <input type="password" name="oldPassword" required>

            <br><br>

            <label>New Password</label>
            <input type="password" name="newPassword" required>

            <br><br>

            <button class="btn" type="submit">Update Password</button>
        </form>
    </div>
</div>

</body>
</html>