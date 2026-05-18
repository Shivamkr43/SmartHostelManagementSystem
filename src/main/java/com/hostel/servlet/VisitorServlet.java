package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/VisitorServlet")
public class VisitorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String visitorName = request.getParameter("visitorName");
        String studentEmail = request.getParameter("studentEmail");
        String relation = request.getParameter("relation");
        String phone = request.getParameter("phone");
        String purpose = request.getParameter("purpose");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO visitors(visitor_name, student_email, relation, phone, purpose) VALUES (?, ?, ?, ?, ?)"
            );

            ps.setString(1, visitorName);
            ps.setString(2, studentEmail);
            ps.setString(3, relation);
            ps.setString(4, phone);
            ps.setString(5, purpose);

            ps.executeUpdate();

            response.sendRedirect("admin-dashboard.jsp?success=visitor");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}