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
    <title>Allot Room</title>
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
        <h2>Allot Room</h2>

        <form action="AllotRoomServlet" method="post">

            <label>Student Email</label>
            <select name="studentEmail" required>
                <%
                try {
                    Connection con = DBConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT email FROM students");
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                %>
                    <option value="<%= rs.getString("email") %>"><%= rs.getString("email") %></option>
                <%
                    }
                } catch (Exception e) {
                    out.println(e);
                }
                %>
            </select>

            <br><br>

            <label>Room Number</label>
            <select name="roomNumber" required>
                <%
                try {
                    Connection con = DBConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement(
                        "SELECT room_number FROM rooms WHERE occupied < capacity"
                    );
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                %>
                    <option value="<%= rs.getString("room_number") %>"><%= rs.getString("room_number") %></option>
                <%
                    }
                } catch (Exception e) {
                    out.println(e);
                }
                %>
            </select>

            <br><br>

            <button class="btn" type="submit">Allot Room</button>
        </form>
    </div>
</div>

</body>
</html>