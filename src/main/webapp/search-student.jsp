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
    <title>Search Student</title>
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
    <div class="card" style="max-width: 750px; margin: auto;">
        <h2>Search Student</h2>

        <form method="get">
            <label>Enter Student Email</label>
            <input type="text" name="email" required>

            <br><br>

            <button class="btn" type="submit">Search</button>
        </form>

        <br>

        <%
        String searchEmail = request.getParameter("email");

        if (searchEmail != null) {
            try {
                Connection con = DBConnection.getConnection();

                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM students WHERE email=?"
                );

                ps.setString(1, searchEmail);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
        %>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Room Number</th>
            </tr>

            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("room_number") %></td>
            </tr>
        </table>

        <%
                } else {
                    out.println("<p>Student not found.</p>");
                }

            } catch (Exception e) {
                out.println(e);
            }
        }
        %>
    </div>
</div>

</body>
</html>