/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author hp
 */
public class AccountDAO {
     Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public static void main(String[] args) {
         AccountDAO acc = new AccountDAO();
        Account account = acc.getAccont("admin", "123");
        System.out.println(account);
    }
    
    public Account getAccont(String userName, String password){
        String sql = "select * from [User] where username = ? and password = ?";
        
        try {
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2,password);
            rs = ps.executeQuery();
            
            if(rs.next()){
                return new Account(rs.getString(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
}
