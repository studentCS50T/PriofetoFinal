<%-- 
    Document   : index
    Created on : 08/08/2019, 10:22:26
    Author     : Administrador
--%>

<%@page import="model.MenuDAO"%>
<%@page import="model.Menu"%>
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
        <title>Menus</title>
        
        <script type="text/javascript">
            function confirmarExclusao(id, nome){
                if(confirm('Deseja realmente desvincular o menu '+nome+' ?')){
                    location.href='gerenciar_menu.do?acao=excluir&idmenu='+id;
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
            <h1>Lista de Menus</h1>
            
            <a href="form_menu.jsp" class="btn btn-primary" style="margin-bottom: 10px;"><!-- copiar o STYLE com aspas -->
                Novo Cadastro
            </a>
            <table class="table table-hover table-striped table-bordered display"
                   id="listaMenu">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Menu</th>
                        <th>Link</th>
                        <th>Icone</th>
                        <th>Exibir</th>
                        <th>Opções</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Menu</th>
                        <th>Link</th>
                        <th>Icone</th>
                        <th>Exibir</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>
                
                <jsp:useBean class="model.MenuDAO" id="mDAO"/>
                <tbody>
                <c:forEach var="m" items="${mDAO.lista}">
                <tr>
                    <td>${m.idmenu}</td>
                    <td>${m.menu}</td>
                    <td>${m.link}</td>
                    <td>${m.icone}</td>
                    <td>
                        <c:if test="${m.exibir==1}">Sim</c:if>
                        <c:if test="${m.exibir==2}">Não</c:if>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="gerenciar_menu.do?acao=alterar&idmenu=${m.idmenu}">
                            <i class="glyphicon glyphicon-pencil"></i>
                        Alterar</a>
                        <button class="btn btn-danger" onclick="confirmarExclusao(${m.idmenu},'${m.menu}')">
                            <i class="glyphicon glyphicon-trash"> Desvincular</i>
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
            $("#listaMenu").dataTable({
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
