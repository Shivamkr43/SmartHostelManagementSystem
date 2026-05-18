<%@ page import="java.sql.*" %>
<%@ page import="com.hostel.dao.DBConnection" %>

<%
String email = (String) session.getAttribute("studentEmail");

if (email == null) {
    response.sendRedirect("student-login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Visitors</title>
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
    <div class="card">
        <h2>My Visitors</h2>

        <table>
            <tr>
                <th>Visitor Name</th>
                <th>Relation</th>
                <th>Phone</th>
                <th>Purpose</th>
                <th>Entry Time</th>
                <th>Exit Time</th>
                <th>Status</th>
            </tr>

            <%
            try {
                Connection con = DBConnection.getConnection();

                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM visitors WHERE student_email=? ORDER BY entry_time DESC"
                );
                ps.setString(1, email);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getString("visitor_name") %></td>
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