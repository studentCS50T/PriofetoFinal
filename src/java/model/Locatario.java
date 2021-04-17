package model;

import java.util.Date;

public class Locatario {

    private int idlocatario;
    private String nome;
    private String rg;
    private String cpf;
    private String telefone;
    private Date datanasc;
    private int status;
    private Usuario usuario;

    public Locatario() {
    }

    public Locatario(int idlocatario, String rg, String cpf, String telefone, Date datanasc, int status, Usuario usuario) {
        this.idlocatario = idlocatario;
        this.rg = rg;
        this.cpf = cpf;
        this.telefone = telefone;
        this.datanasc = datanasc;
        this.status = status;
        this.usuario = usuario;
    }



    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getDatanasc() {
        return datanasc;
    }

    public void setDatanasc(Date datanasc) {
        this.datanasc = datanasc;
    }

    public int getIdlocatario() {
        return idlocatario;
    }

    public void setIdlocatario(int idlocatario) {
        this.idlocatario = idlocatario;
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
