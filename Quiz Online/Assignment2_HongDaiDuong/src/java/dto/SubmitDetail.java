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
public class SubmitDetail implements Serializable{
    private int submitid;
    private int questionid;
    private String content;
    private String correct;
    private String choose;

    public SubmitDetail() {
    }

    public SubmitDetail(int submitid, int questionid, String content, String correct, String choose) {
        this.submitid = submitid;
        this.questionid = questionid;
        this.content = content;
        this.correct = correct;
        this.choose = choose;
    }

    public int getSubmitid() {
        return submitid;
    }

    public void setSubmitid(int submitid) {
        this.submitid = submitid;
    }

    public int getQuestionid() {
        return questionid;
    }

    public void setQuestionid(int questionid) {
        this.questionid = questionid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCorrect() {
        return correct;
    }

    public void setCorrect(String correct) {
        this.correct = correct;
    }

    public String getChoose() {
        return choose;
    }

    public void setChoose(String choose) {
        this.choose = choose;
    }
    
}
