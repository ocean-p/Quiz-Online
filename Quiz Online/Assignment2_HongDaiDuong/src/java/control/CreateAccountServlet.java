/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AccountDAO;
import dto.Account;
import dto.AccountErr;
import encrypted.EncryptPassword;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CreateAccountServlet", urlPatterns = {"/CreateAccountServlet"})
public class CreateAccountServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String email = request.getParameter("txtemail").trim();
            String name = request.getParameter("txtname").trim();
            String password = request.getParameter("txtpass").trim();
            String confirm = request.getParameter("txtconfirm").trim();
            
            boolean err = false;
            AccountErr aErr = new AccountErr();
            if(email.length()<1){
                err = true;
                aErr.setEmailErr("Email is not empty");
            }
            else if(!email.matches("^[a-zA-Z][a-zA-Z0-9_]+@[a-zA-Z]+(\\.[a-zA-Z]+){1,3}$")){
                err = true;
                aErr.setEmailErr("Email must be correct fomart");
            }
            else if(email.length()>50){
                err = true;
                aErr.setEmailErr("Email's max length is 50");
            }
            else if(AccountDAO.getAccountById(email) != null){
                err = true;
                aErr.setEmailErr("This email existed");
            }
            ///
            if(name.length()<5 || name.length()>50){
                err = true;
                aErr.setNameErr("Name's length is 5 betwen 50");
            }
            ///
            if(password.length()<6){
                err = true;
                aErr.setPassErr("Password's length must >= 6");
            }
            else if(!password.matches("^[a-zA-Z0-9]+$")){
                err = true;
                aErr.setPassErr("Password must be letters or numbers");
            }
            else if(!confirm.equals(password)){
                err = true;
                aErr.setConfirmErr("Confirm does not match");
            }
            
            request.setAttribute("ERRORS", aErr);
            String url = "createform.jsp";
            if(err == false){
                //String a = EncryptPassword.getSHA(password);
                Account a = new Account(email, name, EncryptPassword.toHexString(EncryptPassword.getSHA(password)), 
                        0, "new");
                int res = AccountDAO.createAccount(a);
                if(res > 0){
                    url = "login.jsp";
                    request.setAttribute("message", "Create account successfully");
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
