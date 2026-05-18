<%@ page import="java.sql.*" %>
<%@ page import="com.hostel.dao.DBConnection" %>

<%
String name = (String) session.getAttribute("studentName");
String email = (String) session.getAttribute("studentEmail");

if (name == null) {
    response.sendRedirect("student-login.jsp");
}

int pendingFees = 0;
int totalNotices = 0;
int visitorsInside = 0;
int myComplaints = 0;
String roomNumber = "Not Allotted";

try {
    Connection con = DBConnection.getConnection();

    PreparedStatement ps0 = con.prepareStatement(
        "SELECT room_number FROM students WHERE email=?"
    );
    ps0.setString(1, email);
    ResultSet rs0 = ps0.executeQuery();
    if (rs0.next() && rs0.getString("room_number") != null) {
        roomNumber = rs0.getString("room_number");
    }

    PreparedStatement ps1 = con.prepareStatement(
        "SELECT COUNT(*) FROM fees WHERE student_email=? AND status='Pending'"
    );
    ps1.setString(1, email);
    ResultSet rs1 = ps1.executeQuery();
    if (rs1.next()) pendingFees = rs1.getInt(1);

    PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM notices");
    ResultSet rs2 = ps2.executeQuery();
    if (rs2.next()) totalNotices = rs2.getInt(1);

    PreparedStatement ps3 = con.prepareStatement(
        "SELECT COUNT(*) FROM visitors WHERE student_email=? AND status='Inside'"
    );
    ps3.setString(1, email);
    ResultSet rs3 = ps3.executeQuery();
    if (rs3.next()) visitorsInside = rs3.getInt(1);

    PreparedStatement ps4 = con.prepareStatement(
        "SELECT COUNT(*) FROM complaints WHERE student_email=?"
    );
    ps4.setString(1, email);
    ResultSet rs4 = ps4.executeQuery();
    if (rs4.next()) myComplaints = rs4.getInt(1);

} catch (Exception e) {
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="app-page">

<nav class="glow-nav">
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a class="active" href="student-dashboard.jsp">Dashboard</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</nav>

<a class="notification-icon" href="notifications.jsp" title="Notifications">
    &#128276;
    <span class="notification-badge">
        <%= pendingFees + totalNotices + visitorsInside %>
    </span>
</a>

<div class="page-container">
<%
String success = request.getParameter("success");

if ("complaint".equals(success)) {
%>
    <div class="alert-success">Complaint submitted successfully!</div>
<%
} else if ("profile".equals(success)) {
%>
    <div class="alert-success">Profile updated successfully!</div>
<%
}
%>
        <h2>Welcome, <%= name %></h2>
        <p>Access all your hostel services from one place.</p>

        <div class="dashboard-grid">

            <div class="dashboard-card">
                <span><%= roomNumber %></span>
                Room Number
            </div>

            <div class="dashboard-card">
                <span><%= pendingFees %></span>
                Pending Fees
            </div>

            <div class="dashboard-card">
                <span><%= myComplaints %></span>
                My Complaints
            </div>

            <div class="dashboard-card">
                <span><%= visitorsInside %></span>
                Visitors Inside
            </div>

        </div>

        <br><br>

        <div class="dashboard-grid">

            <a class="dashboard-card" href="room-details.jsp">
                <span>ROOM</span>
                Room Details
            </a>

            <a class="dashboard-card" href="complaint.jsp">
                <span>HELP</span>
                Submit Complaint
            </a>

            <a class="dashboard-card" href="my-complaints.jsp">
                <span>LIST</span>
                My Complaints
            </a>

            <a class="dashboard-card" href="fee-status.jsp">
                <span>FEE</span>
                Fees Status
            </a>

            <a class="dashboard-card" href="view-notices.jsp">
                <span>NEWS</span>
                Notice Board
            </a>

            <a class="dashboard-card" href="my-visitors.jsp">
                <span>VISIT</span>
                My Visitors
            </a>

            <a class="dashboard-card" href="update-profile.jsp">
                <span>EDIT</span>
                Update Profile
            </a>

        </div>
    </div>

</div>

</body>
</html>