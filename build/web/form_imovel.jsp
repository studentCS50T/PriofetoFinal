<%-- 
    Document   : index
    Created on : 08/08/2019, 10:22:26
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Novo Imóvel</title>
    </head>
    <!-- copiar e colar daqui -->
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
<!-- ate aqui -->
            <%@include file="banner.jsp" %>
            <%@include file="menu.jsp" %>
            <h3>Novo Imóvel</h3>
            
            <form action="gerenciar_imovel.do" method="POST">
                
                <input type="hidden" name="idimovel" id="idimovel" value="${imovel.idimovel}"/>
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="endereco">Endereço</label>
                        <input type="text" class="form-control" id="endereco"
                               name="endereco" required="" maxlength="150"
                               value="${imovel.endereco}"/>
                    </div>    
                </div>    
               <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="qtdcomodo">Quantidade de Cômodos</label>
                        <select name="qtdcomodo" required="" class="form-control">
                            <c:if test="${imovel.qtdcomodo==null}">
                                <option value="">Selecione a quantidade</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </c:if>
                            <c:if test="${imovel.qtdcomodo==1}">
                                <option value="1" selected="">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </c:if>
                             <c:if test="${imovel.qtdcomodo==2}">
                                <option value="1">1</option>
                                <option value="2" selected="">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </c:if>                            
                            <c:if test="${imovel.qtdcomodo==3}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3" selected="">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </c:if>                            
                            <c:if test="${imovel.qtdcomodo==4}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4" selected="">4</option>
                                <option value="5">5</option>
                            </c:if>                            
                            <c:if test="${imovel.qtdcomodo==5}">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5" selected="">5</option>
                            </c:if>
                        </select>
                    </div>    
                </div>   
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="garagem">Garagem</label>
                        <select name="garagem" required="" class="form-control">
                            <c:if test="${imovel.garagem==null}">
                                <option value="">Selecione a opção</option>
                                <option value="1">Sim</option>
                                <option value="2">Não</option>
                            </c:if>
                            <c:if test="${imovel.garagem==1}">
                                <option value="1" selected="">Sim</option>
                                <option value="2">Não</option>
                            </c:if>
                            <c:if test="${imovel.garagem==2}">
                                <option value="1">Sim</option>
                                <option value="2" selected="">Não</option>
                            </c:if>
                        </select> 
                    </div>    
                </div> 
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="status">Status</label>
                        <select name="status" required="" class="form-control">
                            <c:if test="${imovel.status==null}">
                                <option value="">Selecione a opção</option>
                                <option value="1">Desalugado</option>
                                <option value="2">Alugado</option>
                                <option value="3">Desativado</option>
                            </c:if>
                            <c:if test="${imovel.status==1}">
                                <option value="1" selected="">Desalugado</option>
                                <option value="2">Alugado</option>
                                <option value="3">Desativado</option>
                            </c:if>
                            <c:if test="${imovel.status==2}">
                                <option value="1">Desalugado</option>
                                <option value="2" selected="">Alugado</option>
                                <option value="3">Desativado</option>
                            </c:if>
                                <c:if test="${imovel.status==3}">
                                <option value="1">Desalugado</option>
                                <option value="2">Alugado</option>
                                <option value="3" selected="">Desativado</option>
                            </c:if>
                        </select>    
                    </div>    
                </div>    
                    <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="area">Área</label>
                        <input type="text" class="form-control" id="area"
                               name="area" required="" maxlength="15"
                               value="${imovel.area}"/>
                    </div>    
                </div> 
                    <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="tipo">Tipo</label>
                        <select name="idtipo" required="" class="form-control">
                              <option value="">Selecine o tipo</option>
                              <jsp:useBean class="model.TipoDAO" id="tDAO"/>
                              <c:forEach var="t" items="${tDAO.lista}">
                                  <option value="${t.idtipo}"
                                          <c:if test="${t.idtipo==imovel.tipo.idtipo}">
                                              selected=""
                                          </c:if> 
                                  >
                                      ${t.nome}</option>
                              </c:forEach>
                        </select>    
                    </div>    
                </div>    
                <!-- copiar e colar daqui -->
                    <div class="row" style="
    margin-left: auto;
"><!-- ate aqui -->
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_imovel.jsp" class="btn btn-warning">
                        Voltar
                    </a>    
                </div>    
            </form>    
            
        </div>
        
    </body>
</html>
