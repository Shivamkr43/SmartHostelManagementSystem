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
    <title>View Visitors</title>
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
        <h2>Visitor Records</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Visitor Name</th>
                <th>Student Email</th>
                <th>Relation</th>
                <th>Phone</th>
                <th>Purpose</th>
                <th>Entry Time</th>
                <th>Exit Time</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM visitors ORDER BY entry_time DESC");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("visitor_name") %></td>
                <td><%= rs.getString("student_email") %></td>
                <td><%= rs.getString("relation") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("purpose") %></td>
                <td><%= rs.getString("entry_time") %></td>
                <td><%= rs.getString("exit_time") %></td>
                <td>
    <span class="status-badge <%= rs.getString("status").toLowerCase() %>">
        <%= rs.getString("status") %>
    </span>
</td>
                <td>
                    <%
                    if ("Inside".equals(rs.getString("status"))) {
                    %>
                        <a class="btn" href="ExitVisitorServlet?id=<%= rs.getInt("id") %>">Mark Exit</a>
                    <%
                    } else {
                    %>
                        Exited
                    <%
                    }
                    %>
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