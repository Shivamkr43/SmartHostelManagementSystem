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
    <title>Notifications</title>
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
        <h2>Notifications</h2>

        <h3>Pending Fees</h3>
        <table>
            <tr>
                <th>Month</th>
                <th>Amount</th>
            </tr>

            <%
            try {
                Connection con = DBConnection.getConnection();

                PreparedStatement ps1 = con.prepareStatement(
                    "SELECT month, amount FROM fees WHERE student_email=? AND status='Pending'"
                );
                ps1.setString(1, email);
                ResultSet rs1 = ps1.executeQuery();

                while (rs1.next()) {
            %>
            <tr>
                <td><%= rs1.getString("month") %></td>
                <td>Rs. <%= rs1.getInt("amount") %></td>
            </tr>
            <%
                }
            %>
        </table>

        <br>

        <h3>Latest Notices</h3>
        <table>
            <tr>
                <th>Title</th>
                <th>Message</th>
            </tr>

            <%
                PreparedStatement ps2 = con.prepareStatement(
                    "SELECT title, message FROM notices ORDER BY notice_date DESC LIMIT 5"
                );
                ResultSet rs2 = ps2.executeQuery();

                while (rs2.next()) {
            %>
            <tr>
                <td><%= rs2.getString("title") %></td>
                <td><%= rs2.getString("message") %></td>
            </tr>
            <%
                }
            %>
        </table>

        <br>

        <h3>Visitors Currently Inside</h3>
        <table>
            <tr>
                <th>Visitor Name</th>
            </tr>

            <%
                PreparedStatement ps3 = con.prepareStatement(
                    "SELECT visitor_name FROM visitors WHERE student_email=? AND status='Inside'"
                );
                ps3.setString(1, email);
                ResultSet rs3 = ps3.executeQuery();

                while (rs3.next()) {
            %>
            <tr>
                <td><%= rs3.getString("visitor_name") %></td>
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