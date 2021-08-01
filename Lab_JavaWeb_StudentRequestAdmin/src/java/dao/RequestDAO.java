/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import entity.Request;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author hp
 */
public class RequestDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static void main(String[] args) {
        RequestDAO r = new RequestDAO();
        System.out.println(r.getRequestByID(23).getStatus());
    }

    public List<Request> getRequestbyTime() {
        Calendar c = Calendar.getInstance();

        int year = c.getTime().getYear();
        int month = c.getTime().getMonth();
        int day = c.getTime().getDate();

        Date date = new Date(year, month, day);
        Date date1 = new Date(year, month, day - 2);
        Date date2 = new Date(year, month, day - 1);

        String sql = "select d.id, d.[name] , count(*) \n"
                + "from Request r join Department d on r.requestToDid = d.id\n"
                + "where r.dateCreated not in ( select dateCreated from Request where dateCreated = ?)\n"
                + "and r.dateCreated between ? and ? \n"
                + "group by d.id, d.name";
        List<Request> list = new ArrayList<>();
        try {
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(sql);
            ps.setString(1, date.toString());
            ps.setString(2, date1.toString());
            ps.setString(3, date2.toString());
            rs = ps.executeQuery();

            while (rs.next()) {
                Request r = new Request(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(r);
            }
            return list;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
    Calendar c = Calendar.getInstance();

    int year = c.getTime().getYear();
    int month = c.getTime().getMonth();
    int day = c.getTime().getDate();

    Date date = new Date(year, month, day);

    Date date1 = new Date(year, month, day - 2);
    Date date2 = new Date(year, month, day - 1);

    public ArrayList<Request> getRequestToday() {

        String sql = "select  d.id, d.[name] , count(*)\n"
                + "from Request r join Department d on r.requestToDid = d.id\n"
                + "where r.dateCreated = ? \n"
                + "group by d.id, r.requestToDid, d.name";
        ArrayList<Request> list = new ArrayList<>();
        try {
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(sql);
            ps.setString(1, date.toString());
            rs = ps.executeQuery();

            while (rs.next()) {
                Request r = new Request(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(r);
            }
            return list;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    public ArrayList<Request> getViewRequestDepartmentTime(int to) {
        ArrayList<Request> list = new ArrayList<>();
        try {
            String today = sdf.format(Calendar.getInstance().getTime());

            String query = "SELECT *\n"
                    + "FROM Request a JOIN Department b ON b.id = a.requestToDid\n"
                    + "WHERE  \n"
                    + " a.dateCreated not in ( select dateCreated from Request where dateCreated = ?)\n"
                    + "and a.dateCreated between ? and ?\n"
                    + "AND a.requestToDid = ?";
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, date.toString());
            ps.setString(2, date1.toString());
            ps.setString(3, date2.toString());
            ps.setInt(4, to);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(13), sdf.format(rs.getDate(4, Calendar.getInstance())),
                        rs.getString(5), rs.getInt(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Request> getViewRequestDepartmentToday(int to) {
        ArrayList<Request> list = new ArrayList<>();
        try {
            String query = "SELECT *\n"
                    + "FROM Request a JOIN Department b ON b.id = a.requestToDid\n"
                    + "WHERE  \n"
                    + " a.dateCreated = ?\n"
                    + "AND a.requestToDid = ?";
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, date.toString());
            ps.setInt(2, to);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(13), sdf.format(rs.getDate(4, Calendar.getInstance())),
                        rs.getString(5), rs.getInt(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ArrayList<Request> getViewRequestDepartmentByStatus(int status) {
        ArrayList<Request> list = new ArrayList<>();
        try {
            String query = "SELECT *\n"
                    + "FROM Request a JOIN Department b ON b.id = a.requestToDid\n"
                    + "WHERE  a.status = ?";
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(13), sdf.format(rs.getDate(4, Calendar.getInstance())),
                        rs.getString(5), rs.getInt(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println("getbystatus " + e.getMessage());
        }
        return list;
    }

    public ArrayList<Request> getViewRequestDepartmentByDid(int did) {
        ArrayList<Request> list = new ArrayList<>();
        try {
            String query = "SELECT *\n"
                    + "FROM Request a JOIN Department b ON b.id = a.requestToDid\n"
                    + "WHERE  a.requestToDid = ?";
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setInt(1, did);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(13), sdf.format(rs.getDate(4, Calendar.getInstance())),
                        rs.getString(5), rs.getInt(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println("getbystatus " + e.getMessage());
        }
        return list;
    }

    public ArrayList<Request> getViewRequestBySearch(String txtSearch) {
        ArrayList<Request> list = new ArrayList<>();
        try {
            String query = "SELECT *\n"
                    + "FROM Request a JOIN Department b ON b.id = a.requestToDid\n"
                    + "WHERE  a.title LIKE ?";
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(13), sdf.format(rs.getDate(4, Calendar.getInstance())),
                        rs.getString(5), rs.getInt(7), rs.getString(8)));
            }

        } catch (Exception e) {
            System.out.println("getbystatus " + e.getMessage());
        }
        return list;
    }

    public Request getRequestByID(int requestId) {
        try {
            String query = "SELECT *\n"
                    + "FROM Request a JOIN Department b ON b.id = a.requestToDid\n"
                    + "JOIN [User] c ON c.UserID = a.studentID\n"
                    + "WHERE a.id = ?";
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setInt(1, requestId);
            rs = ps.executeQuery();

            if (rs.next()) {
                
                Request request = new Request(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(13),
                        rs.getString(3),
                        rs.getString(17),
                        sdf.format(rs.getDate(4)),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        sdf.format(Calendar.getInstance().getTime()),
                        rs.getString(10),
                        rs.getString(11));
                return request;
            }

        } catch (Exception e) {
            System.out.println("getRequestByID: " + e.getMessage());
        }
        return null;
    }
    
    public void solveRequest(int id, int status, String solveBy, String solution) {
        String query = "UPDATE Request\n"
                + "SET status = ?, clodeDate = GETDATE(), solvedBy = ?, solution = ?\n"
                + "WHERE id = ?";
        
        try {
            conn = new db.DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setInt(1, status);
            ps.setString(2, solveBy);
            ps.setString(3, solution);
            ps.setInt(4, id);
            
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("solveRequest: " + e.getMessage());
        }
    }
}
