<%
String student = (String) session.getAttribute("studentName");
String admin = (String) session.getAttribute("adminName");

String dashboardLink = "index.jsp";

if (student != null) {
    dashboardLink = "student-dashboard.jsp";
} else if (admin != null) {
    dashboardLink = "admin-dashboard.jsp";
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>About - Smart Hostel Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="app-page">

<nav class="glow-nav">
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a class="active" href="about.jsp">About</a></li>
        <li><a href="<%= dashboardLink %>">Dashboard</a></li>

        <%
        if (student != null || admin != null) {
        %>
            <li><a href="LogoutServlet">Logout</a></li>
        <%
        }
        %>
    </ul>
</nav>

<div class="page-container">
    <div class="card">
        <h1>About Smart Hostel Management System</h1>

        <p>
            Smart Hostel Management System is a web-based application developed
            to simplify hostel administration and improve student experience.
        </p>

        <h3>Key Features</h3>
        <ul>
            <li>Student Registration and Login</li>
            <li>Admin Dashboard Management</li>
            <li>Room Allocation and Management</li>
            <li>Complaint Management System</li>
            <li>Visitor Entry and Exit Tracking</li>
            <li>Fee Management</li>
            <li>Notice Board and Notifications</li>
            <li>Profile Update and Security Features</li>
        </ul>

        <h3>Technologies Used</h3>
        <ul>
            <li>Java Servlet and JSP</li>
            <li>MySQL Database</li>
            <li>HTML and CSS</li>
            <li>Apache Tomcat Server</li>
            <li>Eclipse IDE</li>
        </ul>
    </div>
</div>

</body>
</html>