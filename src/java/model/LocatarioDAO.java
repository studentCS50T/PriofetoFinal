
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

public class LocatarioDAO extends DataBaseDAO {
    
    public LocatarioDAO() throws Exception {}
    
    public ArrayList<Locatario> getLista() throws Exception{
        
        ArrayList<Locatario> lista = new ArrayList<Locatario>();
        String sql = "SELECT lct.* FROM locatario lct ";
               
                
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while(rs.next()){
            Locatario lct = new Locatario();
            lct.setIdlocatario(rs.getInt("lct.idlocatario"));
            lct.setNome(rs.getString("lct.nome"));
            lct.setRg(rs.getString("lct.rg"));
            lct.setCpf(rs.getString("lct.cpf"));
            lct.setTelefone(rs.getString("lct.telefone"));
            lct.setDatanasc(rs.getDate("lct.datanasc"));
            lct.setStatus(rs.getInt("lct.status"));
            
            // Usuario u = new Usuario();
            UsuarioDAO uDAO = new UsuarioDAO();
            
            lct.setUsuario(uDAO.getCarregaPorId(rs.getInt("lct.idusuario")));
           
            lista.add(lct);
        }
        this.desconectar();
        return lista;
    }
    
    public boolean gravar(Locatario lct){
        
        try{
            String sql;
            this.conectar();
            if(lct.getIdlocatario()==0){
                sql = "INSERT INTO locatario(nome, rg, cpf, datanasc, telefone, status, idusuario) VALUES(?,?,?,?,?,?,?) ";
            }else{
                sql = "UPDATE locatario SET nome=?, rg=?, cpf=?, datanasc=?, telefone=?, status=?, idusuario=? WHERE idlocatario=?";
            }
          
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, lct.getNome());
            pstm.setString(2,lct.getRg());
            pstm.setString(3,lct.getCpf());
            pstm.setDate(4,new Date(lct.getDatanasc().getTime()));
            pstm.setString(5, lct.getTelefone());
            pstm.setInt(6, lct.getStatus());
            pstm.setInt(7, lct.getUsuario().getIdusuario());
            if(lct.getIdlocatario()>0){
                pstm.setInt(8, lct.getIdlocatario());
            }
            pstm.execute();
            this.desconectar();
            return true;
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
        
    }
    
    public boolean desativar(Locatario lct){
        try{
            this.conectar();
            String sql = "UPDATE locatario SET status=2 WHERE idlocatario=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1,lct.getIdlocatario());
            pstm.execute();
            this.desconectar();
            return true;
        
        }catch(Exception e){
            System.out.println(e);
            return false;
        }
    }
    
    public Locatario getCarregaPorId(int idlocatario) throws Exception{
        
       Locatario lct = new Locatario();
        String sql = "SELECT lct.*, u.idusuario FROM locatario lct "
                + "INNER JOIN usuario u ON "
                + "u.idusuario = lct.idusuario WHERE lct.idlocatario=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,idlocatario);
        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            lct.setIdlocatario(rs.getInt("lct.idlocatario"));
            lct.setNome(rs.getString("lct.nome"));
            lct.setRg(rs.getString("lct.rg"));
            lct.setCpf(rs.getString("lct.cpf"));
            lct.setDatanasc(rs.getDate("lct.datanasc"));
            lct.setTelefone(rs.getString("lct.telefone"));
            lct.setStatus(rs.getInt("lct.status"));
            Usuario u = new Usuario();
            u.setIdusuario(rs.getInt("lct.idusuario"));
            u.setNome(rs.getString("lct.nome"));
          
            lct.setUsuario(u);
            
        }
        this.desconectar();
        return lct;
    }
}


