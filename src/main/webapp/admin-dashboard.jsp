<%@ page import="java.sql.*" %>
<%@ page import="com.hostel.dao.DBConnection" %>

<%
String admin = (String) session.getAttribute("adminName");

if (admin == null) {
    response.sendRedirect("admin-login.jsp");
}

int totalStudents = 0;
int pendingComplaints = 0;
int totalRooms = 0;
int visitorsInside = 0;

try {
    Connection con = DBConnection.getConnection();

    PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM students");
    ResultSet rs1 = ps1.executeQuery();
    if (rs1.next()) totalStudents = rs1.getInt(1);

    PreparedStatement ps2 = con.prepareStatement(
        "SELECT COUNT(*) FROM complaints WHERE status='Pending'"
    );
    ResultSet rs2 = ps2.executeQuery();
    if (rs2.next()) pendingComplaints = rs2.getInt(1);

    PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM rooms");
    ResultSet rs3 = ps3.executeQuery();
    if (rs3.next()) totalRooms = rs3.getInt(1);

    PreparedStatement ps4 = con.prepareStatement(
        "SELECT COUNT(*) FROM visitors WHERE status='Inside'"
    );
    ResultSet rs4 = ps4.executeQuery();
    if (rs4.next()) visitorsInside = rs4.getInt(1);

} catch (Exception e) {
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="app-page">

<nav class="glow-nav">
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a class="active" href="admin-dashboard.jsp">Dashboard</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</nav>

<div class="search-box">
    <form action="search-student.jsp" method="get">
        <input type="text" name="email" placeholder="Search student email">
        <button type="submit">&#128269;</button>
    </form>
</div>

<a class="notification-icon" href="view-complaints.jsp" title="Complaints">
    &#128276;
    <span class="notification-badge"><%= pendingComplaints %></span>
</a>

<div class="page-container">

    <div class="card">
    <%
String success = request.getParameter("success");

if ("room".equals(success)) {
%>
    <div class="alert-success">Room allotted successfully!</div>
<%
} else if ("fee".equals(success)) {
%>
    <div class="alert-success">Fee record saved successfully!</div>
<%
} else if ("notice".equals(success)) {
%>
    <div class="alert-success">Notice posted successfully!</div>
<%
} else if ("visitor".equals(success)) {
%>
    <div class="alert-success">Visitor entry added successfully!</div>
<%
} else if ("adminProfile".equals(success)) {
%>
    <div class="alert-success">Admin password updated successfully!</div>
<%
}
%>
        <h2>Welcome Admin</h2>
        <p>Manage all hostel operations from one dashboard.</p>

        <!-- STATS -->
        <div class="dashboard-grid">

            <div class="dashboard-card">
                <span><%= totalStudents %></span>
                Total Students
            </div>

            <div class="dashboard-card">
                <span><%= pendingComplaints %></span>
                Pending Complaints
            </div>

            <div class="dashboard-card">
                <span><%= totalRooms %></span>
                Total Rooms
            </div>

            <div class="dashboard-card">
                <span><%= visitorsInside %></span>
                Visitors Inside
            </div>

        </div>

        <br><br>

        <!-- ACTIONS -->
        <div class="dashboard-grid">

            <a class="dashboard-card" href="view-students.jsp">
                <span>USER</span>
                View Students
            </a>

            <a class="dashboard-card" href="search-student.jsp">
                <span>FIND</span>
                Search Student
            </a>

            <a class="dashboard-card" href="manage-rooms.jsp">
                <span>ROOM</span>
                Manage Rooms
            </a>

            <a class="dashboard-card" href="allot-room.jsp">
                <span>BED</span>
                Allot Room
            </a>

            <a class="dashboard-card" href="view-complaints.jsp">
                <span>HELP</span>
                View Complaints
            </a>

            <a class="dashboard-card" href="manage-fees.jsp">
                <span>PAY</span>
                Manage Fees
            </a>

            <a class="dashboard-card" href="add-notice.jsp">
                <span>NEWS</span>
                Post Notice
            </a>

            <a class="dashboard-card" href="add-visitor.jsp">
                <span>ADD</span>
                Add Visitor
            </a>

            <a class="dashboard-card" href="view-visitors.jsp">
                <span>VIEW</span>
                View Visitors
            </a>

            <a class="dashboard-card" href="admin-update-profile.jsp">
                <span>EDIT</span>
                Update Profile
            </a>

        </div>
    </div>

</div>

</body>
</html>