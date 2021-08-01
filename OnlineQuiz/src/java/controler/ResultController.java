/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import entity.History;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
@WebServlet(name = "Result", urlPatterns = {"/Result"})
public class ResultController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            String check = request.getParameter("checkFinish");
//            String finish = request.getParameter("finish");
            if (check == null) {
                
            }
            HttpSession session = request.getSession();
            QuizDAO quizDAO = new QuizDAO();
            
            // get User, numberQuestion, numberCorrectAnswer
            User user = (User) session.getAttribute("student");
            if(user == null){
                user = (User) session.getAttribute("teacher");
            }
            int idUser = user.getId();

            int countCorrectAnswer = Integer.parseInt(String.valueOf(session.getAttribute("countCorrectAnswer")));
            int numberQuestion = Integer.parseInt(String.valueOf(session.getAttribute("numberQuestion")));

            System.out.println(countCorrectAnswer + "   " + numberQuestion);
            
            // Calculate Result
            if (check.equals("1")) {
                double score = (double) countCorrectAnswer / (double) numberQuestion;
                double scoreFormat = (double) Math.round(score * 100 * 10) / 100;
                String result = "";
                LocalDate currentDate = LocalDate.now();
                if (score > 0.5) {
                    result += scoreFormat + "(" + scoreFormat * 10 + "%) - PASSED";
                    session.setAttribute("status", "pass");
//                    System.out.println((float) scoreFormat + "  " + 1 + " " + currentDate.toString() + " " + idUser);
                    quizDAO.addResult(new History((float) scoreFormat, 1, currentDate.toString(), idUser));
                } else {
                    session.setAttribute("status", null);
                    result += scoreFormat + "(" + scoreFormat * 10 + "%) - NOT PASS";
                    quizDAO.addResult(new History((float) scoreFormat, 0, currentDate.toString(), idUser));
                }
                request.setAttribute("finish", null);
                session.setAttribute("finish", null);
                
                request.setAttribute("result", result);
                session.setAttribute("result", result);
                
                session.removeAttribute("numberQuestion");
                session.removeAttribute("count");
                session.removeAttribute("reload");
                session.removeAttribute("countCorrectAnswer");
                request.getRequestDispatcher("TakeQuiz.jsp").forward(request, response);
            }
        }
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
