/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Locatario;
import model.LocatarioDAO;

import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Administrador
 */
public class GerenciarLocatario extends HttpServlet {

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

        int idlocatario = Integer.parseInt(request.getParameter("idlocatario"));
        String acao = request.getParameter("acao");

        try {
            Locatario lct = new Locatario();
            LocatarioDAO lDAO = new LocatarioDAO();
            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    lct = lDAO.getCarregaPorId(idlocatario);
                    if (lct.getIdlocatario() > 0) {
                        RequestDispatcher disp =
                                getServletContext().getRequestDispatcher("/form_locatario.jsp");
                        request.setAttribute("locatario", lct);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Locatario não encontrado!";
                    }
                } else {
                    mensagem = "Acesso negado";
                }
            }
            if (acao.equals("desativar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    lct.setIdlocatario(idlocatario);
                    if (lDAO.desativar(lct)) {
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
        out.println("location.href='listar_locatario.jsp';");
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
        String idlocatario = request.getParameter("idlocatario");
        String nome = request.getParameter("nome");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String datanasc = request.getParameter("datanasc");
        String telefone = request.getParameter("telefone");
        String status = request.getParameter("status");
        String idusuario = request.getParameter("idusuario");

        String mensagem = "";

        try {

            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");

            Locatario lct = new Locatario();
            if (!idlocatario.isEmpty()) {
                lct.setIdlocatario(Integer.parseInt(idlocatario));
            }

            lct.setDatanasc(df.parse(datanasc));


            if (nome.equals("") || rg.equals("") || cpf.equals("") || datanasc.equals("") || telefone.equals("") || status.equals("") || idusuario.equals("")) {
                mensagem = "Campos obrigatórios devem ser preecnhidos!";
            } else {
                lct.setNome(nome);
                lct.setRg(rg);
                lct.setCpf(cpf);
                lct.setDatanasc(df.parse(datanasc));
                lct.setTelefone(telefone);
                lct.setStatus(Integer.parseInt(status));
                Usuario u = new Usuario();
                u.setIdusuario(Integer.parseInt(idusuario));
                lct.setUsuario(u);



                LocatarioDAO lDAO = new LocatarioDAO();
                if (lDAO.gravar(lct)) {
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
        out.println("location.href='listar_locatario.jsp';");
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
