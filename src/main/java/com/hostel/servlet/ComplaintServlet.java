package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = (String) request.getSession().getAttribute("studentEmail");
        String complaint = request.getParameter("complaint");

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO complaints(student_email, complaint) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, complaint);

            int row = ps.executeUpdate();

            if (row > 0) {
            	response.sendRedirect("student-dashboard.jsp?success=complaint");	
            } else {
                response.getWriter().println("Complaint submission failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}