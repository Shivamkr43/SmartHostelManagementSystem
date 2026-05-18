package com.hostel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hostel.dao.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = (String) request.getSession().getAttribute("studentEmail");
        String phone = request.getParameter("phone");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM students WHERE email=? AND password=?"
            );

            check.setString(1, email);
            check.setString(2, oldPassword);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                PreparedStatement update = con.prepareStatement(
                    "UPDATE students SET phone=?, password=? WHERE email=?"
                );

                update.setString(1, phone);
                update.setString(2, newPassword);
                update.setString(3, email);

                update.executeUpdate();

                response.sendRedirect("student-dashboard.jsp?success=profile");

            } else {
                response.getWriter().println("Old password is incorrect.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}