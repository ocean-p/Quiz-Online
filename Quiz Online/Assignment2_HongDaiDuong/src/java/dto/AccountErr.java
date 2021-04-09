/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class AccountErr implements Serializable{
    private String emailErr;
    private String nameErr;
    private String passErr;
    private String confirmErr;

    public AccountErr() {
    }

    public AccountErr(String emailErr, String nameErr, String passErr, String confirmErr) {
        this.emailErr = emailErr;
        this.nameErr = nameErr;
        this.passErr = passErr;
        this.confirmErr = confirmErr;
    }

    public String getEmailErr() {
        return emailErr;
    }

    public void setEmailErr(String emailErr) {
        this.emailErr = emailErr;
    }

    public String getNameErr() {
        return nameErr;
    }

    public void setNameErr(String nameErr) {
        this.nameErr = nameErr;
    }

    public String getPassErr() {
        return passErr;
    }

    public void setPassErr(String passErr) {
        this.passErr = passErr;
    }

    public String getConfirmErr() {
        return confirmErr;
    }

    public void setConfirmErr(String confirmErr) {
        this.confirmErr = confirmErr;
    }
    
}
