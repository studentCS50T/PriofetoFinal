/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Administrador
 */
public class ContratoDAO extends DataBaseDAO {

    public ContratoDAO() throws Exception {
    }

    public ArrayList<Contrato> getLista() throws Exception {

        ArrayList<Contrato> lista = new ArrayList<Contrato>();
        String sql = "SELECT c.*, i.endereco, lct.nome, lct.idusuario FROM contrato c "
                + "INNER JOIN imovel i ON c.idimovel = i.idimovel "
                + "INNER JOIN locatario lct ON c.idlocatario = lct.idlocatario ";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Contrato c = new Contrato();
            c.setIdcontrato(rs.getInt("c.idcontrato"));
            c.setTotal(rs.getDouble("c.total"));
            c.setQtdmensalidade(rs.getInt("c.qtdmensalidade"));
            c.setDatainicio(rs.getDate("c.datainicio"));
            c.setDatafim(rs.getDate("c.datafim"));
            c.setStatus(rs.getInt("c.status"));
            //c.setMensalidade(mensalidadeContrato(rs.getInt("idcontrato")));
            Imovel i = new Imovel();
            i.setIdimovel(rs.getInt("c.idimovel"));
            i.setEndereco(rs.getString("i.endereco"));
            c.setImovel(i);
            Locatario lct = new Locatario();
            lct.setIdlocatario(rs.getInt("c.idlocatario"));
            lct.setNome(rs.getString("lct.nome"));
            Usuario u = new Usuario();
            u.setIdusuario(rs.getInt("lct.idusuario"));
            lct.setUsuario(u);
            c.setLocatario(lct);
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }

    public boolean gravar(Contrato c) throws Exception {
        try {
            this.conectar();
            String sql = "INSERT INTO contrato (idimovel,idlocatario,idlocador,total,qtdmensalidade,datainicio,datafim,status) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, c.getImovel().getIdimovel());
            pstm.setInt(2, c.getLocatario().getIdlocatario());
            pstm.setInt(3, c.getLocador().getIdlocador());
            pstm.setDouble(4, c.getTotal());
            pstm.setInt(5, c.getQtdmensalidade());
            pstm.setDate(6, new java.sql.Date(c.getDatainicio().getTime()));
            pstm.setDate(7, new java.sql.Date(c.getDatafim().getTime()));
            pstm.setInt(8, c.getStatus());
            pstm.execute();
            ResultSet rs = pstm.getGeneratedKeys();
            if (rs.next()) {
                c.setIdcontrato(rs.getInt(1));
            }

            Calendar ca = Calendar.getInstance();
            ca.setTime(c.getDatainicio());

            for (int i = 0; i < c.getQtdmensalidade(); i++) {
                String sql_item = "INSERT INTO mensalidade (idmensalidade,idcontrato,vencimento,valor,valorpago,status) VALUES(?,?,?,?,?,?)";
                PreparedStatement pstm_item = conn.prepareStatement(sql_item);
                pstm_item.setInt(1, i + 1);
                pstm_item.setInt(2, c.getIdcontrato());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date d = ca.getTime();
                pstm_item.setDate(3, new java.sql.Date(d.getTime()));
                ca.add(Calendar.MONTH, 1);
                pstm_item.setDouble(4, c.getTotal() / c.getQtdmensalidade());
                pstm_item.setDouble(5, 0);
                pstm_item.setInt(6, 1);
                pstm_item.execute();
            }

            String sql_imovel = "UPDATE imovel SET status=2 WHERE idimovel=?";
            PreparedStatement pstm_imovel = conn.prepareStatement(sql_imovel);
            pstm_imovel.setInt(1, c.getImovel().getIdimovel());
            pstm_imovel.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean alterar(Contrato c) throws Exception {
        try {
            this.conectar();

           /* String teste = "SELECT * from mensalidade WHERE status=2 AND idcontrato=?";
            PreparedStatement test = conn.prepareStatement(teste);
            test.setInt(1, c.getIdcontrato());
            ResultSet rs = test.executeQuery();
            if (rs.next() == false) { */

                String sql = "UPDATE contrato SET idimovel=?,idlocatario=?,idlocador=?,total=?,qtdmensalidade=?"
                        + ",datainicio=?,datafim=?,status=? WHERE idcontrato=?";
                PreparedStatement pstm = conn.prepareStatement(sql);
                pstm.setInt(1, c.getImovel().getIdimovel());
                pstm.setInt(2, c.getLocatario().getIdlocatario());
                pstm.setInt(3, c.getLocador().getIdlocador());
                pstm.setDouble(4, c.getTotal());
                pstm.setInt(5, c.getQtdmensalidade());
                pstm.setDate(6, new java.sql.Date(c.getDatainicio().getTime()));
                pstm.setDate(7, new java.sql.Date(c.getDatafim().getTime()));
                pstm.setInt(8, c.getStatus());
                pstm.setInt(9, c.getIdcontrato());
                pstm.execute();

                Calendar ca = Calendar.getInstance();
                ca.setTime(c.getDatainicio());

                String excluir_men = "DELETE FROM mensalidade WHERE idcontrato=?";
                PreparedStatement mens = conn.prepareStatement(excluir_men);
                mens.setInt(1, c.getIdcontrato());
                mens.execute();

                for (int i = 0; i < c.getQtdmensalidade(); i++) {
                    String sql_item = "INSERT INTO mensalidade (idmensalidade,idcontrato,vencimento,valor,valorpago,status) VALUES(?,?,?,?,?,?)";
                    PreparedStatement pstm_item = conn.prepareStatement(sql_item);
                    pstm_item.setInt(1, i + 1);
                    pstm_item.setInt(2, c.getIdcontrato());
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Date d = ca.getTime();
                    pstm_item.setDate(3, new java.sql.Date(d.getTime()));
                    ca.add(Calendar.MONTH, 1);
                    pstm_item.setDouble(4, c.getTotal() / c.getQtdmensalidade());
                    pstm_item.setDouble(5, 0);
                    pstm_item.setInt(6, 1);
                    pstm_item.execute();
                }

                /* String sql_imovel = "UPDATE imovel SET status=2 WHERE idimovel=?";
                PreparedStatement pstm_imovel = conn.prepareStatement(sql_imovel);
                pstm_imovel.setInt(1, c.getImovel().getIdimovel());
                pstm_imovel.execute(); */

            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }

    }

    public boolean cancelar(Contrato c) {
        try {
            this.conectar();
            String sql = "UPDATE contrato SET status=2 WHERE idcontrato=? ";
            PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setInt(1, c.getIdcontrato());
            pstm.execute();


            //"UPDATE mensalidade m SET m.status=3 WHERE m.idcontrato=? AND m.status<>2";
            String sql_update = "UPDATE mensalidade SET status=3 WHERE idcontrato=? AND status<>2";
            PreparedStatement pstm1 = conn.prepareStatement(sql_update);
            pstm1.setInt(1, c.getIdcontrato());
            pstm1.execute();

            /* String sql_imovel = "UPDATE imovel SET status=1 WHERE idimovel=?";
            PreparedStatement pstm_imovel = conn.prepareStatement(sql_imovel);
            pstm_imovel.setInt(1, c.getImovel().getIdimovel());
            pstm_imovel.execute(); */

            this.desconectar();
            return true;


        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public Contrato getCarregaPorId(int idcontrato) throws Exception { //arrumar select

        Contrato c = new Contrato();
        String sql = "SELECT * FROM contrato c WHERE c.idcontrato = ?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idcontrato);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Imovel i = new Imovel();
            i.setIdimovel(rs.getInt("c.idimovel"));
            c.setImovel(i);

            Locatario lct = new Locatario();
            lct.setIdlocatario(rs.getInt("c.idlocatario"));
            c.setLocatario(lct);

            Locador lcd = new Locador();
            lcd.setIdlocador(rs.getInt("c.idlocador"));
            c.setLocador(lcd);

            c.setIdcontrato(rs.getInt("c.idcontrato"));
            c.setTotal(rs.getDouble("c.total"));
            c.setQtdmensalidade(rs.getInt("c.qtdmensalidade"));
            c.setDatainicio(rs.getDate("c.datainicio"));
            c.setDatafim(rs.getDate("c.datafim"));
            c.setStatus(rs.getInt("c.status"));

        }
        this.desconectar();
        return c;
    }

    public ArrayList<Mensalidade> mensalidadeContrato(int idcontrato) throws Exception {
        this.conectar();
        String sql = "SELECT * FROM mensalidade where idcontrato=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idcontrato);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Mensalidade> lista = new ArrayList<Mensalidade>();
        while (rs.next()) {
            Mensalidade m = new Mensalidade();
            m.setIdmensalidade(rs.getInt("idmensalidade"));
            Contrato c = new Contrato();
            c.setIdcontrato(rs.getInt("idcontrato"));
            m.setContrato(c);
            m.setVencimento(rs.getDate("vencimento"));
            m.setValor(rs.getDouble("valor"));
            m.setValorpago(rs.getDouble("valorpago"));
            m.setStatus(rs.getInt("status"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    /* Contrato c = new Contrato();
    m.setContrato(c.getCarregaPorID(rs.getInt("idcontrato"))); */

    public ArrayList<Contrato> getListaVisualizarContrato(int idcontrato) throws Exception {

        ArrayList<Contrato> lista = new ArrayList<Contrato>();
        String sql = "SELECT c.*, i.endereco, lct.nome, lct.rg, lct.cpf, lct.idusuario, lcd.nome, lcd.rg, lcd.cpf FROM contrato c "
                + "INNER JOIN imovel i ON c.idimovel = i.idimovel "
                + "INNER JOIN locatario lct ON c.idlocatario = lct.idlocatario "
                + "INNER JOIN locador lcd ON c.idlocador = lcd.idlocador WHERE idcontrato=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, idcontrato);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {
            Contrato c = new Contrato();
            c.setIdcontrato(rs.getInt("c.idcontrato"));
            c.setTotal(rs.getDouble("c.total"));
            c.setQtdmensalidade(rs.getInt("c.qtdmensalidade"));
            c.setDatainicio(rs.getDate("c.datainicio"));
            c.setDatafim(rs.getDate("c.datafim"));
            c.setStatus(rs.getInt("c.status"));
            //c.setMensalidade(mensalidadeContrato(rs.getInt("idcontrato")));
            Imovel i = new Imovel();
            i.setIdimovel(rs.getInt("c.idimovel"));
            i.setEndereco(rs.getString("i.endereco"));
            c.setImovel(i);

            Locatario lct = new Locatario();
            lct.setIdlocatario(rs.getInt("c.idlocatario"));
            lct.setNome(rs.getString("lct.nome"));
            lct.setRg(rs.getString("lct.rg"));
            lct.setCpf(rs.getString("lct.cpf"));
            Usuario u = new Usuario();
            u.setIdusuario(rs.getInt("lct.idusuario"));
            lct.setUsuario(u);
            c.setLocatario(lct);

            Locador lcd = new Locador();
            lcd.setIdlocador(rs.getInt("c.idlocador"));
            lcd.setNome(rs.getString("lcd.nome"));
            lcd.setRg(rs.getString("lcd.rg"));
            lcd.setCpf(rs.getString("lcd.cpf"));
            c.setLocador(lcd);
            lista.add(c);
        }
        this.desconectar();
        return lista;
    }

    public boolean gerarPdf(int idcontrato) throws Exception {
        ContratoDAO cDAO = new ContratoDAO();
        ArrayList<Contrato> con = new ArrayList<Contrato>();

        con = cDAO.getListaVisualizarContrato(idcontrato);

        Document doc = new Document();
        //String arquivoPdf = "contrato.pdf";


        try {


            for (Contrato c : con) {
                PdfWriter.getInstance(doc, new FileOutputStream("C:\\ContratosPDF/ Contrato_" + c.getLocatario().getNome() + ".pdf"));
                doc.open();

                Paragraph p = new Paragraph("Contrato de Locação");
                p.setAlignment(1);
                doc.add(p);

                //String total = NumberFormat.getCurrencyInstance().format(c.getTotal());
                String datainicio = new SimpleDateFormat("dd/MM/yyyy").format(c.getDatainicio());
                String datafim = new SimpleDateFormat("dd/MM/yyyy").format(c.getDatafim());

                Paragraph p1 = new Paragraph("Os signatários deste instrumento de locação");
                p.setAlignment(1);
                doc.add(p1);

                Paragraph p2 = new Paragraph("Locador: " + c.getLocador().getNome() + ", CPF: " + c.getLocador().getCpf()
                        + ", RG: " + c.getLocador().getRg() + " SSP/DF.");

                doc.add(p2);
                Paragraph p3 = new Paragraph("Locatário: " + c.getLocatario().getNome() + ", CPF: " + c.getLocatario().getCpf()
                        + ", RG: " + c.getLocatario().getRg() + " SSP/DF.");
                doc.add(p3);

                Paragraph p4 = new Paragraph("Do objeto finalidade de locação e localização do imóvel");
                p.setAlignment(1);
                doc.add(p4);
                Paragraph p5 = new Paragraph("O locador é legitimo proprietário do imóvel situado: " + c.getImovel().getEndereco() + ".");
                doc.add(p5);

                Paragraph p6 = new Paragraph("Loca-o neste ato para o locatário para fins residenciais. Não podendo ser mudada sua destinação "
                        + "sem o consentimento expresso do locador.");
                doc.add(p6);

                Paragraph p7 = new Paragraph("Do prazo e valores da locação");
                p.setAlignment(1);
                doc.add(p7);

                Paragraph p8 = new Paragraph("O prazo da locação é de " + c.getQtdmensalidade() + " meses, a começar do dia " + datainicio + " até o dia " + datafim + ".");
                doc.add(p8);

                Paragraph p9 = new Paragraph("O valor de aluguel é R$ " + c.getTotal() + " que o locatário se compromete a pagar pontualmente no mesmo dia do início do contrato"
                        + " durante todos os meses ao locador ou a seu procurador legalmente constituído.");
                doc.add(p9);

                Paragraph p10 = new Paragraph("Concordam as partes entre si, na assinatura deste contrato, que o locatário pagará o valor de 1 (um) "
                        + "aluguel adiantado. O qual deverá ser descontado no ultimo mês a ser pago, quando da entrega do imóvel.");
                doc.add(p10);

                Paragraph p11 = new Paragraph("O locador deverá emitir recibo a cada aluguel pago pelo locatário como comprovante de pagamento legal.");
                doc.add(p11);

                Paragraph p12 = new Paragraph("Atributos e demais encargos");
                p.setAlignment(1);
                doc.add(p12);

                Paragraph p13 = new Paragraph("Havendo reajuste do aluguel, o índice a ser cobrado será de acordo com o estipulado pelo governo ou "
                        + "combinado entre as partes e quando da renovação do contrato.");
                doc.add(p13);

                Paragraph p14 = new Paragraph("Em caso de atraso ao pagamento do aluguel, serão cobrados juros de 0,03% ao dia e multa de 3% ao mês.");
                doc.add(p14);

                Paragraph p15 = new Paragraph("O locatário não terá direito de retenção ou indenização a quaisquer benfeitorias ou construções de qualquer "
                        + "natureza, ainda que autorizadas ou mesmo necessárias obras no imóvel locado as quais incorporam "
                        + "imediatamente a este contrato a mesma não podendo ser retiradas ou desfeitas sem autorização por escrito "
                        + "do locador.");
                doc.add(p15);

                Paragraph p16 = new Paragraph("Dos direitos e obrigações gerais:");
                p.setAlignment(1);
                doc.add(p16);

                Paragraph p17 = new Paragraph("É expressamente proibido ao locatário, salvo prévio consentimento escritor do locador: ceder, vender o"
                        + " aluguel ou transferir direitos do presente contrato, emprestar ou sublocar total e parcialmente o imóvel.");
                doc.add(p17);
                Paragraph p18 = new Paragraph("Obriga-se ao locatário o pagamento do consumo de água, luz e telefone cabendo-lhe efetuar estes"
                        + " pagamentos nas devidas épocas.");
                doc.add(p18);
                Paragraph p19 = new Paragraph("O locatário salvo as obras que importem na segurança do imóvel obriga-se por todas as outras. Devendo"
                        + " trazer o imóvel em boas condições de higiene, limpeza com os aparelhos sanitários e de iluminação,"
                        + " pinturas, telhados, vidraças, mármores, fechos, torneiras, pias, banheiros, ralos e demais acessórios em"
                        + " perfeito estado de conservação e funcionamento para assim restitui-los quando findo ou rescindido este"
                        + " contrato.");
                doc.add(p19);
                Paragraph p20 = new Paragraph("Fica o locatário obrigado ao término deste contrato a entregar o imóvel pintado conforme recebido.");
                doc.add(p20);
                Paragraph p21 = new Paragraph("É proibido animais de qualquer espécie dentro do imóvel, assim como também usar aparelhos sonoros em"
                        + " alto volume");
                doc.add(p21);
                Paragraph p22 = new Paragraph("No caso de desapropriação do imóvel locado, ficará o locador desobrigado por todas as cláusulas deste"
                        + " contrato, ressalvada ao locatário tão somente a faculdade de haver o poder desapropriante, a indenização a"
                        + " que por ventura tiver direito.");
                doc.add(p22);

                Paragraph p23 = new Paragraph("Na rescisão do contrato antes da data estipulada, manifestada por uma das partes, a parte desistente"
                        + " obriga-se a efetuar o pagamento no valor equivalente a UM aluguel vigente.");
                doc.add(p23);
                Paragraph p24 = new Paragraph("E por assim terem contratado, assinam o presente em 02 (duas) vias, a seguir dão cumprimento às exigências e formalidades legais.");
                doc.add(p24);
                Paragraph espaco = new Paragraph("                      ");
                doc.add(espaco);
                Paragraph p25 = new Paragraph("Brasília, " + datainicio + ".");
                doc.add(p25);
                Paragraph espaco1 = new Paragraph("                      ");
                doc.add(espaco1);
                Paragraph p26 = new Paragraph("_____________________________________________");
                p.setAlignment(1);
                doc.add(p26);
                Paragraph p27 = new Paragraph("Locador: " + c.getLocador().getNome());
                p.setAlignment(1);
                doc.add(p27);
                Paragraph p28 = new Paragraph("CPF: " + c.getLocador().getCpf());
                p.setAlignment(1);
                doc.add(p28);
                Paragraph p29 = new Paragraph("RG: " + c.getLocador().getRg());
                p.setAlignment(1);
                doc.add(p29);

                Paragraph espaco2 = new Paragraph("                      ");
                doc.add(espaco2);

                Paragraph p30 = new Paragraph("_____________________________________________");
                doc.add(p30);
                Paragraph p31 = new Paragraph("Locatário: " + c.getLocatario().getNome());
                doc.add(p31);

                Paragraph p32 = new Paragraph("CPF: " + c.getLocatario().getCpf());
                doc.add(p32);
                Paragraph p33 = new Paragraph("RG: " + c.getLocatario().getRg());
                doc.add(p33);



            }

            doc.close();
            //Desktop.getDesktop().open(new File(arquivoPdf));
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
