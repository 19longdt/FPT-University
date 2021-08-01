/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import entity.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
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
@WebServlet(name = "preTake", urlPatterns = {"/preTake"})
public class NumberQuizController extends HttpServlet {

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

        String numberOfQuestion = request.getParameter("numberQuestion");
        QuizDAO q = new QuizDAO();

        HttpSession session = request.getSession();
        
        // remove Result preTakeQuiz new
        session.removeAttribute("result");
        request.removeAttribute("result");
        
        // check numberQuestion
        try {
            int number = Integer.parseInt(numberOfQuestion);
            if (number > 10) {
                request.setAttribute("check", "Number Question not >10");
                request.getRequestDispatcher("TakeQuiz.jsp").forward(request, response);
                return;
            }

        } catch (Exception e) {
            request.setAttribute("check", "input Number, Number Question not >10");
            request.getRequestDispatcher("TakeQuiz.jsp").forward(request, response);
            return;
        }
        session.setAttribute("numberQuestion", numberOfQuestion);

        ArrayList<Quiz> listQuiz = q.getListQuizRandom(Integer.parseInt(numberOfQuestion));

        session.setAttribute("listQuiz", listQuiz);
        session.setAttribute("timecreate", Calendar.getInstance().getTimeInMillis());    
//        System.out.println(Calendar.getInstance().getTimeInMillis());
//        System.out.println(session.getCreationTime());
//        System.out.println("Độ trễ ban đầu "+(session.getCreationTime() - Calendar.getInstance().getTimeInMillis()) / 1000);
        response.sendRedirect("TakeQuiz");

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
