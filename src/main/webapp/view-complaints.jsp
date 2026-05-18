<%@ page import="java.sql.*" %>
<%@ page import="com.hostel.dao.DBConnection" %>

<%
String admin = (String) session.getAttribute("adminName");

if (admin == null) {
    response.sendRedirect("admin-login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Complaints</title>
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
    <div class="card">
        <h2>Student Complaints</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Student Email</th>
                <th>Complaint</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM complaints ORDER BY id DESC");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("student_email") %></td>
                <td><%= rs.getString("complaint") %></td>
                <td>
    <span class="status-badge <%= rs.getString("status").toLowerCase() %>">
        <%= rs.getString("status") %>
    </span>
</td>
                <td>
                    <a class="btn" href="ResolveComplaintServlet?id=<%= rs.getInt("id") %>">
                        Resolve
                    </a>
                </td>
            </tr>

            <%
                }
            } catch (Exception e) {
                out.println(e);
            }
            %>

        </table>
    </div>
</div>

</body>
</html>