/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import context.DBContext;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author hp
 */
public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User getUser(String userName, String passWord) {
        String query = "select id, username, password, type, mail\n"
                + "from Account\n"
                + "where username = ? and password = ?";

        try {
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, passWord);

            rs = ps.executeQuery();

            while (rs.next()) {
                return new User(rs.getInt(1), rs.getInt(4), rs.getString(2), rs.getString(3), rs.getString(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void insertUser(User u) {
        String query = "insert into Account(username, password, type, mail) values(?,?,?,?)";

        try {
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUserName());
            ps.setString(2, u.getPassWord());
            ps.setInt(3, u.getType());
            ps.setString(4, u.getMail());

            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public int getUserByUserName(String userName) {
        String query = "select id from Account where username = ?";
        try {
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);

            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
}
