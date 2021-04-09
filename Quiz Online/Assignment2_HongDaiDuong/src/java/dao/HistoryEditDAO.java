/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.HistoryEdit;
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
public class HistoryEditDAO {
    public static int getHistoryId() throws SQLException{
        int result = 0;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select Max(id)\n" +
                        "from tblHistoryEdit";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                result = rs.getInt(1);
            }
            cn.close();
        }
        return result;
    }
    public static int insertHistory(HistoryEdit h) throws SQLException{
        int result = 0;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql = "insert into tblHistoryEdit(id,[time],questionID,question,activity,email)\n" +
                            "values(?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, h.getId());
            pst.setString(2, h.getTime());
            pst.setInt(3, h.getQid());
            pst.setString(4, h.getQ());
            pst.setString(5, h.getActivity());
            pst.setString(6, h.getEmail());
            result = pst.executeUpdate();
            cn.close();
        }
        return result;
    }

    public static int getNumberPage() throws SQLException{
        int result=0;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
            String sql = "select COUNT(id) from tblHistoryEdit";
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
    public static ArrayList<HistoryEdit> getHistory(int index) throws SQLException{
        ArrayList<HistoryEdit> list = new ArrayList<>();
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select id,[time],questionID,question,activity,email\n" +
                            "from tblHistoryEdit\n" +
                            "order by id desc\n" +
                            "offset ? rows\n" +
                            "fetch first 20 rows only";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, (index-1)*20);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                list.add(new HistoryEdit(rs.getInt(1), rs.getString(2), rs.getInt(3),
                                   rs.getString(4), rs.getString(5), rs.getString(6)));
            }
            cn.close();
        }
        return list;
    }
}
