/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import dao.RequestDAO;
import entity.Request;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(name = "SolveRequestControl", urlPatterns = {"/solverequest"})
public class SolveRequestControl extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

        RequestDAO dao = new RequestDAO();
        int solve = Integer.parseInt(request.getParameter("solve"));
        String id = request.getParameter("id");

        Request r = dao.getRequestByID(Integer.parseInt(id));
        request.setAttribute("r", r);

        if (solve == 1) {
            request.setAttribute("check", "check");
        } else {

            request.setAttribute("check", null);
        }
        request.getRequestDispatcher("SolveRequest.jsp").forward(request, response);

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
//        processRequest(request, response);
        RequestDAO dao = new RequestDAO();
        String requestID = request.getParameter("requestID");

        int status = Integer.parseInt(request.getParameter("status"));
        String solveBy = request.getParameter("solveBy");
        String solution = request.getParameter("solution");

        dao.solveRequest(Integer.parseInt(requestID), status, solveBy, solution);

        Request r = dao.getRequestByID(Integer.parseInt(requestID));
        request.setAttribute("r", r);
        request.setAttribute("result", "Solve Request Successfully!! ");
        request.setAttribute("check", "check");
        request.getRequestDispatcher("SolveRequest.jsp").forward(request, response);
//        response.sendRedirect("view?today=1&requestTo=1");
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
