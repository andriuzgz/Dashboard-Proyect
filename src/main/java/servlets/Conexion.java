package servlets;

import java.sql.*;
import java.util.Properties;
import java.io.InputStream;

public class Conexion {

    private static String URL;
    private static String USER;
    private static String PASS;

    static {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	
            Properties props = new Properties();
            InputStream input = Conexion.class
                .getClassLoader()
                .getResourceAsStream("db.properties");

            System.out.println("INPUT: " + input);
            
            props.load(input);

            URL = props.getProperty("db.url");
            USER = props.getProperty("db.user");
            PASS = props.getProperty("db.pass");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}