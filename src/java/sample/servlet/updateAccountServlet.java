/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.dao.AccountDAO;

/**
 *
 * @author ACER
 */
public class updateAccountServlet extends HttpServlet {

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
            HttpSession session = request.getSession(true);
            String name = request.getParameter("txtname");
            String phone = request.getParameter("txtphone");
            if (session != null) {
                int id = (int) session.getAttribute("accID");
                String oldName = (String) session.getAttribute("name");
                String oldPhone = (String) session.getAttribute("phone");               
                if ((name == null || name.equals("")) && (phone == null || phone.equals(""))) {
                    request.setAttribute("warning", "Name and phone is not blank!!!");
                    request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
                }
                if(name == null || name.equals("")){
                    name=oldName;
                }
                if(phone == null || phone.equals("")){
                    phone=oldPhone;
                }
                if (name != null || phone != null) {
                    AccountDAO.updateAccount(id, name, phone);
                    request.setAttribute("upname", name);
                    request.setAttribute("upphone", phone);
                    request.setAttribute("warning", "Update Sucessfully!");
                    request.getRequestDispatcher("changeProfile.jsp").include(request, response);
                }
            }
            //response.sendRedirect("personalPage.jsp");
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
