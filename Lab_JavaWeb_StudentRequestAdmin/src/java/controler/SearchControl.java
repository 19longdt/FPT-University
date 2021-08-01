/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import dao.DepartmentDAO;
import dao.RequestDAO;
import entity.Department;
import entity.Request;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(name = "SearchControl", urlPatterns = {"/searchView"})
public class SearchControl extends HttpServlet {

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
//        processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        
        ArrayList<Request> listRequest = new ArrayList<>();
        DepartmentDAO depDAo = new DepartmentDAO();
        List<Department> listDepartment = depDAo.getAllDepartment();
        RequestDAO rquestDAO = new RequestDAO();

        String txtSearch = request.getParameter("txtSearch");
        String department = request.getParameter("department");

        if (txtSearch.trim().equals("")) {
            listRequest = rquestDAO.getViewRequestDepartmentByDid(Integer.parseInt(department));
        } else {
            listRequest = rquestDAO.getViewRequestBySearch(txtSearch);
        }
        request.setAttribute("listView", listRequest);
        request.setAttribute("listDepartment", listDepartment);
        request.setAttribute("dpid", Integer.parseInt(department));
        request.setAttribute("txt", txtSearch);
        request.getRequestDispatcher("ViewRequest.jsp").forward(request, response);

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
