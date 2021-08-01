/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import modal.DigitalDAO;
import entity.Digital;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // lay txt search, index tu jsp
        String txtSearch = request.getParameter("txtSearch");
        String result = "";
        int index = Integer.parseInt(request.getParameter("index"));

        DigitalDAO digitalDao = new DigitalDAO();
        int count = digitalDao.getCountSearch(txtSearch);
        int size = 2;
        int end = count / size;
        if (count % size != 0) {
            end++;
        }

        // list bai digital theo text search, index
        ArrayList<Digital> list = digitalDao.getPageSearch(txtSearch, index);
        if (list.isEmpty()) {
            result = txtSearch + " not found";
        } else {
            result = "found " + count + " result for " + txtSearch;
        }

//        for (Digital digital : list) {
//            if (digital.getTitle().contains(txtSearch)) {
//                digital.setTitle(digital.getTitle().replaceAll(txtSearch, "<span class=\"highlight\">" + txtSearch + "</span>"));
//            }
//        }
//        
        ArrayList<Digital> listTop5 = digitalDao.getTop5();
        Digital digital = digitalDao.getTop1();

        request.setAttribute("list", list);
        request.setAttribute("count", count);
        request.setAttribute("digitalRecent", digital);
        request.setAttribute("listTop5", listTop5);
        request.setAttribute("end", end);
        request.setAttribute("txtSearch", txtSearch);
        request.setAttribute("index", index);

        request.setAttribute("result", result);
        request.getRequestDispatcher("HomePage.jsp").forward(request, response);
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
