<!DOCTYPE html>
<html>
<head>
    <title>Submit Complaint</title>
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
    <div class="card" style="max-width: 700px; margin: auto;">
        <h2>Submit Complaint</h2>
        <p>Report hostel issues here.</p>

        <form action="ComplaintServlet" method="post">

            <label>Complaint Message</label>
            <textarea name="complaint" rows="6" required></textarea>

            <br><br>

            <button class="btn" type="submit">Submit Complaint</button>

        </form>
    </div>
</div>

</body>
</html>