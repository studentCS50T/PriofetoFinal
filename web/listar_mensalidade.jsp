<%-- 
    Document   : index
    Created on : 08/08/2019, 10:22:26
    Author     : Administrador
--%>

<%@page import="model.MensalidadeDAO"%>
<%@page import="model.Mensalidade"%>
<%@page import="model.Contrato"%>
<%@page import="model.ContratoDAO"%>
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
        <title>Mensalidades</title>

        <script type="text/javascript">
            function confirmarExclusao(idmensalidade, idcontrato){
                if(confirm('Deseja realmente excluir essa mensalidade '+idmensalidade+' ?')){
                    location.href='gerenciar_mensalidade.do?acao=cancelar&idmensalidade='+idmensalidade+'&idcontrato='+idcontrato;
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
            <h1>Lista de Mensalidades</h1>

      
            <table class="table table-hover table-striped table-bordered display"
                   id="listaMensalidade">
                <thead>
                    <tr>
                        <th>Mensalidade</th>
                        <th>Contrato</th>
                        <th>Vencimento</th>
                        <th>Valor</th>
                        <th>Valor Pago</th>
                        <th>Status</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Mensalidade</th>
                        <th>Contrato</th>
                        <th>Vencimento</th>
                        <th>Valor</th>
                        <th>Valor Pago</th>
                        <th>Status</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                   <jsp:useBean class="model.ContratoDAO" id="cDAO" />
                    <tbody>
                        <c:forEach var="m" items="${cDAO.mensalidadeContrato(param.idcontrato)}">
                            <tr>
                            <td>${m.idmensalidade}</td>
                            <td>${m.contrato.idcontrato}</td>
                            
                 
                            <td><fmt:formatDate pattern="dd/MM/YYYY" value="${m.vencimento}"/></td>
                            <td><fmt:formatNumber pattern="#,##0.00" value="${m.valor}"/></td>
                            <td><fmt:formatNumber pattern="#,##0.00" value="${m.valorpago}"/></td>
                            <td>
                                <c:if test="${m.status==1}">Pendente</c:if>
                                <c:if test="${m.status==2}">Pago</c:if>
                                <c:if test="${m.status==3}">Cancelado</c:if>
                                </td>

                            <td>
                                <a class="btn btn-primary" href="gerenciar_mensalidade.do?acao=alterar&idmensalidade=${m.idmensalidade}&idcontrato=${m.contrato.idcontrato}">
                                    <i class="glyphicon glyphicon-credit-card"> Pagar</i>
                                </a>
                                <button class="btn btn-danger" onclick="confirmarExclusao(${m.idmensalidade},${m.contrato.idcontrato})">
                                    <i class="glyphicon glyphicon-trash"> Cancelar</i>
                                </button>    
                            </td>
                        </tr>
            
                        </c:forEach>
                </tbody>
            </table>    
        </div>

        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#listaMensalidade").dataTable({
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