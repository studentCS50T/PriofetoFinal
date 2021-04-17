/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class TipoDAO extends DataBaseDAO{

    public TipoDAO() throws Exception {
    }
    
    public ArrayList<Tipo> getLista() throws Exception{
        
        ArrayList<Tipo> lista = new ArrayList<Tipo>();
        String sql = "SELECT * FROM tipo";
        this.conectar();
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        while(rs.next()){
            Tipo t = new Tipo();
            t.setIdtipo(rs.getInt("idtipo"));
            t.setNome(rs.getString("nome"));
            lista.add(t);
        }
        this.desconectar();
        return lista;
    }
    
    
    
    
    public boolean gravar(Tipo t){
        
        try{
            String sql;
            this.conectar();
            if(t.getIdtipo()==0){
                sql = "INSERT INTO tipo(nome) VALUES(?) ";
            }else{
                sql = "UPDATE tipo SET nome=? WHERE idtipo=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, t.getNome());
            if(t.getIdtipo()>0){
                pstm.setInt(2, t.getIdtipo());
            }
            pstm.execute();
            this.desconectar();
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
        
    }
    
    public Tipo getCarregaPorId(int idtipo) throws Exception{
    
        Tipo t = new Tipo();
        String sql = "SELECT * FROM tipo WHERE idtipo=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idtipo);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            t.setIdtipo(rs.getInt("idtipo"));
            t.setNome(rs.getString("nome"));
        }
        this.desconectar();
        return t;
    }
    
    public boolean excluir(Tipo t){
        try{
            this.conectar();
            String sql = "DELETE FROM tipo WHERE idtipo=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1,t.getIdtipo());
            pstm.execute();
            this.desconectar();
            return true;
        
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
}
