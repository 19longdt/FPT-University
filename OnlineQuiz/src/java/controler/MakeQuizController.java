/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import entity.Quiz;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "MakeQuiz", urlPatterns = {"/MakeQuiz"})
public class MakeQuizController extends HttpServlet {

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
        QuizDAO quizDAO = new QuizDAO();
        User user = (User) session.getAttribute("teacher");
        int idTeacher = user.getId();

        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        int check = 1;
        String result = "";
        // check Dubplicate Quiz
        if (quizDAO.getQuiz(question) != null) {
            check = 2;
        }
        
        // check choose Correct Answer
        if (answer == null) {
            check = 0;
        }

        ArrayList<String> option = new ArrayList<>();
        if (check == 1) {
            // get option, add to ListOption
            for (int i = 1; i < 5; i++) {
                option.add(request.getParameter("option" + i));
            }
            for (int i = 0; i < option.size(); i++) {
                if (Integer.parseInt(answer) == i + 1) {
                    answer = option.get(i);
                    break;
                }
            }
            Quiz quiz = new Quiz(question, answer, option);
            quizDAO.addQuiz(quiz, idTeacher);
            result += "ADD Question and Answer Successfull!";

        } else if (check == 0) {
            result += "Empty Answer! ";
            request.setAttribute("question", question);
            request.setAttribute("listOption", option);
        } else if (check == 2) {
            result += "Dubplicate Question! Make new Question";
        }
        // push to MakeQUiz.jsp
        request.setAttribute("resultMakeQuiz", result);
        request.getRequestDispatcher("MakeQuiz.jsp").forward(request, response);
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
