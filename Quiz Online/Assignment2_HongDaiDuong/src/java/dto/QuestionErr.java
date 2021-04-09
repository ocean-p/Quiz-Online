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
public class QuestionErr implements Serializable{
    private String contentErr;
    private String aErr;
    private String bErr;
    private String cErr;
    private String dErr;

    public QuestionErr() {
    }

    public QuestionErr(String contentErr, String aErr, String bErr, String cErr, String dErr) {
        this.contentErr = contentErr;
        this.aErr = aErr;
        this.bErr = bErr;
        this.cErr = cErr;
        this.dErr = dErr;
    }

    public String getContentErr() {
        return contentErr;
    }

    public void setContentErr(String contentErr) {
        this.contentErr = contentErr;
    }

    public String getaErr() {
        return aErr;
    }

    public void setaErr(String aErr) {
        this.aErr = aErr;
    }

    public String getbErr() {
        return bErr;
    }

    public void setbErr(String bErr) {
        this.bErr = bErr;
    }

    public String getcErr() {
        return cErr;
    }

    public void setcErr(String cErr) {
        this.cErr = cErr;
    }

    public String getdErr() {
        return dErr;
    }

    public void setdErr(String dErr) {
        this.dErr = dErr;
    }
    
}
