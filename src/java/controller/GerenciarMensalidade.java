package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contrato;
import model.Mensalidade;
import model.MensalidadeDAO;
import model.ContratoDAO;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class GerenciarMensalidade extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         PrintWriter out = response.getWriter();
        String mensagem = "";
        int idcontrato = Integer.parseInt(request.getParameter("idcontrato"));
        int idmensalidade = Integer.parseInt(request.getParameter("idmensalidade"));
        String acao = request.getParameter("acao");

        try {
            Mensalidade m = new Mensalidade();
            MensalidadeDAO mDAO = new MensalidadeDAO();
           
            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    m = mDAO.getCarregaPorId(idmensalidade, idcontrato);
                    if (m.getIdmensalidade() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_mensalidade.jsp");
                        request.setAttribute("mensalidade", m);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Mensalidade não encontrada";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
            }

           if (acao.equals("cancelar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {

                    if (mDAO.cancelar(idmensalidade, idcontrato)) {
                        mensagem = "Cancelada com sucesso!";
                    } else {
                        mensagem = "Erro ao cancelar!";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
            } 
            
           
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar o comando";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_mensalidade.jsp?idcontrato="+idcontrato+"';");
        out.println("</script>");

    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String idmensalidade = request.getParameter("idmensalidade");
        String idcontrato = request.getParameter("idcontrato");
        String valorpago = request.getParameter("valorpago");
        String mensagem = "";
        
        try {
                Mensalidade m = new Mensalidade();
            
            
            Contrato c = new Contrato();
            
             if (!idmensalidade.isEmpty()) {
                m.setIdmensalidade(Integer.parseInt(idmensalidade));
            }
            
             double novovalorpago = 0;
            if (!valorpago.isEmpty()) {
                novovalorpago = Double.parseDouble(valorpago.replace(".", "").replace(",", "."));
            }  
            
             if (idcontrato.equals("") || valorpago.equals("") ) {
                mensagem = "Campos obrigatórios devem ser preecnhidos!";
            
             }else{
               
            c.setIdcontrato(Integer.parseInt(idcontrato));
            m.setValorpago(novovalorpago);
            m.setContrato(c);

        MensalidadeDAO mDAO = new MensalidadeDAO(); 
                 if (mDAO.alterar(m)) {
                    mensagem = "Gravado com sucesso";
                } else {
                    mensagem = "Erro ao gravar no banco";
                } 
            }
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar o comando";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_mensalidade.jsp?idcontrato="+idcontrato+"';");
        out.println("</script>");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
