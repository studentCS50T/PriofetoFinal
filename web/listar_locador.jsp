<%-- 
    Document   : index
    Created on : 08/08/2019, 10:22:26
    Author     : Administrador
--%>

<%@page import="model.LocadorDAO"%>
<%@page import="model.Locador"%>
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
        <title>Locadores</title>
        
        <script type="text/javascript">
            function confirmarExclusao(id, nome){
                if(confirm('Deseja realmente desativar o locador '+nome+' ?')){
                    location.href='gerenciar_locador.do?acao=desativar&idlocador='+id;
                }
                
            }
        </script>    
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
            <h1>Lista de Locadores</h1>
            
            <a href="form_locador.jsp" class="btn btn-primary" style="margin-bottom: 10px;"><!-- copiar o STYLE com aspas -->
                Novo Cadastro
            </a>
            <table class="table table-hover table-striped table-bordered display"
                   id="listaLocador">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>RG</th>
                        <th>CPF</th>
                        <th>Telefone</th>
                        <th>Endereço</th>
                         <th>Status</th>
                        <th>Usuario</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                         <th>ID</th>
                        <th>Nome</th>
                        <th>RG</th>
                        <th>CPF</th>
                        <th>Telefone</th>
                        <th>Endereço</th>
                         <th>Status</th>
                        <th>Usuario</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                
                <jsp:useBean class="model.LocadorDAO" id="lcdDAO"/>
                <tbody>
                <c:forEach var="lcd" items="${lcdDAO.lista}">
                <tr>
                    <td>${lcd.idlocador}</td>
                    <td>${lcd.nome}</td>
                    <td><fmt:formatNumber pattern="#0,000.###" value="${lcd.rg}"/></td>
                    <td>${lcd.cpf}</td>
                    <td>${lcd.telefone}</td>
                    <td>${lcd.endereco}</td>
                    
                    
                    <td>
                        <c:if test="${lcd.status==1}">Ativo</c:if>
                        <c:if test="${lcd.status==2}">Inativo</c:if>
                    </td>
                    <td>${lcd.usuario}</td>
                    <td>
                        <a class="btn btn-primary" href="gerenciar_locador.do?acao=alterar&idlocador=${lcd.idlocador}">
                            <i class="glyphicon glyphicon-pencil"></i>
                       Alterar </a>
                        <button class="btn btn-danger" onclick="confirmarExclusao(${lcd.idlocador},'${lcd.nome}')">
                            <i class="glyphicon glyphicon-trash"> Desativar</i>
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
            $("#listaLocador").dataTable({
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

