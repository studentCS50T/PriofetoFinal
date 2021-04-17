/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class LocadorDAO extends DataBaseDAO{
    
    public LocadorDAO() throws Exception {}
    
    public ArrayList<Locador> getLista() throws Exception{
        
        ArrayList<Locador> lista = new ArrayList<Locador>();
        String sql = "SELECT lcd.* FROM locador lcd ";
               
                
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while(rs.next()){
            Locador lcd = new Locador();
            lcd.setIdlocador(rs.getInt("lcd.idlocador"));
            lcd.setNome(rs.getString("lcd.nome"));
            lcd.setRg(rs.getString("lcd.rg"));
            lcd.setCpf(rs.getString("lcd.cpf"));
            lcd.setTelefone(rs.getString("lcd.telefone"));
            lcd.setEndereco(rs.getString("lcd.endereco"));
            lcd.setStatus(rs.getInt("lcd.status"));
            
            // Usuario u = new Usuario();
            UsuarioDAO uDAO = new UsuarioDAO();
            
            lcd.setUsuario(uDAO.getCarregaPorId(rs.getInt("lcd.idusuario")));
           
            lista.add(lcd);
        }
        this.desconectar();
        return lista;
    }
    
    public boolean gravar(Locador lcd){
        
        try{
            String sql;
            this.conectar();
            if(lcd.getIdlocador()==0){
                sql = "INSERT INTO locador(nome, rg, cpf, telefone, endereco, status, idusuario) VALUES(?,?,?,?,?,?,?) ";
            }else{
                sql = "UPDATE locador SET nome=?, rg=?, cpf=?, telefone=?, endereco=?, status=?, idusuario=? WHERE idlocador=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, lcd.getNome());
            pstm.setString(2,lcd.getRg());
            pstm.setString(3,lcd.getCpf());
            pstm.setString(4,lcd.getTelefone());
            pstm.setString(5,lcd.getEndereco());
            pstm.setInt(6, lcd.getStatus());
            pstm.setInt(7, lcd.getUsuario().getIdusuario());
            if(lcd.getIdlocador()>0){
                pstm.setInt(8, lcd.getIdlocador());
            }
            pstm.execute();
            this.desconectar();
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
        
    }
    
    public boolean desativar(Locador lcd){
        try{
            this.conectar();
            String sql = "UPDATE locador SET status=2 WHERE idlocador=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1,lcd.getIdlocador());
            pstm.execute();
            this.desconectar();
            return true;
        
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public Locador getCarregaPorId(int idlocador) throws Exception{
        
       Locador lcd = new Locador();
        String sql = "SELECT lcd.*, u.idusuario FROM locador lcd "
                + "INNER JOIN usuario u ON "
                + "u.idusuario = lcd.idusuario WHERE lcd.idlocador=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idlocador);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            lcd.setIdlocador(rs.getInt("lcd.idlocador"));
            lcd.setNome(rs.getString("lcd.nome"));
            lcd.setRg(rs.getString("lcd.rg"));
            lcd.setCpf(rs.getString("lcd.cpf"));
            lcd.setTelefone(rs.getString("lcd.telefone"));
            lcd.setEndereco(rs.getString("lcd.endereco"));
            lcd.setStatus(rs.getInt("lcd.status"));
            
            Usuario u = new Usuario();
            u.setIdusuario(rs.getInt("lcd.idusuario"));
            u.setNome(rs.getString("lcd.nome"));
          
            lcd.setUsuario(u);
            
        }
        this.desconectar();
        return lcd;
    }
}

