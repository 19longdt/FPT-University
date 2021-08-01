/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import context.DBContext;
import entity.History;
import entity.Quiz;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author hp
 */
public class QuizDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static void main(String[] args) throws ParseException {
//        LocalDate currentDate = LocalDate.now();
//        System.out.println(currentDate.toString());
//        
//        SimpleDateFormat i = new SimpleDateFormat("yyyy-MM-dd");
//        SimpleDateFormat i1 = new SimpleDateFormat("dd-MM-yyyy");
//        
//        Date d = i.parse(currentDate.toString());
//        String l = i1.format(d);
//        System.out.println(l);
        QuizDAO q = new QuizDAO();
        if(q.getQuiz("Which package contains the Random class?") == null){
            System.out.println("aaa");
        }
    }

    public ArrayList<Quiz> getListQuizRandom(int number) {
        String query = "SELECT top " + number + " id, Question, Answer, Option1, Option2, Option3, Option4 \n"
                + "FROM Quiz\n"
                + "ORDER BY NEWID();";

        try {
            ArrayList<Quiz> listQuiz = new ArrayList<>();

            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                ArrayList<String> listOption = new ArrayList<>();
                listOption.add(rs.getString(4));
                listOption.add(rs.getString(5));
                listOption.add(rs.getString(6));
                listOption.add(rs.getString(7));

                listQuiz.add(new Quiz(rs.getInt(1), rs.getString(2), rs.getString(3), listOption));
            }
            return listQuiz;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public void addResult(History history) {
        String query = "Insert into History values (?,?,?,?)";

        try {
            conn = new DBContext().getConn();

            ps = conn.prepareStatement(query);
            ps.setString(1, String.valueOf(history.getScore()));
            ps.setInt(2, history.getStatus());
            ps.setString(3, history.getDate());
            ps.setInt(4, history.getIdUser());

            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void addQuiz(Quiz quiz, int idTeacher) {
        LocalDate currentDate = LocalDate.now();
        String query = "Insert into Quiz values (?,?,?,?,?,?,?,?)";
        ArrayList<String> option = quiz.getOption();
        try {
            conn = new DBContext().getConn();

            ps = conn.prepareStatement(query);
            ps.setString(1, quiz.getQuestion());
            ps.setString(2, quiz.getAnswer());
            for (int i = 0; i < option.size(); i++) {
                ps.setString(i + 3, option.get(i));
            }

            SimpleDateFormat i = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat i1 = new SimpleDateFormat("dd-MM-yyyy");

            Date d = i.parse(currentDate.toString());
            ps.setString(7, i1.format(d));
            ps.setInt(8, idTeacher);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public int getNumberOfQuestion(int idTeacher) {
        String query = "select count(*) from quiz where idAccount = ?";

        try {
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idTeacher);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public ArrayList<Quiz> getListQuiz() {
        String query = "SELECT  Question, DateCreated FROM Quiz";

        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");

        try {
            ArrayList<Quiz> listQuiz = new ArrayList<>();

            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                String inputDate = rs.getString(2).replace("/", "-");

                Date date = inputFormat.parse(inputDate);

                String dateFormat = format.format(date);

                listQuiz.add(new Quiz(rs.getString(1), dateFormat));
            }
            return listQuiz;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public ArrayList<Quiz> getListQuizByAccount(String idaccount) {
        String query = "SELECT  Question, DateCreated FROM Quiz where idaccount = ?";

        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat format = new SimpleDateFormat("dd-MMM-yyyy");

        try {
            ArrayList<Quiz> listQuiz = new ArrayList<>();

            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, idaccount);
            rs = ps.executeQuery();

            while (rs.next()) {
                String inputDate = rs.getString(2).replace("/", "-");

                Date date = inputFormat.parse(inputDate);

                String dateFormat = format.format(date);

                listQuiz.add(new Quiz(rs.getString(1), dateFormat));
            }
            return listQuiz;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public ArrayList<Quiz> getListQuizPagination(int index, int idTeacher) {
        String query = "with tablenew as(\n"
                + "select ROW_NUMBER() over (order by id asc) as ROWNEW,\n"
                + "* from Quiz where idAccount = ?)\n"
                + "select * from tablenew where ROWNEW between ? and ?";

        try {
            ArrayList<Quiz> listQuiz = new ArrayList<>();

            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idTeacher);
            ps.setInt(2, (index * 10) - 9);
            ps.setInt(3, index * 10);
            rs = ps.executeQuery();

            while (rs.next()) {
                ArrayList<String> listOption = new ArrayList<>();

                listOption.add(rs.getString(5));
                listOption.add(rs.getString(6));
                listOption.add(rs.getString(7));
                listOption.add(rs.getString(8));

                listQuiz.add(new Quiz(rs.getInt(2), rs.getString(3), rs.getString(4), listOption, rs.getString(9)));
            }
            return listQuiz;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;
    }

    public String getQuiz(String question) {
        String query = "Select question From Quiz where question = ?";
        try {
            conn = new DBContext().getConn();
            ps = conn.prepareStatement(query);
            ps.setString(1, question);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }
}
