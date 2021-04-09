/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.HistoryEditDAO;
import dao.QuestionDAO;
import dto.HistoryEdit;
import dto.Question;
import dto.QuestionErr;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            
            String content = request.getParameter("content").trim();
            String a = request.getParameter("aa").trim();
            String b = request.getParameter("ab").trim();
            String c = request.getParameter("ac").trim();
            String d = request.getParameter("ad").trim();
            
            
            boolean err = false;
            QuestionErr qe = new QuestionErr();
            
            if(content.isEmpty()){
                err = true;
                qe.setContentErr("Content not empty");
            }
            if(a.isEmpty()){
                err = true;
                qe.setaErr("Answer A not empty");
            }
            if(b.isEmpty()){
                err = true;
                qe.setbErr("Answer B not empty");
            }
            if(c.isEmpty()){
                err = true;
                qe.setcErr("Answer C not empty");
            }
            if(d.isEmpty()){
                err = true;
                qe.setdErr("Answer D not empty");
            }
            request.setAttribute("ERRORS", qe);
            String url = "updateform.jsp";
            if(err==false){
                String id = request.getParameter("id").trim();
                String tmp = request.getParameter("acorrect").trim();
                String sub = request.getParameter("subjectcbb").trim();
                String subid = sub.split("-")[0];
                String isdelete = request.getParameter("delete").trim();
                String time = request.getParameter("time").trim();
                String correct;
                if(tmp.equalsIgnoreCase("answer a")){
                    correct = a;
                }
                else if(tmp.equalsIgnoreCase("answer b")){
                    correct = b;
                }
                else if(tmp.equalsIgnoreCase("answer c")){
                    correct = c;
                }
                else{
                    correct = d;
                }
                Question q = new Question(Integer.parseInt(id), content, a, b, c, d, correct,
                                            time, Integer.parseInt(subid), Integer.parseInt(isdelete));
                int res1 = QuestionDAO.updateQuestion(q);
                //history edit
                //date
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date dt = new Date();
                String date = df.format(dt);
                //email
                HttpSession s = request.getSession();
                String email = (String) s.getAttribute("e");
                //id history
                int idhistory = HistoryEditDAO.getHistoryId()+1;
                HistoryEdit h = new HistoryEdit(idhistory, date, Integer.parseInt(id),
                                                content, "Update", email);
                int res2 = HistoryEditDAO.insertHistory(h);
                if(res1>0 && res2>0){
                    url = "HomeServlet";
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
