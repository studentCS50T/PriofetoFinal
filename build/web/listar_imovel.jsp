<%-- 
    Document   : index
    Created on : 08/08/2019, 10:22:26
    Author     : Administrador
--%>

<%@page import="model.ImovelDAO"%>
<%@page import="model.Imovel"%>
<%@page import="java.util.ArrayList"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Imóveis</title>
        
        <script type="text/javascript">
            function confirmarExclusao(id,endereco){
                if(confirm('Deseja realmente desativar o imóvel do endereço ' +endereco+ ' ?')){
                    location.href='gerenciar_imovel.do?acao=desativar&idimovel='+id;
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
            <h1>Lista de Imóveis</h1>
            
            <a href="form_imovel.jsp" class="btn btn-primary" style="margin-bottom: 10px;"><!-- copiar o STYLE com aspas -->
                Novo Cadastro
            </a>
            <table class="table table-hover table-striped table-bordered display"
                   id="listaImovel">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Endereço</th>
                        <th>Cômodos</th>
                        <th>Garagem</th>
                        <th>Área</th>
                        <th>Status</th>
                        <th>Tipo</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Endereço</th>
                        <th>Cômodos</th>
                        <th>Garagem</th>
                        <th>Área</th>
                        <th>Status</th>
                        <th>Tipo</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                
                <jsp:useBean class="model.ImovelDAO" id="iDAO"/>
                <tbody>
                <c:forEach var="i" items="${iDAO.lista}">
                <tr>
                    <td>${i.idimovel}</td>
                    <td>${i.endereco}</td>
                    <td>${i.qtdcomodo}</td>
                     <td>
                        <c:if test="${i.garagem==1}">Sim</c:if>
                        <c:if test="${i.garagem==2}">Não</c:if>
                    </td>
                    <td>${i.area}</td>
                    
                    <td>
                        <c:if test="${i.status==1}">Desalugado</c:if>
                        <c:if test="${i.status==2}">Alugado</c:if>
                        <c:if test="${i.status==3}">Desativado</c:if>
                    </td>
                    <td>${i.tipo}</td>
                    <td>
                        <a class="btn btn-primary" href="gerenciar_imovel.do?acao=alterar&idimovel=${i.idimovel}">
                            <i class="glyphicon glyphicon-pencil"></i>
                       Alterar </a>
                        <button class="btn btn-danger" onclick="confirmarExclusao(${i.idimovel},'${i.endereco}')">
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
            $("#listaImovel").dataTable({
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

