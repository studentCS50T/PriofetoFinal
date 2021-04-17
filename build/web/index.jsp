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

        <title>Home</title>
        <style>
            .accordion {
                background-color: #eee;
                color: #444;
                cursor: pointer;
                padding: 18px;
                width: 100%;
                border: none;
                text-align: left;
                outline: none;
                font-size: 15px;
                transition: 0.4s;
            }

            .active, .accordion:hover {
                background-color: #ccc; 
            }

            .panel {
                padding: 13px 20px 0 18px;
                display: none;
                background-color: #0873BA;
                overflow: hidden;
                margin-bottom: 10px;
                color: white;
                border-radius: 0 0 5px 5px;
            }
        </style>
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
            <h1></h1>


            <h3>PERGUNTAS FREQUENTES À PEDRO ALUGUÉIS</h3>
            <div class="col-md-8">
                <button class="accordion">1- Como eu faço para cancelar um contrato? É possível?</button>
                <div class="panel">
                    <p>R: É possível cancelar através das regras da cláusula de recisão já inclusa no contrato.
                    </p>
                </div>

                <button class="accordion">2- Quais são as formas de pagamento?
                </button>
                <div class="panel">
                    <p>R: Apenas dinheiro (em mãos, por transferência ou depósito).
                    </p>
                </div>

                <button class="accordion">3- Qual a política adotada com relação à animais de estimação nos imóveis?
                </button>
                <div class="panel">
                    <p>R: Não é permitido (é uma cláusula contratual).
                    </p>
                </div>

                <button class="accordion">4- Como eu faço para renovar um contrato?
                </button>
                <div class="panel">
                    <p>R: O contrato é renovável de acordo com o interesse do locador e do locatário. 
                    </p></div>
                <button class="accordion">5- É permitida a instalação, reparo e reforma dentro do ambiente do imóvel?
                </button>
                <div class="panel">
                    <p>R: Sim. Quaisquer modificações ou benfeitorias para o imóvel devem ser avisadas e autorizadas previamente pelo locador.
                    </p></div>


                <button class="accordion">6- O Pedro Aluguéis cobra a taxa de condomínio em cima do valor do aluguel? Ou não há essa cobrança?</button>
                <div class="panel">
                    <p>R: Os locatários não pagam condomínio.
                    </p></div>

                <button class="accordion">7- O que eu faço em casos ou situações em que o comprometimento da estrutura do imóvel é afetada? Com ou sem a minha responsabilidade, qual o procedimento?
                </button>
                <div class="panel">
                    <p>R: Entrar em contato com o locador imediatamente.
                    </p></div>

                <button class="accordion">8- O que acontece comigo no caso de atraso no pagamento do aluguel? São estabelecidas multas corretivas?</button>
                <div class="panel">
                    <p>R: É cobrada uma multa por atraso já pré estabelecida no contrato.
                    </p></div>

                <button class="accordion">9- Quais são as regras de convivência adotadas e estabelecidas dentro do ambiente do imóvel? É permitido som alto, festas até altas horas? Qual a política adotada no caso de reclamações de vizinhos?
                </button>
                <div class="panel">
                    <p>R: Não é permitido nenhum tipo de festa ou barulho e todos os locatários já são avisados previamente, antes mesmo do acordo de locação, sobre as regras de convivência. 
                        No contrato também há uma cláusula específica para isso.
                        Em casos de reclamação deve-se entrar em contato imediatamente com o locatário para que as medidas cabíveis sejam tomadas
                    </p></div>
                <button class="accordion">10- Quais os meios de contato e formas de divulgação com os quais eu posso utilizar para compartilhar do Pedro Aluguéis para outras pessoas? E também qual meio eu devo usar para mais perguntas, reclamações e sugestões para que o Pedro Aluguéis melhore a cada dia mais e mais?

                </button>
                <div class="panel">
                    <p>R: Para compartilhar a Pedro Aluguéis qualquer pessoa pode utilizar o site da empresa ou os telefones disponíveis dos locatários. Para sugestões, reclamações ou dúvidas temos a aba de contato do site e também os telefones informados no site.
                    </p></div>
            </div>
            <div>
                <h3>Redes sociais e contatos</h3>
                <a href="#" target="_blank"> <img src="imagens/facebook.png" alt="some text" style="
                                                  width: 53px;
                                                  height: 50px;
                                                  "/></a>

                <a href="https://api.whatsapp.com/send?phone=5561982495498&text=Olá,%20meu%20amigo!" target="_blank"> <img src="imagens/whats.png" alt="some text" style="
                                                  width: 53px;
                                                  height: 50px;
                                                  "/></a>
                <button type="button" class="btn btn-primary">(61) 3358-9812</button>
            </div>



            <script>
                var acc = document.getElementsByClassName("accordion");
                var i;

                for (i = 0; i < acc.length; i++) {
                    acc[i].addEventListener("click", function() {
                        this.classList.toggle("active");
                        var panel = this.nextElementSibling;
                        if (panel.style.display === "block") {
                            panel.style.display = "none";
                        } else {
                            panel.style.display = "block";
                        }
                    });
                }
            </script>




    </body>
</html>
