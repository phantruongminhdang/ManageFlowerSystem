/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.dao.AccountDAO;
import sample.dto.Account;

/**
 *
 * @author ACER
 */
public class registerServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("txtemail");
            String fullname = request.getParameter("txtfullname");
            String password = request.getParameter("txtpassword");
            String phone = request.getParameter("txtphone");
            if (!phone.matches("^\\+?\\d{1,3}?[- .]?\\(?(?:\\d{2,3})\\)?[- .]?\\d\\d\\d[- .]?\\d\\d\\d\\d$")) {
                request.setAttribute("txtemail", email);
                request.setAttribute("txtfullname", fullname);
                request.setAttribute("txtphone", phone);
                request.setAttribute("ERROR", "the phone is invalid");
                request.getRequestDispatcher("registration.jsp").forward(request, response);
            } else {
                int status = 1;
                int role = 0;
                Account acc = AccountDAO.getAccount(email);
                if (acc == null) {
                    int result = AccountDAO.insertAccount(email, password, fullname, phone, status, role);
                    if (result > 0) {
                        request.setAttribute("email_newAccount", email);
                        RequestDispatcher rd = request.getRequestDispatcher("sendOTP");
                        rd.forward(request, response);
                    } else {
                        response.sendRedirect("errorpage.html");
                    }
                } else {
                    request.setAttribute("txtemail", email);
                    request.setAttribute("txtfullname", fullname);
                    request.setAttribute("txtphone", phone);
                    request.setAttribute("ERROR", "Account have already existed");
                    request.getRequestDispatcher("registration.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
