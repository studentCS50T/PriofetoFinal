/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Administrador
 */
public class DataBaseDAO {
    
    public final String URL = "jdbc:mysql://localhost:3306/pedroalugueis";
    public final String USER="root";
    public final String SENHA ="";
    
    public Connection conn;
    
    public DataBaseDAO() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
    }
    
    public void conectar() throws Exception{
        conn = DriverManager.getConnection(URL, USER, SENHA);
    }
    
    public void desconectar() throws Exception{
        conn.close();
    }
}
