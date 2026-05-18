<%
String admin = (String) session.getAttribute("adminName");

if (admin == null) {
    response.sendRedirect("admin-login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Notice</title>
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
    <div class="card" style="max-width: 700px; margin: auto;">
        <h2>Post Notice</h2>

        <form action="NoticeServlet" method="post">
            <label>Title</label>
            <input type="text" name="title" required>

            <br><br>

            <label>Message</label>
            <textarea name="message" rows="6" required></textarea>

            <br><br>

            <button class="btn" type="submit">Post Notice</button>
        </form>
    </div>
</div>

</body>
</html>