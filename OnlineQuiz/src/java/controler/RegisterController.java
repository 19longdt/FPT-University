/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.UserDAO;

/**
 *
 * @author hp
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class RegisterController extends HttpServlet {

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

        UserDAO userDAO = new UserDAO();
        String result = "";
        int check = 0;
        int type = 0;

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String inputType = request.getParameter("type");
        String email = request.getParameter("email");

        // dubplicate Username, setType
        if (userDAO.getUserByUserName(userName) != 0) {
            check = 1;
        }
        if (inputType.equalsIgnoreCase("teacher")) {
            type = 1;
        }
        // check password length
        if (password.length() < 8) {
            check = 2;
        }

        /* check Email 
            + " - Valid email prefixes: first and last character must be an ascii character (a-z) or number (0-9)"
            + "(.) Two or more than two consecutive periods"
            + " - Valid email domains: only @ and  numeric values (from 0 to 9), on condition that domains can’t be all numeric;"
            + "a hyphen (-), on condition that it is not placed at the beginning or end of the domain.";
         */
        Pattern pattern
                = Pattern.compile("^([\\w#!%$‘&+*/=?^_`{|}~-]+[\\w#!%$‘&+*/=?^_`.{|}~-]*[\\w#!%$‘&+*/=?^_`{|}~-]+){1,64}@[\\w]{2,63}[\\w-]*(\\.[\\w-]{2,63})*(\\.[a-zA-Z]{2,63})$");
               
        if (!pattern.matcher(email).find() || email.contains("..")) {
            check = 3;
        }
        System.out.println(check);

        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("email", email);

        // setResult, if check not modify check = 0 => Register Successfull
        if (check == 1) {
            result += "Duplicate UserName";
        } else if (check == 2) {
            result += "Sorry, please check your password ( length greater than or equal to 8 ) ";
        } else if (check == 3) {
            result += "Sorry, please check your email";
        } else {
            User user = new User(type, userName, password, email);
            userDAO.insertUser(user);
            result += "Register Successfull!";
            request.setAttribute("userName", "");
            request.setAttribute("password", "");
            request.setAttribute("email", "");
        }
        request.setAttribute("result", result);
        request.getRequestDispatcher("Register.jsp").forward(request, response);

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
