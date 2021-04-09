/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dto.Exam;
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
@WebServlet(name = "SaveServlet", urlPatterns = {"/SaveServlet"})
public class SaveServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession s = request.getSession();
            ArrayList<Exam> e = (ArrayList<Exam>) s.getAttribute("exam");
            String answer = request.getParameter("answer").trim();
            String number = request.getParameter("number").trim();
            if(!answer.isEmpty()){
                switch (number) {
                    case "1":
                        s.setAttribute("s1", "1");
                        break;
                    case "2":
                        s.setAttribute("s2", "2");
                        break;
                    case "3":
                        s.setAttribute("s3", "3");
                        break;
                    case "4":
                        s.setAttribute("s4", "4");
                        break;
                    case "5":
                        s.setAttribute("s5", "5");
                        break;
                    case "6":
                        s.setAttribute("s6", "6");
                        break;
                    case "7":
                        s.setAttribute("s7", "7");
                        break;
                    case "8":
                        s.setAttribute("s8", "8");
                        break;
                    case "9":
                        s.setAttribute("s9", "9");
                        break;
                    case "10":
                        s.setAttribute("s10", "10");    
                    default:
                        break;
                }
            }
            if(answer.isEmpty()){
                switch (number) {
                    case "1":
                        s.removeAttribute("s1");
                        break;
                    case "2":
                        s.removeAttribute("s2");
                        break;
                    case "3":
                        s.removeAttribute("s3");
                        break;
                    case "4":
                        s.removeAttribute("s4");
                        break;
                    case "5":
                        s.removeAttribute("s5");
                        break;
                    case "6":
                        s.removeAttribute("s6");
                        break;
                    case "7":
                        s.removeAttribute("s7");
                        break;
                    case "8":
                        s.removeAttribute("s8");
                        break;
                    case "9":
                        s.removeAttribute("s9");
                        break;
                    case "10":
                        s.removeAttribute("s10");   
                    default:
                        break;
                }
            }
            int index = Integer.parseInt(number);
            e.get(index-1).setAnswer(answer);
            s.setAttribute("exam", e);
            if(index == 10){
                index = 0;
            }
            String url = "ExamServlet?index=" + (index+1);
            //request.setAttribute("index", number);
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
