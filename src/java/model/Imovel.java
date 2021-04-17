/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Administrador
 */
public class Imovel {
    private int idimovel;
    private String endereco;
    private int qtdcomodo;
    private int garagem;
    private String area;
    private int status;
    private Tipo tipo;

    public Imovel() {
    }

    public Imovel(int idimovel, String endereco, int qtdcomodo, int garagem, String area, Tipo tipo) {
        this.idimovel = idimovel;
        this.endereco = endereco;
        this.qtdcomodo = qtdcomodo;
        this.garagem = garagem;
        this.area = area;
        this.tipo = tipo;
    }


    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getGaragem() {
        return garagem;
    }

    public void setGaragem(int garagem) {
        this.garagem = garagem;
    }

    public int getIdimovel() {
        return idimovel;
    }

    public void setIdimovel(int idimovel) {
        this.idimovel = idimovel;
    }


    public int getQtdcomodo() {
        return qtdcomodo;
    }

    public void setQtdcomodo(int qtdcomodo) {
        this.qtdcomodo = qtdcomodo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return  getEndereco();
    }
    
    

}
