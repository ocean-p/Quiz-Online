/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.SubjectDAO;
import dao.SubmitDAO;
import dto.Subject;
import dto.Submit;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Subject2Servlet", urlPatterns = {"/Subject2Servlet"})
public class Subject2Servlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession s = request.getSession();
            if(s.getAttribute("e") != null){
                String email = (String) s.getAttribute("e");
                ArrayList<Subject> sj = SubjectDAO.getAllSubject();
                request.setAttribute("subject", sj);
                String id = request.getParameter("id");
                request.setAttribute("subid", id);
                request.setAttribute("page2", SubmitDAO.getNumberPage2(email, id));
                String index = request.getParameter("index");
                if(index == null){
                    index = "1";
                }
                ArrayList<Submit> sm = SubmitDAO.getSubmitBySubject(email, id, Integer.parseInt(index));
                request.setAttribute("submit", sm);
                request.setAttribute("number", index);
                request.getRequestDispatcher("quizhistory.jsp").forward(request, response);
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
