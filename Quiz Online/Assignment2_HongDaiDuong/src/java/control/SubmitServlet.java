/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.SubmitDAO;
import dao.SubmitDetailDAO;
import dto.Exam;
import dto.Submit;
import dto.SubmitDetail;
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
@WebServlet(name = "SubmitServlet", urlPatterns = {"/SubmitServlet"})
public class SubmitServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession s = request.getSession();
            if (s.getAttribute("exam") != null) {
                ArrayList<Exam> e = (ArrayList<Exam>) s.getAttribute("exam");
                float count = 0;
                for (Exam exam : e) {
                    if (exam.getAnswer().equalsIgnoreCase("answer a")) {
                        if (exam.getQ().getA().equalsIgnoreCase(exam.getQ().getCorrect())) {
                            count += 1;
                        }
                    } else if (exam.getAnswer().equalsIgnoreCase("answer b")) {
                        if (exam.getQ().getB().equalsIgnoreCase(exam.getQ().getCorrect())) {
                            count += 1;
                        }
                    } else if (exam.getAnswer().equalsIgnoreCase("answer c")) {
                        if (exam.getQ().getC().equalsIgnoreCase(exam.getQ().getCorrect())) {
                            count += 1;
                        }
                    } else if (exam.getAnswer().equalsIgnoreCase("answer d")) {
                        if (exam.getQ().getD().equalsIgnoreCase(exam.getQ().getCorrect())) {
                            count += 1;
                        }
                    }
                }
                int tmp = (int) count;
                //id submit
                int submitid = SubmitDAO.getSubmitId() + 1;
                //subject id
                String subjectid = (String) s.getAttribute("subjectid");
                //correct,point
                //time
                String start = (String) s.getAttribute("start");
                SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                Date dt = new Date();
                String end = df.format(dt);
                //email
                String email = (String) s.getAttribute("e");
                Submit sm = new Submit(submitid, Integer.parseInt(subjectid), tmp + "/10",
                        count, start, end, email);
                //add submit
                int res1 = SubmitDAO.insertSubmit(sm);
                int res2 = 0;
                for (Exam exam : e) {
                    if (exam.getAnswer().equalsIgnoreCase("answer a")) {
                        res2 = SubmitDetailDAO.insertDetail(new SubmitDetail(submitid,
                                exam.getQ().getId(), exam.getQ().getQuestion(), exam.getQ().getCorrect(),
                                exam.getQ().getA()));
                    } else if (exam.getAnswer().equalsIgnoreCase("answer b")) {
                        res2 = SubmitDetailDAO.insertDetail(new SubmitDetail(submitid,
                                exam.getQ().getId(), exam.getQ().getQuestion(), exam.getQ().getCorrect(),
                                exam.getQ().getB()));
                    } else if (exam.getAnswer().equalsIgnoreCase("answer c")) {
                        res2 = SubmitDetailDAO.insertDetail(new SubmitDetail(submitid,
                                exam.getQ().getId(), exam.getQ().getQuestion(), exam.getQ().getCorrect(),
                                exam.getQ().getC()));
                    } else if (exam.getAnswer().equalsIgnoreCase("answer d")) {
                        res2 = SubmitDetailDAO.insertDetail(new SubmitDetail(submitid,
                                exam.getQ().getId(), exam.getQ().getQuestion(), exam.getQ().getCorrect(),
                                exam.getQ().getD()));
                    } else {
                        res2 = SubmitDetailDAO.insertDetail(new SubmitDetail(submitid,
                                exam.getQ().getId(), exam.getQ().getQuestion(), exam.getQ().getCorrect(),
                                "No Answer"));
                    }
                }
                if (res1 > 0 && res2 > 0) {
                    s.removeAttribute("exam");
                    s.removeAttribute("subjectid");
                    s.removeAttribute("start");
                    s.removeAttribute("s1");
                    s.removeAttribute("s2");
                    s.removeAttribute("s3");
                    s.removeAttribute("s4");
                    s.removeAttribute("s5");
                    s.removeAttribute("s6");
                    s.removeAttribute("s7");
                    s.removeAttribute("s8");
                    s.removeAttribute("s9");
                    s.removeAttribute("s10");
                    request.setAttribute("success", "a");
                    request.getRequestDispatcher("HomeServlet").forward(request, response);
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
