/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AccountDAO;
import dao.QuestionDAO;
import dao.SubjectDAO;
import dto.Account;
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
@WebServlet(name = "HomeServlet", urlPatterns = {"/HomeServlet"})
public class HomeServlet extends HttpServlet {
    private final String HOME = "login.jsp";
    private final String STUDENT = "student.jsp";
    private final String ADMIN = "admin.jsp";
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String url = HOME;
            HttpSession s = request.getSession();
            if(s.getAttribute("e")!=null && s.getAttribute("p")!=null){
                String email = (String) s.getAttribute("e");
                String pass = (String) s.getAttribute("p");
                Account a = AccountDAO.getAccount(email, pass);
                if(a!=null){
                    if(a.getRole()==0){
                        url = STUDENT;
                        ArrayList<Subject> list = SubjectDAO.getAllSubject();
                        request.setAttribute("subject", list);
                    }
                    else{
                        url = ADMIN;
                        ArrayList<Subject> list = SubjectDAO.getAllSubject();
                        request.setAttribute("subject", list);
                        request.setAttribute("page", QuestionDAO.getNumberPage());
                        String index = request.getParameter("index");
                        if(index == null){
                            index = "1";
                        }
                        ArrayList<Question> q = QuestionDAO.getQuestionFirst(Integer.parseInt(index));
                        request.setAttribute("question", q);
                        request.setAttribute("number", index);
                    }
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
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
