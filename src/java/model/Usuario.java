/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Administrador
 */
public class Usuario {
   
    private int idusuario;
    private String usuario;
    private String nome;
    private String login;
    private String senha;
    private int status;
    private Perfil perfil;

    public Usuario() {
    }

    public Usuario(int idusuario,String usuario, String nome, String login, String senha, int status, Perfil perfil) {
        this.idusuario = idusuario;
        this.usuario = usuario;
        this.nome = nome;
        this.login = login;
        this.senha = senha;
        this.status = status;
        this.perfil = perfil;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return getNome();
    }
    
    
}
