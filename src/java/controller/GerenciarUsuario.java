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
import model.Perfil;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Administrador
 */
public class GerenciarUsuario extends HttpServlet {

    

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
        
        int idusuario = Integer.parseInt(request.getParameter("idusuario"));
        String acao = request.getParameter("acao");
        
        try{
            Usuario u = new Usuario();
            UsuarioDAO uDAO = new UsuarioDAO();
            if(acao.equals("alterar")){
               if(GerenciarLogin.verificarPermissao(request, response)){    
                u = uDAO.getCarregaPorId(idusuario);
                if(u.getIdusuario()>0){
                    RequestDispatcher disp = 
                            getServletContext().getRequestDispatcher("/form_usuario.jsp");
                    request.setAttribute("usuario", u);
                    disp.forward(request, response);
                }else{
                    mensagem = "Usuário não encontrado!";
                }
               }else{
                   mensagem = "Acesso negado";
               }  
                
            }
            if(acao.equals("desativar")){
                 if(GerenciarLogin.verificarPermissao(request, response)){ 
                u.setIdusuario(idusuario);
                if(uDAO.desativar(u)){
                    mensagem = "Desativado com sucesso!";
                }else{
                    mensagem = "Erro ao desativar!";
                }
               }else{
                   mensagem = "Acesso negado";
               }  
                
            }
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar!";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_usuario.jsp';");
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
        String idusuario = request.getParameter("idusuario");
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String status = request.getParameter("status");
        String idperfil = request.getParameter("idperfil");
        
        String mensagem = "";
        
        Usuario u = new Usuario();
        if(!idusuario.isEmpty())
            u.setIdusuario(Integer.parseInt(idusuario));
        
        try{
            if(nome.equals("")||login.equals("")||senha.equals("")||status.equals("")||idperfil.equals("")){
                mensagem = "Campos obrigatórios devem ser preecnhidos!";
            }else{
                u.setNome(nome);
                u.setLogin(login);
                u.setSenha(senha);
                u.setStatus(Integer.parseInt(status));
                Perfil p = new Perfil();
                p.setIdperfil(Integer.parseInt(idperfil));
                u.setPerfil(p);
                UsuarioDAO uDAO = new UsuarioDAO();
                if(uDAO.gravar(u)){
                    mensagem = "Gravado com sucesso!";
                }else{
                    mensagem = "Erro ao gravar!";
                }
            }
        
        }catch(Exception e){
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('"+mensagem+"')");
        out.println("location.href='listar_usuario.jsp';");
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
