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
import model.TipoDAO;

/**
 *
 * @author Administrador
 */
public class GerenciarTipo extends HttpServlet {

   

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
        int idtipo = Integer.parseInt(request.getParameter("idtipo"));
        String acao = request.getParameter("acao");
        String mensagem="";
        Tipo t = new Tipo();
        try{
           TipoDAO tDAO = new TipoDAO();
            if(acao.equals("alterar")){
                if(GerenciarLogin.verificarPermissao(request, response)){ 
                t = tDAO.getCarregaPorId(idtipo);
                if(t.getIdtipo()>0){
                    RequestDispatcher disp = 
                            getServletContext().getRequestDispatcher("/form_tipo.jsp");
                    request.setAttribute("tipo", t);
                    disp.forward(request, response);
                }else{
                    mensagem = "Tipo não encontrado";
                }
                 }else{
                  mensagem = "Acesso negado";
              }  
            }
            if(acao.equals("excluir")){
                 if(GerenciarLogin.verificarPermissao(request, response)){ 
                t.setIdtipo(idtipo);
                if(tDAO.excluir(t)){
                    mensagem = "Excluído com sucesso!";
                }else{
                    mensagem = "Erro ao excluir!";
                }
             }else{
                  mensagem = "Acesso negado";
              }  
            }
            
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar o comando";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_tipo.jsp';");
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
        String idtipo = request.getParameter("idtipo");
        String nome = request.getParameter("nome");
        String mensagem = "";
        
        Tipo t = new Tipo();
        if(!idtipo.isEmpty()){
            t.setIdtipo(Integer.parseInt(idtipo));
        }
        try{
            TipoDAO tDAO = new TipoDAO();
            if(nome.equals("")|| nome.isEmpty()){
                mensagem = "Campos obrigatórios deverão ser preenchidos";
            }else{
                t.setNome(nome);
                if(tDAO.gravar(t)){
                    mensagem = "Gravado com sucesso";
                }else{
                    mensagem = "Erro ao gravar no banco";
                }
            }
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar o comando";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_tipo.jsp';");
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
