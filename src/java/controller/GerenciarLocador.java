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
import model.Locador;
import model.LocadorDAO;

import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Administrador
 */
public class GerenciarLocador extends HttpServlet {

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

        int idlocador = Integer.parseInt(request.getParameter("idlocador"));
        String acao = request.getParameter("acao");

        try {
            Locador lcd = new Locador();
            LocadorDAO lDAO = new LocadorDAO();
            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    lcd = lDAO.getCarregaPorId(idlocador);
                    if (lcd.getIdlocador() > 0) {
                        RequestDispatcher disp =
                                getServletContext().getRequestDispatcher("/form_locador.jsp");
                        request.setAttribute("locador", lcd);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Locador não encontrado!";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
            }
            if (acao.equals("desativar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    lcd.setIdlocador(idlocador);
                    if (lDAO.desativar(lcd)) {
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
        out.println("location.href='listar_locador.jsp';");
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
        String idlocador = request.getParameter("idlocador");
        String nome = request.getParameter("nome");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String status = request.getParameter("status");
        String idusuario = request.getParameter("idusuario");

        String mensagem = "";

        Locador lcd = new Locador();
        if (!idlocador.isEmpty()) {
            lcd.setIdlocador(Integer.parseInt(idlocador));
        }

        try {
            if (nome.equals("") || rg.equals("") || cpf.equals("") || telefone.equals("") || endereco.equals("") || status.equals("") || idusuario.equals("")) {
                mensagem = "Campos obrigatórios devem ser preecnhidos!";
            } else {
                lcd.setNome(nome);
                lcd.setRg(rg);
                lcd.setCpf(cpf);
                lcd.setTelefone(telefone);
                lcd.setEndereco(endereco);
                lcd.setStatus(Integer.parseInt(status));
                Usuario u = new Usuario();
                u.setIdusuario(Integer.parseInt(idusuario));
                lcd.setUsuario(u);



                LocadorDAO lDAO = new LocadorDAO();
                if (lDAO.gravar(lcd)) {
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
        out.println("location.href='listar_locador.jsp';");
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
