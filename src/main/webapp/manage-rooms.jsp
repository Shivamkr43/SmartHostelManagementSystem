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
    <title>Manage Rooms</title>
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
        <h2>Manage Rooms</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Room Number</th>
                <th>Capacity</th>
                <th>Occupied</th>
                <th>Available Beds</th>
            </tr>

            <%
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM rooms");
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int capacity = rs.getInt("capacity");
                    int occupied = rs.getInt("occupied");
            %>

            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("room_number") %></td>
                <td><%= capacity %></td>
                <td><%= occupied %></td>
                <td><%= capacity - occupied %></td>
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