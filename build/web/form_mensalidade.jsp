<%-- 
    Document   : form_mensalidade
    Created on : 19/10/2019, 21:59:03
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Nova Mensalidade</title>
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
            <h3>Pagar Mensalidade</h3>

            <form action="gerenciar_mensalidade.do" method="POST">

                <div class="row">
                    <div class="form-group col-sm-8">
                        ID Mensalidade<input type="text" name="idmensalidade" id="idmensalidade" value="${mensalidade.idmensalidade}"/>
                        ID Contrato<input type="text" name="idcontrato" id="idcontrato" value="${mensalidade.contrato.idcontrato}"/>
                    </div>    
                </div>                 

                <div class="row">
                    <div class="form-group col-sm-8">
                        <label for="valorpago">Valor Pago(R$)</label>
                        <input type="text" class="form-control" id="valorpago"
                               name="valorpago" required maxlength="45" value="<fmt:formatNumber pattern="#,##0.00" value="${mensalidade.valorpago}"/>"/>                  
                    </div>    
                </div>  



                <div class="row" style="
                     margin-left: auto;
                     ">
                    <button class="btn btn-success">Gravar</button>
  
                </div>    
            </form>    

        </div>

    </body>
</html>
