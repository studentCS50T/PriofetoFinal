<%-- 
    Document   : index
    Created on : 08/08/2019, 10:22:26
    Author     : Administrador
--%>

<%@page import="model.ContratoDAO"%>
<%@page import="model.Contrato"%>
<%@page import="java.util.ArrayList"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css"/>
        <title>Contratos</title>

        <script type="text/javascript">
            function confirmarExclusao(idcontrato){
                if(confirm('Deseja realmente cancelar este contrato '+idcontrato+' e suas mensalidades?')){
                    location.href='gerenciar_contrato.do?acao=cancelar&idcontrato='+idcontrato;
                }
                
            }
        </script>    
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
            <h1>Lista de Contratos</h1>

            <a href="form_contrato.jsp" class="btn btn-primary">
                Novo Cadastro
            </a>
            <table class="table table-hover table-striped table-bordered display"
                   id="listaContrato">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Imóvel</th>
                        <th>Locatário</th>
                        <th>Total</th>
                        <th>Mensalidades</th>
                        <th>Data Início</th>
                        <th>Data Fim</th>
                        <th>Status</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Imóvel</th>
                        <th>Locatário</th>
                        <th>Total</th>
                        <th>Mensalidades</th>
                        <th>Data Início</th>
                        <th>Data Fim</th>
                        <th>Status</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>

                <jsp:useBean class="model.ContratoDAO" id="cDAO"/>

                <tbody>
                    <c:forEach var="c" items="${cDAO.lista}">

                        <!-- ID ${c.locatario.usuario.idusuario} -->
                        <c:if test="${ulogado.idusuario==c.locatario.usuario.idusuario || ulogado.perfil.idperfil==1 || ulogado.perfil.idperfil==2}">
                            <tr>
                                <td>${c.idcontrato}</td>                                        
                                <td>${c.imovel}</td>
                                <td>${c.locatario}</td>
                                <td><fmt:formatNumber pattern="#,##0.00" value="${c.total}"/></td>
                                <td>
                                    <c:if test="${c.qtdmensalidade==1}">1</c:if>
                                    <c:if test="${c.qtdmensalidade==2}">2</c:if>
                                    <c:if test="${c.qtdmensalidade==3}">3</c:if>
                                    <c:if test="${c.qtdmensalidade==4}">4</c:if>
                                    <c:if test="${c.qtdmensalidade==5}">5</c:if>
                                    <c:if test="${c.qtdmensalidade==6}">6</c:if>
                                    <c:if test="${c.qtdmensalidade==7}">7</c:if>
                                    <c:if test="${c.qtdmensalidade==8}">8</c:if>
                                    <c:if test="${c.qtdmensalidade==9}">9</c:if>
                                    <c:if test="${c.qtdmensalidade==10}">10</c:if>
                                    <c:if test="${c.qtdmensalidade==11}">11</c:if>
                                    <c:if test="${c.qtdmensalidade==12}">12</c:if>
                                </td>
                                <td><fmt:formatDate pattern="dd/MM/YYYY" value="${c.datainicio}"/></td>
                                <td><fmt:formatDate pattern="dd/MM/YYYY" value="${c.datafim}"/></td>

                                <td>
                                    <c:if test="${c.status==1}">Ativo</c:if>
                                    <c:if test="${c.status==2}">Cancelado</c:if>
                                </td>
                                <td>

                                    <a class="btn btn-primary" href="listar_mensalidade.jsp?idcontrato=${c.idcontrato}">
                                        <i class="glyphicon glyphicon-credit-card"></i>
                                    </a>
                                    <a class="btn btn-primary" href="visualizar_contrato.jsp?idcontrato=${c.idcontrato}">
                                        <i class="glyphicon glyphicon-folder-open"></i>
                                    </a>
                                        <a class="btn btn-primary" href="gerenciar_contrato.do?acao=gerarpdf&idcontrato=${c.idcontrato}">
                                        <i class="glyphicon glyphicon-print"></i>
                                    </a>
                                    <a class="btn btn-primary" href="gerenciar_contrato.do?acao=alterar&idcontrato=${c.idcontrato}">
                                        <i class="glyphicon glyphicon-pencil">Alterar</i>
                                    </a>
                                    <button class="btn btn-danger" onclick="confirmarExclusao(${c.idcontrato})">
                                        <i class="glyphicon glyphicon-trash">Cancelar</i>
                                    </button> 
                                </td>

                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>    
        </div>

        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#listaContrato").dataTable({
                    "bJQueryUI": true,
                    "oLanguage": {
                        "sProcessing": "Processando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "Não foram encontrados resultados",
                        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                        "sInfoFiltered": "",
                        "sInfoPostFix": "",
                        "sSearch": "Pesquisar",
                        "sUrl": "",
                        "oPaginate": {
                            "sFirst": "Primeiro",
                            "sPrevious": "Anterior",
                            "sNext": "Próximo",
                            "sLast": "Último"
                        }
                    }
                })
            });
        </script>            

    </body>
</html>