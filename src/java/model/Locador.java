/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Administrador
 */
public class Locador {
    
    private int idlocador;
    private String nome;
    private String rg;
    private String cpf;
    private String telefone;
    private String endereco;
    private int status;
    private Usuario usuario;

    public Locador() {
    }

    public Locador(int idlocador, String nome, String rg, String cpf, String telefone, String endereco, int status, Usuario usuario) {
        this.idlocador = idlocador;
        this.nome = nome;
        this.rg = rg;
        this.cpf = cpf;
        this.telefone = telefone;
        this.endereco = endereco;
        this.status = status;
        this.usuario = usuario;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getIdlocador() {
        return idlocador;
    }

    public void setIdlocador(int idlocador) {
        this.idlocador = idlocador;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    @Override
    public String toString() {
        return getNome();
    }

   
    
 
}
