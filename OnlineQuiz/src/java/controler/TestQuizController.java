/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import entity.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(name = "NextQuiz", urlPatterns = {"/NextQuiz"})
public class TestQuizController extends HttpServlet {

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

        String answer = request.getParameter("ans");

        System.out.println(answer);
        
        // get countCorrectAnswer, count number Question did
        
        int countCorrectAnswer = Integer.parseInt(String.valueOf(session.getAttribute("countCorrectAnswer")));
        int count = Integer.parseInt(String.valueOf(session.getAttribute("count")));
        System.out.println("Count =" + count);
        System.out.println("CountCorresct =" + countCorrectAnswer);
//        System.out.println(count + " coaoosdoasod ");

        QuizDAO q = new QuizDAO();

        int number = Integer.parseInt(String.valueOf(session.getAttribute("numberQuestion")));
        if ((count > 0 && count < number)) {

            ArrayList<Quiz> listQuiz = (ArrayList<Quiz>) session.getAttribute("listQuiz");
            String question =  listQuiz.get(count).getQuestion();
            ArrayList<String> listOption = listQuiz.get(count).getOption();
            
            String correctAnswer = correctAnswer = listQuiz.get(count - 1).getAnswer();
            // check Answer preQuiz
//            String correctAnswer = "";
//            
//            if (session.getAttribute("reload") != null) {
//                correctAnswer = listQuiz.get(count - 2).getAnswer();
//            } else {
//                correctAnswer = listQuiz.get(count - 1).getAnswer();
//            }
            System.out.println(count + "cau " + answer + "   " + correctAnswer);
            
            if (answer.equalsIgnoreCase(correctAnswer)) {
                countCorrectAnswer++;
                session.setAttribute("countCorrectAnswer", countCorrectAnswer);
            }
            count++;
            session.setAttribute("count", count);
            System.out.println("Countsau =" + count);
            // put html to TakeQuiz.jsp bằng ajax
            try (PrintWriter out = response.getWriter()) {
                out.println("<h4>" + question + "</h4>\n");
                for (int i = 0; i < listOption.size(); i++) {
                    out.println("<input type=\"checkbox\" id=\"ans\" name=\"answer\" value=\"" + listOption.get(i) + "\"/>" + listOption.get(i) + "\n"
                            + "    <br>\n");
                }
                out.println("<button onclick=\"Next()\" value=\"Next\" >Next</button>");
            }

            // when end quiz, check Ans and show CheckBox on TakeQuiz.jsp
        } else if (count == Integer.parseInt(String.valueOf(session.getAttribute("numberQuestion")))) {
            ArrayList<Quiz> listQuiz = (ArrayList<Quiz>) session.getAttribute("listQuiz");
            
            String correctAnswer = listQuiz.get(count - 1).getAnswer();
            
            
            if (answer.equalsIgnoreCase(correctAnswer)) {
                countCorrectAnswer++;
                session.setAttribute("countCorrectAnswer", countCorrectAnswer);
            }

            request.setAttribute("finish", "I want finish this Exam");
            session.setAttribute("finish", "finish");
            request.getRequestDispatcher("TakeQuiz.jsp").forward(request, response);
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
