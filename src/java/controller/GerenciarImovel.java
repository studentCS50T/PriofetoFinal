/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Tipo;
import model.Imovel;
import model.ImovelDAO;

/**
 *
 * @author Administrador
 */
public class GerenciarImovel extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String mensagem = "";

        int idImovel = Integer.parseInt(request.getParameter("idimovel"));
        String acao = request.getParameter("acao");

        try {
            Imovel i = new Imovel();
            ImovelDAO iDAO = new ImovelDAO();
            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    i = iDAO.getCarregaPorId(idImovel);
                    if (i.getIdimovel() > 0) {
                        RequestDispatcher disp =
                                getServletContext().getRequestDispatcher("/form_imovel.jsp");
                        request.setAttribute("imovel", i);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Imóvel não encontrado!";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
            }
            if (acao.equals("desativar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    i.setIdimovel(idImovel);
                    if (iDAO.desativar(i)) {
                        mensagem = "Desativado com sucesso!";
                    } else {
                        mensagem = "Erro ao desativar!";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
            }

        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar!";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_imovel.jsp';");
        out.println("</script>");


    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String idImovel = request.getParameter("idimovel");
        String endereco = request.getParameter("endereco");
        String qtdcomodo = request.getParameter("qtdcomodo");
        String garagem = request.getParameter("garagem");
        String area = request.getParameter("area");
        String status = request.getParameter("status");
        String idtipo = request.getParameter("idtipo");

        String mensagem = "";

        Imovel i = new Imovel();
        if (!idImovel.isEmpty()) {
            i.setIdimovel(Integer.parseInt(idImovel));
        }

        try {
            if (endereco.equals("") || qtdcomodo.equals("") || garagem.equals("") || area.equals("") || status.equals("") || idtipo.equals("")) {
                mensagem = "Campos obrigatórios devem ser preecnhidos!";
            } else {
                i.setEndereco(endereco);
                i.setQtdcomodo(Integer.parseInt(qtdcomodo));
                i.setGaragem(Integer.parseInt(garagem));
                i.setArea(area);
                i.setStatus(Integer.parseInt(status));
                Tipo t = new Tipo();
                t.setIdtipo(Integer.parseInt(idtipo));
                i.setTipo(t);
                ImovelDAO iDAO = new ImovelDAO();
                if (iDAO.gravar(i)) {
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar!";
                }
            }

        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_imovel.jsp';");
        out.println("</script>");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
