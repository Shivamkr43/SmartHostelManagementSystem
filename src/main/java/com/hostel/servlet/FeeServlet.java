package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/FeeServlet")
public class FeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentEmail = request.getParameter("studentEmail");
        String month = request.getParameter("month");
        int amount = Integer.parseInt(request.getParameter("amount"));
        String status = request.getParameter("status");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO fees(student_email, month, amount, status) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, studentEmail);
            ps.setString(2, month);
            ps.setInt(3, amount);
            ps.setString(4, status);

            ps.executeUpdate();

            response.sendRedirect("admin-dashboard.jsp?success=fee");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}