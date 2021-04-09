/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Submit;
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
public class SubmitDAO {
    public static int getSubmitId() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select MAX(id)\n" +
                            "from tblSubmit";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1);
            }
            cn.close();
        }
        return result;
    }
    public static int insertSubmit(Submit s) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="insert into tblSubmit(id,subjectID,correct,point,startTime,endTime,email)\n" +
                            "values(?,?,?,?,?,?,?)";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, s.getId());
            pst.setInt(2, s.getSubjectid());
            pst.setString(3, s.getCorrect());
            pst.setFloat(4, s.getPoint());
            pst.setString(5, s.getStart());
            pst.setString(6, s.getEnd());
            pst.setString(7, s.getEmail());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static int getNumberPage(String email) throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id)\n" +
                        "from tblSubmit\n" +
                        "where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/5;
                if(rs.getInt(1) % 5 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Submit> getSubmitByEmail(String email, int index) throws SQLException{
        ArrayList<Submit> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,subjectID,correct,point,startTime,endTime,email\n" +
                        "from tblSubmit\n" +
                        "where email = ?\n" +
                        "order by id desc\n" +
                        "offset ? rows\n" +
                        "fetch first 5 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setInt(2, (index-1)*5);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Submit(rs.getInt(1), rs.getInt(2), rs.getString(3), 
                            rs.getFloat(4), rs.getString(5),rs.getString(6), rs.getString(7)));
            }
            cn.close();
        }
        return list;
    }
    public static int getNumberPage2(String email, String id) throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id)\n" +
                        "from tblSubmit\n" +
                        "where email = ? and subjectID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1)/5;
                if(rs.getInt(1) % 5 != 0){
                    result++;
                }
            }
            cn.close();
        }
        return result;
    }
    public static ArrayList<Submit> getSubmitBySubject(String email, String id, int index) throws SQLException{
        ArrayList<Submit> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,subjectID,correct,point,startTime,endTime,email\n" +
                        "from tblSubmit\n" +
                        "where email = ? and subjectID = ?\n" +
                        "order by id desc\n" +
                        "offset ? rows\n" +
                        "fetch first 5 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, id);
            pst.setInt(3, (index-1)*5);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Submit(rs.getInt(1), rs.getInt(2), rs.getString(3), 
                            rs.getFloat(4), rs.getString(5),rs.getString(6), rs.getString(7)));
            }
            cn.close();
        }
        return list;
    }
    public static Submit getSubmitById(String id) throws SQLException{
        Submit s = null;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select id,subjectID,correct,point,startTime,endTime,email\n" +
                            "from tblSubmit\n" +
                            "where id = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                s = new Submit(rs.getInt(1), rs.getInt(2), rs.getString(3), 
                        rs.getFloat(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
            cn.close();
        }
        return s;
    } 
}
