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
    <title>Fee Status</title>
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
        <h2>Fee Status</h2>

        <table>
            <tr>
                <th>Month</th>
                <th>Amount</th>
                <th>Status</th>
            </tr>

            <%
            try {
                Connection con = DBConnection.getConnection();

                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM fees WHERE student_email=?"
                );
                ps.setString(1, email);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getString("month") %></td>
                <td>Rs. <%= rs.getInt("amount") %></td>
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