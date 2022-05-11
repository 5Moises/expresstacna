package Configuracion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {

    static String URL = "http://162.217.144.46:8880/";
    static String DATABASE_NAME = "expresstacna";
    static String USERNAME = "expresstacna";
    static String PASSWORD = "S0SnetPeruexpresst@cn@";

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + URL + DATABASE_NAME, USERNAME, PASSWORD);
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
        return con;
    }
}