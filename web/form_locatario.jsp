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
        <title>Novo Locatário</title>
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
            <h3>Novo Locatário</h3>

            <form action="gerenciar_locatario.do" method="POST">

                <input type="hidden" name="idlocatario" id="idlocatario" value="${locatario.idlocatario}"/>
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="nome">Nome</label>
                        <input type="text" class="form-control" id="nome"
                               name="nome" required="" maxlength="45"
                               value="${locatario.nome}"/>
                    </div>    
                </div>    
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="rg">RG</label>
                        <input type="text" class="form-control" id="rg"
                               name="rg" required="" maxlength="45"
                               value="${locatario.rg}"/>
                    </div>    
                </div>   
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="cpf">CPF</label>
                        <input type="text" class="form-control" id="cpf"
                               name="cpf" required="" maxlength="45"
                               value="${locatario.cpf}"/>
                    </div>    
                </div> 
                    
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="datanasc">Data de Nascimento (dd/mm/aaaa)</label>
                        <input type="text" class="form-control" id="datanasc"
                               name="datanasc" required maxlength="45" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${locatario.datanasc}"/>"/>
                    </div>    
                </div> 
                    
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="telefone">Telefone</label>
                        <input type="text" class="form-control" id="telefone"
                               name="telefone" required="" maxlength="45"
                               value="${locatario.telefone}"/>
                    </div>    
                </div> 

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="status">Status</label>
                        <select name="status" required="" class="form-control">
                            <c:if test="${locatario.status==null}">
                                <option value="">Selecine a opção</option>
                                <option value="1">Ativo</option>
                                <option value="2">Inativo</option>
                            </c:if>
                            <c:if test="${locatario.status==1}">
                                <option value="1" selected="">Ativo</option>
                                <option value="2">Inativo</option>
                            </c:if>
                            <c:if test="${locatario.status==2}">
                                <option value="1">Ativo</option>
                                <option value="2" selected="">Inativo</option>
                            </c:if>
                        </select>    
                    </div>    
                </div>    
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="usuario">Usuario</label>
                        <select name="idusuario" required="" class="form-control">
                            <option value="">Selecine a opção</option>
                            <jsp:useBean class="model.UsuarioDAO" id="uDAO"/>
                            <c:forEach var="u" items="${uDAO.lista}">
                                <option value="${u.idusuario}"
                                        <c:if test="${u.idusuario==locatario.usuario.idusuario}">
                                            selected=""
                                        </c:if> 
                                        >
                                    ${u.nome}</option>
                                </c:forEach>
                        </select>    
                    </div>    
                </div>    
                <!-- copiar e colar daqui -->
                    <div class="row" style="
    margin-left: auto;
"><!-- ate aqui -->
                    <button class="btn btn-success">Cadastrar</button>
                    <a href="listar_locador.jsp" class="btn btn-warning">
                        Voltar
                    </a>    
                </div>    
            </form>    

        </div>

    </body>
</html>
