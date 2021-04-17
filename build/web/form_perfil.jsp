<%-- 
    Document   : index
    Created on : 08/08/2019, 10:22:26
    Author     : Administrador
--%>

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
        <title>Novo Perfil</title>
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
            <h3>Novo Perfil</h3>
            
            <form action="gerenciar_perfil.do" method="POST">
                
                <input type="hidden" name="idperfil" id="idperfil" value="${perfil.idperfil}"/>
                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="perfil">Perfil</label>
                        <input type="text" class="form-control" id="perfil"
                               name="perfil" required="" maxlength="45"
                               value="${perfil.perfil}"/>
                    </div>    
                </div>    
                <!-- copiar e colar daqui -->
                    <div class="row" style="
    margin-left: auto;
"><!-- ate aqui -->
                    <button class="btn btn-success">Gravar</button>
                    <a href="listar_perfil.jsp" class="btn btn-warning">
                        Voltar
                    </a>    
                </div>    
            </form>    
            
        </div>
        
    </body>
</html>
