/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.MyConnection;

/**
 *
 * @author DELL
 */
public class QuestionDAO {
    public static int getNumberPage() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id) from tblQuestion\n" +
                            "where isDelete = 0";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/20;
                if(rs.getInt(1) % 20 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Question> getQuestionFirst(int index) throws SQLException{
        ArrayList<Question> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,question,keyA,keyB,keyC,keyD,correct,createDate,subjectID,isDelete\n" +
                        "from tblQuestion\n" +
                        "where isDelete =0\n" +
                        "order by id desc\n" +
                        "offset ? rows\n" +
                        "fetch first 20 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, (index-1)*20);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), 
                                        rs.getString(4), rs.getString(5), rs.getString(6), 
                                        rs.getString(7), rs.getString(8), rs.getInt(9), 
                                        rs.getInt(10)));
            }
            cn.close();
        }
        return list;
    }
    public static int getNumberPage2(String id) throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id) from tblQuestion\n" +
                            "where isDelete = 0\n" +
                            "and subjectID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/20;
                if(rs.getInt(1) % 20 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Question> getQuestionBySub(int index, String id) throws SQLException{
        ArrayList<Question> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,question,keyA,keyB,keyC,keyD,correct,createDate,subjectID,isDelete\n" +
                        "from tblQuestion\n" +
                        "where isDelete = 0 and subjectID = ? \n" +
                        "order by id desc\n" +
                        "offset ? rows\n" +
                        "fetch first 20 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            pst.setInt(2, (index-1)*20);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), 
                                        rs.getString(4), rs.getString(5), rs.getString(6), 
                                        rs.getString(7), rs.getString(8), rs.getInt(9), 
                                        rs.getInt(10)));
            }
            cn.close();
        }
        return list;
    }
    public static int getNumberPage3(String value) throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id) from tblQuestion\n" +
                            "where isDelete = 0\n" +
                            "and question like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/20;
                if(rs.getInt(1) % 20 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Question> getQuestionBySearch(int index, String value) throws SQLException{
        ArrayList<Question> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,question,keyA,keyB,keyC,keyD,correct,createDate,subjectID,isDelete\n" +
                        "from tblQuestion\n" +
                        "where isDelete = 0 and question like ? \n" +
                        "order by id desc\n" +
                        "offset ? rows\n" +
                        "fetch first 20 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            pst.setInt(2, (index-1)*20);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), 
                                        rs.getString(4), rs.getString(5), rs.getString(6), 
                                        rs.getString(7), rs.getString(8), rs.getInt(9), 
                                        rs.getInt(10)));
            }
            cn.close();
        }
        return list;
    }
    public static int updateQuestionStatus(String a, String id) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="update tblQuestion\n" +
                        "set isDelete = ?\n" +
                        "where id = ?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1,a);
            pst.setString(2,id);
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static Question getQuestionById(String id) throws SQLException{
        Question q = null;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select id,question,keyA,keyB,keyC,keyD,correct,createDate,subjectID,isDelete\n" +
                        "from tblQuestion\n" +
                        "where id = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                q = new Question(rs.getInt(1), rs.getString(2), rs.getString(3), 
                                rs.getString(4), rs.getString(5), rs.getString(6), 
                                rs.getString(7), rs.getString(8), rs.getInt(9), 
                                rs.getInt(10));
            }
            cn.close();
        }
        return q;
    }
    public static int updateQuestion(Question q) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="update tblQuestion\n" +
                        "set question = ?, keyA = ?, keyB = ?,\n" +
                        "	keyC = ?, keyD = ?, correct = ?, subjectID = ?\n" +
                        "where id = ?";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1,q.getQuestion());
            pst.setString(2,q.getA());
            pst.setString(3,q.getB());
            pst.setString(4,q.getC());
            pst.setString(5,q.getD());
            pst.setString(6,q.getCorrect());
            pst.setInt(7,q.getSid());
            pst.setInt(8,q.getId());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static int getIdQuestion() throws SQLException{
        int result = 0;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select Max(id) \n" +
                          "from tblQuestion";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1);
            }
            cn.close();
        }
        return result;
    }
    public static int addQuestion(Question q) throws SQLException{
        int result = 0;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql = "insert into tblQuestion(id,question,keyA,keyB,keyC,keyD,"
                            + "correct,createDate,subjectID,isDelete)\n" +
                            "values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, q.getId());
            pst.setString(2, q.getQuestion());
            pst.setString(3, q.getA());
            pst.setString(4, q.getB());
            pst.setString(5, q.getC());
            pst.setString(6, q.getD());
            pst.setString(7, q.getCorrect());
            pst.setString(8, q.getCreatetime());
            pst.setInt(9, q.getSid());
            pst.setInt(10, q.getIsdelete());
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    //recycle bin
    public static int getNumberPage4() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id) from tblQuestion\n" +
                            "where isDelete = 1";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/20;
                if(rs.getInt(1) % 20 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Question> getQuestionInBin(int index) throws SQLException{
        ArrayList<Question> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,question,keyA,keyB,keyC,keyD,correct,createDate,subjectID,isDelete\n" +
                        "from tblQuestion\n" +
                        "where isDelete =1\n" +
                        "order by id desc\n" +
                        "offset ? rows\n" +
                        "fetch first 20 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, (index-1)*20);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), 
                                        rs.getString(4), rs.getString(5), rs.getString(6), 
                                        rs.getString(7), rs.getString(8), rs.getInt(9), 
                                        rs.getInt(10)));
            }
            cn.close();
        }
        return list;
    }
    public static int getNumberPage5(String value) throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id) from tblQuestion\n" +
                            "where isDelete = 1\n" +
                            "and question like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/20;
                if(rs.getInt(1) % 20 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Question> getQuestionInBinBySearch(int index, String value) throws SQLException{
        ArrayList<Question> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,question,keyA,keyB,keyC,keyD,correct,createDate,subjectID,isDelete\n" +
                        "from tblQuestion\n" +
                        "where isDelete = 1 and question like ? \n" +
                        "order by id desc\n" +
                        "offset ? rows\n" +
                        "fetch first 20 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%"+value+"%");
            pst.setInt(2, (index-1)*20);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), 
                                        rs.getString(4), rs.getString(5), rs.getString(6), 
                                        rs.getString(7), rs.getString(8), rs.getInt(9), 
                                        rs.getInt(10)));
            }
            cn.close();
        }
        return list;
    }
    public static ArrayList<Question> getQuestionExam(String id) throws SQLException{
        ArrayList<Question> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select TOP 10 id,question,keyA,keyB,keyC,keyD,correct,createDate,subjectID,isDelete\n" +
                        "from tblQuestion\n" +
                        "where subjectID = ? and isDelete = 0\n" +
                        "order by NEWID()";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), 
                                        rs.getString(4), rs.getString(5), rs.getString(6), 
                                        rs.getString(7), rs.getString(8), rs.getInt(9), 
                                        rs.getInt(10)));
            }
            cn.close();
        }
        return list;
    }
}
