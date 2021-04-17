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
        <title>Novo Menu</title>
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
            <h3>Novo Menu</h3>
            
            <form action="gerenciar_menu.do" method="POST">
                
                <input type="hidden" name="idmenu" id="idmenu" value="${menu.idmenu}"/>
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="menu">Menu</label>
                        <input type="text" class="form-control" id="menu"
                               name="menu" required="" maxlength="45"
                               value="${menu.menu}"/>
                    </div>    
                </div>    
               <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="link">Link</label>
                        <input type="text" class="form-control" id="link"
                               name="link" required="" maxlength="45"
                               value="${menu.link}"/>
                    </div>    
                </div>   
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="icone">Icone</label>
                        <input type="text" class="form-control" id="icone"
                               name="icone" maxlength="45"
                               value="${menu.icone}"/>
                    </div>    
                </div> 
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="exibir">Exibir</label>
                        <select name="exibir" required="" class="form-control">
                            <c:if test="${menu.exibir==null}">
                                <option value="0">Selecine a opção</option>
                                <option value="1">Sim</option>
                                <option value="2">Não</option>
                            </c:if>
                            <c:if test="${menu.exibir==1}">
                                <option value="1" selected="">Sim</option>
                                <option value="2">Não</option>
                            </c:if>
                            <c:if test="${menu.exibir==2}">
                                <option value="1">Sim</option>
                                <option value="2" selected="">Não</option>
                            </c:if>
                        </select>    
                    </div>    
                </div>    
                <!-- copiar e colar daqui -->
                    <div class="row" style="
    margin-left: auto;
"><!-- ate aqui -->
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_menu.jsp" class="btn btn-warning">
                        Voltar
                    </a>    
                </div>    
            </form>    
            
        </div>
        
    </body>
</html>
