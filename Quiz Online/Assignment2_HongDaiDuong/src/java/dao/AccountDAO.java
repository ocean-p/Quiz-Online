/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.MyConnection;

/**
 *
 * @author DELL
 */
public class AccountDAO {
    public static Account getAccount(String email, String password) throws SQLException{
        Account a=null;
        Connection cn = MyConnection.makeConnection();
        if(cn!=null){
            String sql="select email, [name], [password], isAdmin, [status]\n" +
                        "from tblAccount\n" +
                        "where email = ? and [password] = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                a = new Account(rs.getString(1), rs.getString(2), rs.getString(3), 
                        rs.getInt(4), rs.getString(5));
            }
            cn.close();
        }
        return a;
    }
    public static Account getAccountById(String email) throws SQLException{
        Account a=null;
        Connection cn=MyConnection.makeConnection();
        if(cn!=null){
           String sql="select email, [name], [password], isAdmin, [status]\n" +
                        "from tblAccount\n" +
                        "where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                a = new Account(rs.getString(1), rs.getString(2), rs.getString(3), 
                        rs.getInt(4), rs.getString(5));
            }
            cn.close();
        }
        return a; 
        
    }
    public static int createAccount(Account a) throws SQLException{
        Connection cn=MyConnection.makeConnection();
        int result=0;
        if(cn!=null){
            String sql="insert into tblAccount(email, [name], [password], isAdmin, [status])\n" +
                        "values(?,?,?,?,?)";
            PreparedStatement pst=cn.prepareStatement(sql);
            pst.setString(1, a.getEmail());
            pst.setString(2, a.getName());
            pst.setString(3, a.getPassword());
            pst.setInt(4, a.getRole());
            pst.setString(5, a.getStatus());
            result=pst.executeUpdate();
            cn.close();
        }
        return result;
    }
}
