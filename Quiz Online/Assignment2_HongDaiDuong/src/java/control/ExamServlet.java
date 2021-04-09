/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.QuestionDAO;
import dao.SubjectDAO;
import dto.Exam;
import dto.Question;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "ExamServlet", urlPatterns = {"/ExamServlet"})
public class ExamServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession s = request.getSession();
            if(s.getAttribute("exam") == null){
                String subject = request.getParameter("subject").trim();
                String subid = subject.split("-")[0];
                ArrayList<Question> q = QuestionDAO.getQuestionExam(subid);
                ArrayList<Exam> e = new ArrayList<>();
                for (Question question : q) {
                    e.add(new Exam(question, "xxx"));
                }
                s.setAttribute("exam", e);
                s.setAttribute("title", SubjectDAO.getSubjectById(subid));
                request.setAttribute("quiz", e.get(0));
                request.setAttribute("number", "1");
                s.setAttribute("subjectid", subid);
                //time start
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date dt = new Date();
                String date = df.format(dt);
                s.setAttribute("start", date);
            }
            else{
                ArrayList<Exam> e = (ArrayList<Exam>) s.getAttribute("exam");
                String index = request.getParameter("index");
                if(index == null){
                    index = "1";
                }
                else{
                    if(Integer.parseInt(index)<1 || Integer.parseInt(index)>10){
                        index = "1";
                    }
                }
                Exam ex = e.get(Integer.parseInt(index)-1);
                if(ex.getAnswer().equalsIgnoreCase("answer a")){
                    request.setAttribute("value", "1");
                }
                else if(ex.getAnswer().equalsIgnoreCase("answer b")){
                    request.setAttribute("value", "2");
                }
                else if(ex.getAnswer().equalsIgnoreCase("answer c")){
                    request.setAttribute("value", "3");
                }
                else if(ex.getAnswer().equalsIgnoreCase("answer d")){
                    request.setAttribute("value", "4");
                }
                else{
                    request.setAttribute("value", "0");
                }
                request.setAttribute("quiz", ex);
                request.setAttribute("number", index);
                String action = request.getParameter("action");
                if (action != null) {
                    if (action.equalsIgnoreCase("Take Exam")) {
                        String warning = "You are doing this quiz. Please finish and submit it before the new one.";
                        request.setAttribute("warning", warning);
                    }
                }
            }
            
            request.getRequestDispatcher("exam.jsp").forward(request, response);
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
