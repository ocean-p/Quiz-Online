/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.QuestionDAO;
import dao.SubjectDAO;
import dto.Question;
import dto.Subject;
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
@WebServlet(name = "UpdateFormServlet", urlPatterns = {"/UpdateFormServlet"})
public class UpdateFormServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("id");
            Question q = QuestionDAO.getQuestionById(id);
            ArrayList<Subject> list = SubjectDAO.getAllSubject();
            HttpSession s = request.getSession();
            if(q.getCorrect().equalsIgnoreCase(q.getA())){
                s.setAttribute("numbertrue", "1");
            }
            else if(q.getCorrect().equalsIgnoreCase(q.getB())){
                s.setAttribute("numbertrue", "2");
            }
            else if(q.getCorrect().equalsIgnoreCase(q.getC())){
                s.setAttribute("numbertrue", "3");
            }
            else{
                s.setAttribute("numbertrue", "4");
            }
            s.setAttribute("questionupdate", q);
            s.setAttribute("subjectupdate", list);
            request.getRequestDispatcher("updateform.jsp").forward(request, response);
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
