
<%@page import="model.LocatarioDAO"%>
<%@page import="model.Locatario"%>
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
        <title>Locatários</title>

        <script type="text/javascript">
            function confirmarExclusao(id, nome){
                if(confirm('Deseja realmente desativar o locatário '+nome+' ?')){
                    location.href='gerenciar_locatario.do?acao=desativar&idlocatario='+id;
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
            <h1>Lista de Locatários</h1>

            <a href="form_locatario.jsp" class="btn btn-primary" style="margin-bottom: 10px;"><!-- copiar o STYLE com aspas -->
                Novo Cadastro
            </a>
            <table class="table table-hover table-striped table-bordered display"
                   id="listaLocatario">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>RG</th>
                        <th>CPF</th>
                        <th>Data Nascimento</th>
                        <th>Telefone</th>                        
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
                        <th>Data Nascimento</th>
                        <th>Telefone</th>                       
                        <th>Status</th>
                        <th>Usuario</th>
                        <th>Opções</th>
                    </tr>
                </tfoot>

                <jsp:useBean class="model.LocatarioDAO" id="lctDAO"/>
                <tbody>
                    <c:forEach var="lct" items="${lctDAO.lista}">
                        <tr>
                            <td>${lct.idlocatario}</td>
                            <td>${lct.nome}</td>
                            <td><fmt:formatNumber pattern="#0,000.###" value="${lct.rg}"/></td>
                            <td>${lct.cpf}</td>
                            <td><fmt:formatDate pattern="dd/MM/YYYY" value="${lct.datanasc}"/></td>
                            <td>${lct.telefone}</td>



                            <td>
                                <c:if test="${lct.status==1}">Ativo</c:if>
                                <c:if test="${lct.status==2}">Inativo</c:if>
                                </td>
                                <td>${lct.usuario}</td>
                            <td>
                                <a class="btn btn-primary" href="gerenciar_locatario.do?acao=alterar&idlocatario=${lct.idlocatario}">
                                    <i class="glyphicon glyphicon-pencil"></i>
                                    Alterar</a>
                                <button class="btn btn-danger" onclick="confirmarExclusao(${lct.idlocatario},'${lct.nome}')">
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
                $("#listaLocatario").dataTable({
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

