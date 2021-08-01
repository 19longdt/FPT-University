/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import entity.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.QuizDAO;

/**
 *
 * @author hp
 */
@WebServlet(name = "TakeQuiz", urlPatterns = {"/TakeQuiz"})
public class TakeQuizController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        if (session.getAttribute("finish") != null) {
            request.getRequestDispatcher("Result?checkFinish=1").forward(request, response);
            return;
        }

        int numberOfQuestion = Integer.parseInt(String.valueOf(session.getAttribute("numberQuestion")));
        int count = 1;
        int countSession = 0;
        int countCorrectAnswer = 0;
        int countCorrectAnswerSesion = 0;

        int c = 0;
        if (session.getAttribute("count") != null) {
            c = Integer.parseInt(String.valueOf(session.getAttribute("count")));
        }
        // check this is take new Quiz or Student reload Take Quiz Page
        if (c > 1 && c <= numberOfQuestion) {
            countSession = c;
            session.setAttribute("count", countSession);
            session.setAttribute("reload", "reload");
        } else {
            session.setAttribute("count", count);
            session.setAttribute("countCorrectAnswer", countCorrectAnswer);
        }

        if (session.getAttribute("countCorrectAnswer") != null) {
            countCorrectAnswerSesion = Integer.parseInt(String.valueOf(session.getAttribute("countCorrectAnswer")));
            session.setAttribute("countCorrectAnswer", countCorrectAnswerSesion);
        } else {
            session.setAttribute("countCorrectAnswer", countCorrectAnswer);
        }

        // get listQuiz from session
        ArrayList<Quiz> listQuiz = (ArrayList<Quiz>) session.getAttribute("listQuiz");
//        for (int i = 0; i < listQuiz.size(); i++) {
//            System.out.println(listQuiz.get(i).getAnswer());
//        }

        String question = "";
        ArrayList<String> listOption = new ArrayList<>();

        // check this is take new Quiz or Student reload Take Quiz Page, SET COUNT
        if (session.getAttribute("reload") != null && Integer.parseInt(String.valueOf(session.getAttribute("count"))) > 1) {
            question = listQuiz.get(countSession - 1).getQuestion();
            listOption = listQuiz.get(countSession - 1).getOption();
//            session.setAttribute("count", countSession + 1);
        } else {
            question = listQuiz.get(0).getQuestion();
            listOption = listQuiz.get(0).getOption();
        }

        // Compare time preTake and Reload Page if Student reload Take Quiz Page
        long t1 = (long) session.getAttribute("timecreate");
        long t2 = Calendar.getInstance().getTimeInMillis();
//        System.out.println("Do tre lam bai  " + (t2 - t1) / 1000);

//        if (countSession > 0) {
        session.setAttribute("timeout", ((60 * numberOfQuestion) - ((t2 - t1) / 1000)));
//        } else {
//            session.setAttribute("timeout", 60 * numberOfQuestion);
//        }

//            System.out.println(((60 * numberOfQuestion) - ((t2 - t1) / 1000) + 7));
        request.setAttribute("question", question);
        request.setAttribute("listOption", listOption);

        request.getRequestDispatcher("TakeQuiz.jsp").forward(request, response);

//        int countCorrectAnswer = (int) session.getAttribute("countCorrectAnswer");
//        String answer = request.getParameter("answer");
//        String[] a = request.getParameterValues("answer");
//        if (a != null) {
//            for (int i = 0; i < a.length; i++) {
//                System.out.println(a.toString());
//            }
//
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
