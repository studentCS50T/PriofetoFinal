package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MensalidadeDAO extends DataBaseDAO {

    public MensalidadeDAO() throws Exception {
    }

    public Mensalidade getCarregaPorId(int idmensalidade, int idcontrato) throws Exception { //certo

        Mensalidade m = new Mensalidade();
        String sql = "SELECT * FROM mensalidade m WHERE m.idmensalidade =? AND m.idcontrato = ? ";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idmensalidade);
        pstm.setInt(2, idcontrato);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            m.setIdmensalidade(idmensalidade);
            ContratoDAO cDAO = new ContratoDAO();
            m.setContrato(cDAO.getCarregaPorId(idcontrato));

            m.setVencimento(rs.getDate("m.vencimento"));
            m.setValor(rs.getDouble("m.valor"));
            m.setValorpago(rs.getDouble("m.valorpago"));
            m.setStatus(rs.getInt("m.status"));
        }
        this.desconectar();
        return m;
    }

    public boolean alterar(Mensalidade m) throws Exception { //certo
        this.conectar();
        String sql = "UPDATE mensalidade SET valorpago=?,status=2 WHERE idmensalidade=? AND idcontrato=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1, m.getValorpago());
        pstm.setInt(2, m.getIdmensalidade());
        pstm.setInt(3, m.getContrato().getIdcontrato());
        pstm.execute();
        this.desconectar();
        return true;
    }

    public boolean cancelar (int idmensalidade, int idcontrato) throws Exception {
        this.conectar();
        String sql = "UPDATE mensalidade SET status=3 WHERE idmensalidade=? AND idcontrato=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idmensalidade);
        pstm.setInt(2, idcontrato);
        pstm.execute();
        this.desconectar();
        return true;

    }
}

