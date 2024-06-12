/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.AccountDAO;
import sample.dto.Account;

/**
 *
 * @author ACER
 */
public class loginServlet extends HttpServlet {

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
            {
                /* TODO output your page here. You may use following sample code. */
                String email = request.getParameter("txtemail");
                String password = request.getParameter("txtpassword");
                String save = request.getParameter("savelogin");
                Account acc = new Account();
                try {
                    if (email == null || email.equals("") || password == null || password.equals("")) {
                        Cookie[] c = request.getCookies();
                        String token = "";
                        if (c != null) {
                            for (Cookie aCookie : c) {
                                if (aCookie.getName().equals("selector")) {
                                    token = aCookie.getValue();
                                }
                            }
                        }
                        if (!token.equals("")) {
                            acc = AccountDAO.getAccountByToken(token);
                            if (acc != null) {
                                HttpSession session = request.getSession(true);
                                if (session != null) {
                                    if (acc.getRole() == 1) {
                                        session.setAttribute("name", acc.getFullname());
                                        session.setAttribute("email", acc.getEmail());
                                        session.setAttribute("accID", acc.getAccID());
                                        session.setAttribute("phone", acc.getPhone());
                                        session.setAttribute("role", acc.getRole());
                                        response.sendRedirect("AdminIndex.jsp");
                                    } else {
                                        session.setAttribute("name", acc.getFullname());
                                        session.setAttribute("email", acc.getEmail());
                                        session.setAttribute("accID", acc.getAccID());
                                        session.setAttribute("phone", acc.getPhone());
                                        session.setAttribute("role", acc.getRole());
                                        response.sendRedirect("LoadPlant");
                                    }
                                }
                            }
                        } else {
//                        response.sendRedirect("errorpage.html");
                            request.setAttribute("warning", "Email and Password is not blank!!!");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    } else {
                        //cek email,password co trong bang Account hay k
                        acc = AccountDAO.getAccount(email, password);
                        if (acc != null) {
                            if (acc.getRole() == 1) {//is admin
                                HttpSession session = request.getSession(true);
                                if (session != null) {
                                    session.setAttribute("name", acc.getFullname());
                                    session.setAttribute("email", email);
                                    session.setAttribute("accID", acc.getAccID());
                                    session.setAttribute("phone", acc.getPhone());
                                    session.setAttribute("role", acc.getRole());
                                    //create a cookie and attach it to response object
                                    if (save != null) {
                                        String token = acc.getEmail();
                                        int result = AccountDAO.updateToken(token, email);
                                        if (result > 0) {
                                            Cookie cookie = new Cookie("selector", token);
                                            cookie.setMaxAge(100 * 2);
                                            response.addCookie(cookie);
                                        } else {
                                            response.sendRedirect("errorpage.html");
                                        }
                                    }
                                    response.sendRedirect("AdminIndex.jsp");
                                }
                            } else//is customer
                            {
                                HttpSession session = request.getSession(true);
                                if (session != null) {
                                    session.setAttribute("name", acc.getFullname());
                                    session.setAttribute("email", email);
                                    session.setAttribute("accID", acc.getAccID());
                                    session.setAttribute("phone", acc.getPhone());
                                    session.setAttribute("role", acc.getRole());
                                    //create a cookie and attach it to response object
                                    if (save != null) {
                                        String token = acc.getEmail();
                                        int result = AccountDAO.updateToken(token, email);
                                        if (result > 0) {
                                            Cookie cookie = new Cookie("selector", token);
                                            cookie.setMaxAge(100 * 2);
                                            response.addCookie(cookie);
                                        } else {
                                            response.sendRedirect("errorpage.html");
                                        }
                                    }
                                    response.sendRedirect("LoadPlant");
                                }
                            }
                        } else {
                            request.setAttribute("warning", "Email or Password is wrong!!!");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
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
