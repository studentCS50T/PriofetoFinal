<%-- 
    Document   : visualizar_contrato
    Created on : 25/11/2019, 11:02:46
    Author     : Administrador
--%>

<%@page import="model.ContratoDAO"%>
<%@page import="model.Contrato"%>
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
        <title>Visualizar Contrato</title>

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
            <h1>Visualizar Contrato</h1>
         
                    <a class="btn btn-primary" href="listar_contrato.jsp">
                        <i class="glyphicon glyphicon-arrow-left"> Voltar</i>
                    </a>


             
            <table id="visualizaContrato">



                <jsp:useBean class="model.ContratoDAO" id="cDAO"/>
                <tbody>
                    <c:forEach var="c" items="${cDAO.getListaVisualizarContrato(param.idcontrato)}">

                        <c:if test="${ulogado.idusuario==c.locatario.usuario.idusuario || ulogado.perfil.idperfil==1 || ulogado.perfil.idperfil==2}">

                        <div align="justify" font-size="16" id="visualizarcontrato">
                            <h4> <b>Contrato de Locação </b></h4>

                            <p>- Os signatários deste instrumento de locação:</p>
                            <p>Locador: ${c.locador.nome}, CPF: ${c.locador.cpf} RG: <fmt:formatNumber pattern="#0,000.###" value="${c.locador.rg}"/> SSP/DF.</p>
                            <p>Locatário: ${c.locatario.nome}, CPF: ${c.locatario.cpf} RG: <fmt:formatNumber pattern="#0,000.###" value="${c.locatario.rg}"/> SSP/DF.</p>
                            <p>- Do objeto finalidade de locação e localização do imóvel: </p>
                            <p>O locador é legitimo proprietário do imóvel situado: ${c.imovel.endereco}.</p>
                            <p>Loca-o neste ato para o locatário para fins residenciais. Não podendo ser mudada sua destinação sem o
                                consentimento expresso do locador. </p>
                            <p>- O prazo e valores da locação:</p>
                            <p>O prazo da locação é de ${c.qtdmensalidade} meses, a começar do dia <fmt:formatDate pattern="dd/MM/YYYY" value="${c.datainicio}"/> até o dia  
                                <fmt:formatDate pattern="dd/MM/YYYY" value="${c.datafim}"/>.</p>
                            <p>O valor de aluguel é R$ <fmt:formatNumber pattern="#,##0.00" value="${c.total}"/> que o locatário se compromete a
                                a pagar pontualmente no mesmo dia do início do contrato"
                        + " durante todos os meses ao locador ou a seu procurador legalmente constituído.
                                Concordam as partes entre si, na assinatura deste contrato, que o locatário pagará o valor de 1 (um)
                                aluguel adiantado. O qual deverá ser descontado no ultimo mês a ser pago, quando da entrega do imóvel.
                                O locador deverá emitir recibo a cada aluguel pago pelo locatário como comprovante de pagamento legal. </p>

                            <p>- Atributos e demais encargos:</p>

                            <p>Havendo reajuste do aluguel, o índice a ser cobrado será de acordo com o estipulado pelo governo ou
                                combinado entre as partes e quando da renovação do contrato.</p>
                            <p>Em caso de atraso ao pagamento do aluguel, serão cobrados juros de 0,03% ao dia e multa de 3% ao mês.</p>
                            <p>O locatário não terá direito de retenção ou indenização a quaisquer benfeitorias ou construções de qualquer
                                natureza, ainda que autorizadas ou mesmo necessárias obras no imóvel locado as quais incorporam
                                imediatamente a este contrato a mesma não podendo ser retiradas ou desfeitas sem autorização por escrito
                                do locador.</p>

                            <p> - Dos direitos e obrigações gerais: </p>

                            <p>É expressamente proibido ao locatário, salvo prévio consentimento escritor do locador: ceder, vender o
                                aluguel ou transferir direitos do presente contrato, emprestar ou sublocar total e parcialmente o imóvel.</p>
                            <p>Obriga-se ao locatário o pagamento do consumo de água, luz e telefone cabendo-lhe efetuar estes
                                pagamentos nas devidas épocas.</p>
                            <p>O locatário salvo as obras que importem na segurança do imóvel obriga-se por todas as outras. Devendo
                                trazer o imóvel em boas condições de higiene, limpeza com os aparelhos sanitários e de iluminação,
                                pinturas, telhados, vidraças, mármores, fechos, torneiras, pias, banheiros, ralos e demais acessórios em
                                perfeito estado de conservação e funcionamento para assim restitui-los quando findo ou rescindido este
                                contrato.</p>
                            <p>Fica o locatário obrigado ao término deste contrato a entregar o imóvel pintado conforme recebido.</p>
                            <p>É proibido animais de qualquer espécie dentro do imóvel, assim como também usar aparelhos sonoros em
                                alto volume.</p>
                            <p>No caso de desapropriação do imóvel locado, ficará o locador desobrigado por todas as cláusulas deste
                                contrato, ressalvada ao locatário tão somente a faculdade de haver o poder desapropriante, a indenização a
                                que por ventura tiver direito.</p>
                            <p>Na rescisão do contrato antes da data estipulada, manifestada por uma das partes, a parte desistente
                                obriga-se a efetuar o pagamento no valor equivalente a UM aluguel vigente. </p>
                            <p>E por assim terem contratado,
                                assinam o presente em 02 (duas) vias, a seguir dão cumprimento às exigências e formalidades legais.</p>
                            <p>Brasília, <fmt:formatDate pattern="dd/MM/YYYY" value="${c.datainicio}"/></p>

                            <p>______________________________<p>                                              
                            <p>Locador: ${c.locador.nome}       </p>                                                      
                            <p>CPF: ${c.locador.cpf}      </p>                                                       
                            <p>RG: ${c.locador.rg} SSP/DF     </p>        

                            ______________________________
                            <p>Locatário: ${c.locatario.nome}</p>
                            <p>CPF: ${c.locatario.cpf}</p>
                            <p>RG: ${c.locatario.rg} SSP/DF</p>

                        </div>



                    </c:if>

                </c:forEach>
                </tbody>
            </table>    
        </div>

        <script type="text/javascript" src="datatables/jquery.js"></script>
        <script type="text/javascript" src="datatables/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#visualizaContrato").dataTable({
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

