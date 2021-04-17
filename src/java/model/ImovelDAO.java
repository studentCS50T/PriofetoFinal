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
public class ImovelDAO extends DataBaseDAO {

    public ImovelDAO() throws Exception {
    }

    public ArrayList<Imovel> getLista() throws Exception {

        ArrayList<Imovel> lista = new ArrayList<Imovel>();
        String sql = "SELECT i.*, t.nome FROM imovel i "
                + "INNER JOIN tipo t ON "
                + "t.idtipo = i.idtipo ";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Imovel i = new Imovel();
            i.setIdimovel(rs.getInt("i.idimovel"));
            i.setEndereco(rs.getString("i.endereco"));
            i.setQtdcomodo(rs.getInt("i.qtdcomodo"));
            i.setGaragem(rs.getInt("i.garagem"));
            i.setArea(rs.getString("i.area"));
            i.setStatus(rs.getInt("i.status"));
            Tipo t = new Tipo();
            t.setIdtipo(rs.getInt("i.idtipo"));
            t.setNome(rs.getString("t.nome"));
            i.setTipo(t);
            lista.add(i);
        }
        this.desconectar();
        return lista;
    }

    public boolean gravar(Imovel i) {

        try {
            String sql;
            this.conectar();
            if (i.getIdimovel() == 0) {
                sql = "INSERT INTO imovel(endereco, qtdcomodo, garagem, area, status, idtipo) VALUES(?,?,?,?,?,?) ";
            } else {
                sql = "UPDATE imovel SET endereco=?, qtdcomodo=?, garagem=?, area=?, status=?, idtipo=? WHERE idimovel=?";
            }
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, i.getEndereco());
            pstm.setInt(2, i.getQtdcomodo());
            pstm.setInt(3, i.getGaragem());
            pstm.setString(4, i.getArea());
            pstm.setInt(5, i.getStatus());
            pstm.setInt(6, i.getTipo().getIdtipo());
            if (i.getIdimovel() > 0) {
                pstm.setInt(7, i.getIdimovel());
            }
            pstm.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }

    public boolean desativar(Imovel i) {
        try {
            this.conectar();
            String sql = "UPDATE imovel SET status=3 WHERE idimovel=?";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, i.getIdimovel());
            pstm.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

     public Imovel getCarregaPorId(int idimovel) throws Exception {

        Imovel i = new Imovel();
        String sql = "SELECT i.*, t.nome FROM imovel i "
                + "INNER JOIN tipo t ON "
                + "t.idtipo = i.idtipo WHERE i.idimovel=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idimovel);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            i.setIdimovel(rs.getInt("i.idimovel"));
            i.setEndereco(rs.getString("i.endereco"));
            i.setQtdcomodo(rs.getInt("i.qtdcomodo"));
            i.setGaragem(rs.getInt("i.garagem"));
            i.setArea(rs.getString("i.area"));
            i.setStatus(rs.getInt("i.status"));
            Tipo t = new Tipo();
            t.setIdtipo(rs.getInt("i.idtipo"));
            t.setNome(rs.getString("t.nome"));
            i.setTipo(t);

        }
        this.desconectar();
        return i;
    }

    /** public Imovel getRecuperarImovel(int idimovel) {

        Imovel i = new Imovel();
        String sql = "SELECT u.* FROM usuario u "
                + " WHERE u.login=? AND u.status=1";  // CORRIGIR
        try {
            this.conectar();
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idimovel);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                i.setIdimovel(rs.getInt("i.idimovel"));
                i.setEndereco(rs.getString("i.endereco"));
                i.setQtdcomodo(rs.getInt("i.qtdcomodo"));
                i.setGaragem(rs.getInt("i.garagem"));
                i.setArea(rs.getString("i.area"));
                i.setStatus(rs.getInt("i.status"));
                
                TipoDAO tDAO = new TipoDAO();
                i.setTipo(tDAO.getCarregaPorId(rs.getInt("i.idtipo")));

            }
            this.desconectar();
            return i;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        } */
    } 
