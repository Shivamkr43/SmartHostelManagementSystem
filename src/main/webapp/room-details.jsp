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
    <title>Room Details</title>
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
        <h2>Your Room Details</h2>

        <%
        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT name, email, room_number FROM students WHERE email=?"
            );
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
        %>

        <table>
            <tr>
                <th>Name</th>
                <td><%= rs.getString("name") %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= rs.getString("email") %></td>
            </tr>
            <tr>
                <th>Room Number</th>
                <td><%= rs.getString("room_number") %></td>
            </tr>
        </table>

        <%
            }
        } catch (Exception e) {
            out.println(e);
        }
        %>
    </div>
</div>

</body>
</html>