/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import context.DBContext;
import entity.Digital;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author hp
 */
public class DigitalDAO {

    static SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
    static SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm a");
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    public static void main(String[] args) {
        DigitalDAO d = new DigitalDAO();
        System.out.println(d.getTop1().getTime());

//        //       System.out.println(c);
//        try {
//            String query = "select ID, tittle, description, image, author, dateCreate, shortDes \n"
//                    + "from digital \n"
//                    + "where dateCreate = (select max(dateCreate) from digital)";
//            conn = new DBContext().getConn();
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Date date = rs.getTime(6);
//                System.out.println(sdf1.format(rs.getTime(6)));
//            }
//        } catch (SQLException e) {
//            System.out.println("getTop1  " + e.getMessage());
//        }
    }

    public Digital getTop1() {
        try {
            String query = "select ID, tittle, description, image, author, dateCreate, shortDes \n"
                    + "from digital \n"
                    + "where dateCreate = (select max(dateCreate) from digital)";
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Digital(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), sdf.format(rs.getDate(6)) + " " + sdf1.format(rs.getTime(6)), rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println("getTop1  " + e.getMessage());
        }
        return null;
    }

    public Digital getRandomRecent() {
        try {
            String query = "select top 1 ID, tittle, description, image, author, dateCreate, shortDes \n"
                    + "from digital \n"
                    + "ORDER BY NEWID();";
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Digital(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), sdf.format(rs.getDate(6)), rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println("getTop1  " + e.getMessage());
        }
        return null;
    }

    public ArrayList<Digital> getTop5() {

        try {
            ArrayList<Digital> list = new ArrayList<>();
            String query = "select top 5 ID, tittle, description, image, author,dateCreate, shortDes \n"
                    + "from Digital\n"
                    + "where dateCreate not in (select max(dateCreate) from digital)\n"
                    + "order by dateCreate Desc";
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Digital(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), sdf.format(rs.getDate(6)), rs.getString(7)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("getLastArticles  " + e.getMessage());
        }
        return null;
    }

    public Digital getDigitalById(int id) {
        try {
            String query = "select tittle, description, image, author, dateCreate, shortDes \n"
                    + "from digital \n"
                    + "where id = ? ";
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Digital(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), sdf.format(rs.getDate(5)) + " " + sdf1.format(rs.getTime(5)), rs.getString(6));
            }
        } catch (SQLException e) {
            System.out.println("getDigitalById  " + e.getMessage());
        }
        return null;
    }

    public int getCountSearch(String txt) {
        try {
            String query = "select count (*) from digital where tittle like ? ";
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("getCount  " + e.getMessage());
        }
        return 0;
    }

    public ArrayList<Digital> getPageSearch(String txtSearch, int index) {
        try {
            ArrayList<Digital> list = new ArrayList<>();
            String query = "select ID, tittle, description, image, author,dateCreate, shortDes\n"
                    + "from digital\n"
                    + "where tittle like ? \n"
                    + "order by ID \n"
                    + "offset ? row fetch next 2 rows only";
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, (index - 1) * 2);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Digital(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("getPageSearch  " + e.getMessage());
        }
        return null;
    }
}
