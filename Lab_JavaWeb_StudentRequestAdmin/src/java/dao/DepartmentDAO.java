/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Department;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author hp
 */
public class DepartmentDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Department> getAllDepartment() {
        List<Department> list = new ArrayList<>();
        try {

            String query = "select * from Department";
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Department(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println("getAllDepartment:" + e.getMessage());
        }
        return list;
    }
    
    
}
