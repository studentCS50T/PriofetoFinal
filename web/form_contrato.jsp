<%-- 
    Document   : form_contrato
    Created on : 07/10/2019, 18:29:31
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta content="width=device-width, 
              initial-scale=1, maximum-scale=1, 
              user-scalable=no"
              name="viewport"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css"/>
        <title>Novo Contrato</title>
    </head>

    <body style="
          background-color: #0873BA;
          ">
        <div class="container" style="
             background-color: white;
             padding: 15px 15px 15px 15px;
             margin-top: 40px;
             margin-bottom: 20px;
             border-radius: 1%;
             ">

            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
            <h3>Novo Contrato</h3>

            <form action="gerenciar_contrato.do" method="POST">

                <input type="hidden" name="idcontrato" id="idcontrato" value="${contrato.idcontrato}"/>

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="imovel">Imóvel</label>
                        <select name="idimovel" required="" class="form-control">
                            <option value="">Selecine o imóvel</option>
                            <jsp:useBean class="model.ImovelDAO" id="iDAO"/>
                            <c:forEach var="i" items="${iDAO.lista}">

                                <c:if test="${i.status==1 || i.idimovel==contrato.imovel.idimovel}">
                                    <option value="${i.idimovel}"

                                    </c:if> 
                                    <c:if test="${i.idimovel==contrato.imovel.idimovel}">
                                        selected=""
                                    </c:if> 
                                    >
                                    ${i.endereco}</option>
                                </c:forEach>
                        </select>    
                    </div>    
                </div>   


                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="locatario">Locatário</label>
                        <select name="idlocatario" required="" class="form-control">
                            <option value="">Selecine o locatário</option>
                            <jsp:useBean class="model.LocatarioDAO" id="lctDAO"/>
                            <c:forEach var="lct" items="${lctDAO.lista}">
                                <c:if test="${lct.status==1 || lct.idlocatario==contrato.locatario.idlocatario}">
                                    <option value="${lct.idlocatario}"
                                    </c:if>

                                    <c:if test="${lct.idlocatario==contrato.locatario.idlocatario}">
                                        selected=""
                                    </c:if> 
                                    >
                                    ${lct.nome}</option>
                                </c:forEach>
                        </select>    
                    </div>    
                </div>     

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="locador">Locador</label>
                        <select name="idlocador" required="" class="form-control">
                            <option value="">Selecine o locador</option>
                            <jsp:useBean class="model.LocadorDAO" id="lcdDAO"/>
                            <c:forEach var="lcd" items="${lcdDAO.lista}">
                                <c:if test="${lcd.status==1 || lcd.idlocador==contrato.locador.idlocador}">
                                    <option value="${lcd.idlocador}"
                                    </c:if>
                                    <c:if test="${lcd.idlocador==contrato.locador.idlocador}">
                                        selected=""
                                    </c:if> 
                                    >
                                    ${lcd.nome}</option>
                                </c:forEach>
                        </select>    
                    </div>    
                </div>  

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="total">Valor Total do Contrato (R$)</label>
                        <input type="text" class="form-control" id="total"
                               name="total" required maxlength="45" value="<fmt:formatNumber pattern="#,##0.00" value="${contrato.total}"/>"/>                  
                    </div>    
                </div>   

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="qtdmensalidade">Quantidade de Mensalidades</label>
                        <select name="qtdmensalidade" required="" class="form-control">
                            <c:if test="${contrato.qtdmensalidade==null}">
                                <option value="">Selecione a quantidade de mensalidades</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==1}">
                                <option value="1" selected="">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==2}">
                                <option value="1">1</option>
                                <option value="2" selected="">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>                            
                            <c:if test="${contrato.qtdmensalidade==3}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3" selected="">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>                            
                            <c:if test="${contrato.qtdmensalidade==4}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4" selected="">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>                            
                            <c:if test="${contrato.qtdmensalidade==5}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5" selected="">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==6}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6" selected="">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==7}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7" selected="">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==8}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8" selected="">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==9}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9" selected="">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==10}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10" selected="">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==11}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11" selected="">11</option>
                                <option value="12">12</option>
                            </c:if>
                            <c:if test="${contrato.qtdmensalidade==12}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12" selected="">12</option>
                            </c:if>
                        </select>
                    </div>    
                </div>

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="datainicio">Data de Início do Contrato (dd/mm/aaaa)</label>
                        <input type="text" class="form-control" id="datainicio"
                               name="datainicio" required maxlength="45" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${contrato.datainicio}"/>"/>
                    </div>    
                </div> 

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="datafim">Data de Fim do Contrato (dd/mm/aaaa)</label>
                        <input type="text" class="form-control" id="datafim"
                               name="datafim" required maxlength="45" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${contrato.datafim}"/>"/>
                    </div>    
                </div> 

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="status">Status</label>
                        <select name="status" required="" class="form-control">
                            <c:if test="${contrato.status==null}">
                                <option value="">Selecine a opção</option>
                                <option value="1">Ativo</option>
                                <option value="2">Cancelado</option>
                            </c:if>
                            <c:if test="${contrato.status==1}">
                                <option value="1" selected="">Ativo</option>
                                <option value="2">Cancelado</option>
                            </c:if>
                            <c:if test="${contrato.status==2}">
                                <option value="1">Ativo</option>
                                <option value="2" selected="">Cancelado</option>
                            </c:if>
                        </select>    
                    </div>    
                </div> 


                <!-- copiar e colar daqui -->
                <div class="row" style="
                     margin-left: auto;
                     "><!-- ate aqui -->
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_contrato.jsp" class="btn btn-warning">
                        Voltar
                    </a>    
                </div>    
            </form>    

        </div>

    </body>
</html>
