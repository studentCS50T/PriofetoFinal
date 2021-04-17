/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Administrador
 */
public class Mensalidade {
    
    private int idmensalidade;
    private Contrato contrato;
    //private ArrayList<Contrato> contrato;
    private Date vencimento;
    private Double valor;
    private Double valorpago;
    private int status;

    public Mensalidade(){
        
    }
    
    public Mensalidade(int idmensalidade, Contrato contrato, Double valor, Double valorpago, int status) {
        this.idmensalidade = idmensalidade;
        this.contrato = contrato;
        this.valor = valor;
        this.valorpago = valorpago;
        this.status = status;
    }
    

    public Contrato getContrato() {
        return contrato;
    }

    public void setContrato(Contrato contrato) {
        this.contrato = contrato;
    }

    public int getIdmensalidade() {
        return idmensalidade;
    }

    public void setIdmensalidade(int idmensalidade) {
        this.idmensalidade = idmensalidade;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Double getValorpago() {
        return valorpago;
    }

    public void setValorpago(Double valorpago) {
        this.valorpago = valorpago;
    }

    public Date getVencimento() {
        return vencimento;
    }

    public void setVencimento(Date vencimento) {
        this.vencimento = vencimento;
    }
    
    
}
