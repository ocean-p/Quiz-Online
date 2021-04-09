/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Subject;
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
public class SubjectDAO {
    public static ArrayList<Subject> getAllSubject() throws SQLException{
        ArrayList<Subject> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select subjectID, subjectCode, [description]\n" +
                        "from tblSubject";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new Subject(rs.getInt(1), rs.getString(2),rs.getString(3)));
            }
            cn.close();
        }
        return list;
    }
    public static Subject getSubjectById(String id) throws SQLException{
        Subject s = null;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select subjectID, subjectCode, [description]\n" +
                        "from tblSubject\n" +
                        "where subjectID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                s = new Subject(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
            cn.close();
        }
        return s;
    }
}
