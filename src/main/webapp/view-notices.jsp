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
    <title>Notice Board</title>
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
        <h2>Notice Board</h2>

        <table>
            <tr>
                <th>Title</th>
                <th>Message</th>
                <th>Date</th>
            </tr>

            <%
            try {
                Connection con = DBConnection.getConnection();

                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM notices ORDER BY notice_date DESC"
                );

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
            %>

            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getString("notice_date") %></td>
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