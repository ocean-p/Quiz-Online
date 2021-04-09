/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.SubmitDetail;
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
public class SubmitDetailDAO {
    public static int insertDetail(SubmitDetail sd) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="insert into tblSubmitDetail(submitID,questionID,question,correctAnswer,studentAnswer)\n" +
                        "values(?,?,?,?,?)";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setInt(1, sd.getSubmitid());
            pst.setInt(2, sd.getQuestionid());
            pst.setString(3, sd.getContent());
            pst.setString(4, sd.getCorrect());
            pst.setString(5, sd.getChoose());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
    public static ArrayList<SubmitDetail> getDetailById(String id) throws SQLException{
        ArrayList<SubmitDetail> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select submitID,questionID,question,correctAnswer,studentAnswer\n" +
                        "from tblSubmitDetail\n" +
                        "where submitID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new SubmitDetail(rs.getInt(1), rs.getInt(2), rs.getString(3),
                                            rs.getString(4), rs.getString(5)));
            }
            cn.close();
        }
        return list;
    }
}
