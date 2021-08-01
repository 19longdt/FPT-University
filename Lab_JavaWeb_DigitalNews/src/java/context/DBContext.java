/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
public class DBContext {
     //Connection quan ly ket noi den CSDL
    Connection conn = null;

    public DBContext(String URL, String userName, String password) {
        try {
            // URL: String connection
            // account: SQL Server
            // get driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // connection
            conn = DriverManager.getConnection(URL, userName, password);
//            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Connection getConn() {
        return conn;
    }
    

    public DBContext() {
        this("jdbc:sqlserver://localhost:1433;databaseName=new",
                "sa","123");
    }
    public ResultSet getData(String sql){
        ResultSet rs=null;
        try {
            Statement state=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs=state.executeQuery(sql);
            //return rs;
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return rs;
    }
    public static void main(String[] args) {
        new DBContext();
    }
}
