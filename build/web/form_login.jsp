<%-- 
    Document   : form_login
    Created on : 10/10/2019, 08:38:42
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
        <title>Login</title>
    </head>
    <body style="
          background-color: #0873BA;
          ">


        <div class="container" style="margin: 160px auto;padding: 15px 15px 15px 15px;width: 369px;height: 331px;background-color: #e8e8e8;border-radius: 5%;">
            <img src="img/logo-h.png" alt="Minha imagem!" title="Pedro Aluguéis" align="center" style="
                 width: 333px;
                 /* margin: 0 0px 0 -22px; */
                 ">

            <%
                String mensagem = (String) request.getSession().getAttribute("mensagem");
                if (mensagem != null) {
                    request.getSession().removeAttribute("mensagem");
            %>
            <div class="alert alert-info"><%=mensagem%></div>
            <%
                }
            %>
            <form action="gerenciar_login.do" method="POST">

                <div class="row">
                    <div class="form-group col-sm-12">
                        <label for="login">Login</label>
                        <input type="text" class="form-control" id="login"
                               name="login" required="" maxlength="45"
                               value=""/>
                    </div>    
                </div>  
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" id="senha"
                               name="senha" required="" maxlength="45"
                               value=""/>
                    </div>    
                    <div class="row">
                        <button class="btn btn-success" style="margin: 0 0 0 302px;">Entrar</button>

                    </div>

            </form>    

        </div>
        <div><a href="index.html"><button class="btn btn-primary" style=" margin: -55px 0 0 0;">Retornar</button></a></div>

    </body>
</html>
