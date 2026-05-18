package com.hostel.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/smart_hostel",
                "root",
                "root123"
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}	