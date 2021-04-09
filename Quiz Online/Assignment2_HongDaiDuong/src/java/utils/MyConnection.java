/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author DELL
 */
public class MyConnection {

    //ham nay de lien ket voi sql server
    public static Connection makeConnection() {
        Connection cn = null;
        try {
            Context context = (Context) new InitialContext();
            Context end = (Context) context.lookup("java:comp/env");
            DataSource ds = (DataSource) end.lookup("DBCon");
            cn = ds.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;
    }
}
