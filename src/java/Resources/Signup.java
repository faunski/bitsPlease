/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Resources;

import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class Signup extends HttpServlet {

    private final Validate validate;

    public Signup() {
        this.validate = new Validate();
    }

    /**
     * Is used during signup to evaluate the information given
     * @param request the request entity for the servlet
     * @param response the response entity for the servlet
     * @throws ServletException
     * @throws IOException 
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        if (!validate.checkUser(email, pass)) {
            try {
                Account.createUser(email, pass);
                RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
                rs.forward(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            out.println("Account already exists!");
            RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.include(request, response);
        }
    }
}
