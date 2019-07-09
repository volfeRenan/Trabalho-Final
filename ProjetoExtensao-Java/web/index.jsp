<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto de Extensão - Login</title>
        
        <link rel="stylesheet" href="CSS/w3schools/style.css"/>
        
        <style>
            #gridLogin *{border: none !important; margin-left: 20px; margin-right: 20px}
            #imgLogo {margin-top: 20px; }
            #lblTitulo {text-align: center; color: #121689; font-weight: bold; margin: 15px}
            #lblLogin {font-weight: bold; float: left; font-size: 18px;}
            #lblSenha {font-weight: bold; float: left; font-size: 18px; margin-top: 15px}
            #btnEntar { margin-bottom: 25px; margin-top: 25px; margin-right: 25px; padding: 10px; background: #41B62E; float: right;}
            body{background-color: #C7CDD4; margin-top: 80px}
        </style>
    
    </head>
    <body>
        
        <div class="w3-row">
            <div class="w3-col s4 w3-center"><p> </p></div>
            <div class="w3-col s4 w3-white w3-center">
                <form action="login.jsp" method="post">
                
                    <img id="imgLogo" src="img/logoUsj.png"></img>

                    <h5 id="lblTitulo">PPROJETOS DE EXTENSÃO</h5>
                    
                    <div style="margin: 15px; margin-left: 50px; margin-right: 50px">
                        <label id="lblLogin" for="txtLogin" style="">Login</label>
                        <input id="txtLogin" name="login" class="w3-input w3-border-bottom" type="text"/>

                        <label id="lblSenha" for="txtSenha" style="">Senha</label>
                        <input id="txtSenha" name="senha" class="w3-input w3-border-bottom" type="password"/>
                    </div>
                    <input id="btnEntar" class="w3-btn w3-green" type="submit" value="Entrar"/>
                
                </form>
            </div>
            <div class="w3-col s3 w3-center"></div>
        </div>
        
        
    </body>
</html>
