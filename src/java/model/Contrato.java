/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Administrador
 */
public class Contrato {
    
    private int idcontrato;
    private Double total;
    private int qtdmensalidade;
    private Date datainicio;
    private Date datafim;
    private int status;
    private Imovel imovel;
    private Locatario locatario;
    private Locador locador;
    
    public Contrato() {
    }

    public Contrato(int idcontrato, Double total, int qtdmensalidade, Date datainicio, Date datafim, int status, Imovel imovel, Locatario locatario, Locador locador) {
        this.idcontrato = idcontrato;
        this.total = total;
        this.qtdmensalidade = qtdmensalidade;
        this.datainicio = datainicio;
        this.datafim = datafim;
        this.status = status;
        this.imovel = imovel;
        this.locatario = locatario;
        this.locador = locador;
    }

    public Date getDatafim() {
        return datafim;
    }

    public void setDatafim(Date datafim) {
        this.datafim = datafim;
    }

    public Date getDatainicio() {
        return datainicio;
    }

    public void setDatainicio(Date datainicio) {
        this.datainicio = datainicio;
    }

    public int getIdcontrato() {
        return idcontrato;
    }

    public void setIdcontrato(int idcontrato) {
        this.idcontrato = idcontrato;
    }

    public Imovel getImovel() {
        return imovel;
    }

    public void setImovel(Imovel imovel) {
        this.imovel = imovel;
    }

    public Locador getLocador() {
        return locador;
    }

    public void setLocador(Locador locador) {
        this.locador = locador;
    }

    public Locatario getLocatario() {
        return locatario;
    }

    public void setLocatario(Locatario locatario) {
        this.locatario = locatario;
    }

    public int getQtdmensalidade() {
        return qtdmensalidade;
    }

    public void setQtdmensalidade(int qtdmensalidade) {
        this.qtdmensalidade = qtdmensalidade;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Contrato getCarregaPorID(int idcontrato) throws Exception{
        ContratoDAO cDAO = new ContratoDAO();
        return cDAO.getCarregaPorId(idcontrato);
}
}