package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contrato;
import model.ContratoDAO;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpSession;
import model.Imovel;
import model.ImovelDAO;
import model.Locador;
import model.Locatario;
import model.Mensalidade;

public class GerenciarContrato extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String mensagem = "";
        int idcontrato = Integer.parseInt(request.getParameter("idcontrato"));
        String acao = request.getParameter("acao");
        
        try {
            Contrato c = new Contrato();
            ContratoDAO cDAO = new ContratoDAO();
            Mensalidade m = new Mensalidade();
            
            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    c = cDAO.getCarregaPorId(idcontrato);
                    if (c.getIdcontrato() > 0) {
                        RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_contrato.jsp");
                        request.setAttribute("contrato", c);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Contrato não encontrado!";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
            }
            
            if (acao.equals("cancelar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    c.setIdcontrato(idcontrato);
                    if (cDAO.cancelar(c)) {
                        mensagem = "Cancelado com sucesso!";
                    } else {
                        mensagem = "Erro ao cancelar!";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
                
            }
            
            if (acao.equals("gerarpdf")) {
                
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    c.setIdcontrato(idcontrato);
                    if (cDAO.gerarPdf(idcontrato)) {
                        mensagem = "PDF gerado com sucesso!";
                    } else {
                        mensagem = "Erro ao gerar o PDF!";
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
        out.println("location.href='listar_contrato.jsp';");
        out.println("</script>");
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        String idcontrato = request.getParameter("idcontrato");
        String idimovel = request.getParameter("idimovel");
        String idlocatario = request.getParameter("idlocatario");
        String idlocador = request.getParameter("idlocador");
        String total = request.getParameter("total");
        String qtdmensalidade = request.getParameter("qtdmensalidade");
        String datainicio = request.getParameter("datainicio");
        String datafim = request.getParameter("datafim");
        String status = request.getParameter("status");
        
        String mensagem = "";
        
        try {
            
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            
            Mensalidade m = new Mensalidade();
            Contrato c = new Contrato();
            if (!idcontrato.isEmpty()) {
                c.setIdcontrato(Integer.parseInt(idcontrato));
            }
            
            double novototal = 0;
            if (!total.isEmpty()) {
                novototal = Double.parseDouble(total.replace(".", "").replace(",", "."));
                
            }
            if (idimovel.equals("") || idlocatario.equals("") || idlocador.equals("") || qtdmensalidade.equals("")
                    || datainicio.equals("") || datafim.equals("") || status.equals("")) {
                mensagem = "Campos obrigatórios devem ser preecnhidos!";
            } else {
                
                Imovel i = new Imovel();
                i.setIdimovel(Integer.parseInt(idimovel));
                c.setImovel(i);
                
                Locatario lct = new Locatario();
                lct.setIdlocatario(Integer.parseInt(idlocatario));
                c.setLocatario(lct);
                
                Locador lcd = new Locador();
                lcd.setIdlocador(Integer.parseInt(idlocador));
                c.setLocador(lcd);
                
                c.setTotal(novototal);
                /* c.setTotal(Double.parseDouble(total)); */
                
                c.setQtdmensalidade(Integer.parseInt(qtdmensalidade));
                c.setDatainicio(df.parse(datainicio));
                c.setDatafim(df.parse(datafim));
                c.setStatus(Integer.parseInt(status));
                
                
                if (c.getIdcontrato() == 0) {
                    ContratoDAO cDAO = new ContratoDAO();
                    if (cDAO.gravar(c)) {
                        mensagem = "Gravado com sucesso!";
                    } else {
                        mensagem = "Erro ao gravar!";
                    }
                } else {
                    ContratoDAO cDAO = new ContratoDAO();
                    if (cDAO.alterar(c)) {
                        mensagem = "Alterado com sucesso!";
                    } else {
                        mensagem = "Erro ao alterar!";
                    }
                }
            }
            
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar o comando";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_contrato.jsp';");
        out.println("</script>");
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
