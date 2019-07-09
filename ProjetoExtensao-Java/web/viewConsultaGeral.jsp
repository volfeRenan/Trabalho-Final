<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projetos de Extensão - Consultar Projetos</title>
        <link rel="stylesheet" href="CSS/w3schools/style.css"/>
        
        <style>
            .projetos{
                margin-top: 150px;
                padding-left: 20px; 
            }
            .divConsulta{
                margin: 60px;
                margin-left: 50px;
                padding-left: 80px;
                position: fixed;
                background-color: #C7CDD4;
            }
            .btnFiltar{
                float: right;
                margin-left: 15px;
                margin-right: 250px;
            }
            .btnFiltar hover{
                background-color: #C7CDD4;
            }
        </style>
        
    </head>
    <body>
        <div class="w3-row">
            
            <!--Menu Lateral-->
            <div class="menuLateral w3-col s2 w3-border-right">
                <div id="imgLogo">  
                    <img width="240" height="100" src="img/logoUsj.png"></img>
                </div>
                
                <div class="menu">
                    <label>Vice-Reitora</label>
                    <a href="viewInicial.jsp"><img src="img/icon/projetos.png"/> Projetos</a>
                    <a href="viewConsultaGeral.jsp" style="background-color: #C7CDD4"><img src="img/icon/consulta.png"/> Consultas</a>
                </div>
                
                <div class="menuSair">
                    <a href="index.jsp">Sair <img src="img/icon/sair.png"/></a>
                </div>
            </div>
            <!--Fim menu lateral-->
            
            <div class="container w3-col s10"> 
                <!--Titulo da Página-->
                <header class="w3-black" id="home">
                    <div class=" w3-black">
                        <div class="titulo w3-black w3-center">
                            <a class="w3-button" href="viewInicial.jsp" style="float: left"><img src="img/icon/voltar.png"/></a>                        
                            <h4><b>Consultar Projetos</b></h4>
                        </div>
                    </div>
                </header>
                <!--Fim titulo da página-->
                
                <!--Div Consulta-->
                <div class="divConsulta w3-card">
                    <form action="" method="post">
                        <p style="float: left; margin-left: 350px;  margin-right: 50px;">
                            <span><b>Curso:</b></span><br/>
                            <select class="w3-select w3-border-bottom" name="txtCurso" style="width: 200px">
                                <option disabled selected>--Selecione um Curso--</option>
                                <option value="Ads">Ads</option>
                                <option value="Adm">Adm</option>
                                <option value="Pedagogia">Pedagogia</option>
                                <option value="Contabeis">Contabeis</option>
                            </select>
                        
                        <button class="btnFiltar w3-button" type="submit"><img src="img/icon/pesquisar.png"/></button>
                        </p>
                    </form>
                    
                </div>
                <!--Fim div consulta-->
                
                <div class="projetos w3-row-padding w3-padding-32 w3-margin-left w3-margin-right">
                    <div class="w3-row-padding w3-padding-32">
                    <%
                        try {
                                Projeto proj = new Projeto();
                                proj.setCurso(request.getParameter("txtCurso"));
                                ProjetoDao prd = new ProjetoDao();
                                ArrayList<Projeto> lista = prd.consultaProjeto(proj.getCurso());
                           
                            for(int num=0; num < lista.size(); num ++){
                                out.print("<a href='viewDetalheProjeto.jsp?idProj="+ lista.get(num).getIdProj()+"'>");
                                out.print("<div class='w3-third w3-margin-bottom'>");
                                out.print("<div class='w3-card' style='width: 300px'>");
                                out.print("<div class='w3-center'>");
                                out.print("<h5 style ='background-color: #121689; color: white; margin: 0;'>"+lista.get(num).getNomeProj()+"</h5>");
                                out.print("</div>");
                                out.print("<div class='w3-container' style='background-color: white'>");
                                out.print("<h6 style=''> Professor: "+lista.get(num).getProfessor()+"</h6>");
                                out.print("<h6 style=''> Curso: "+lista.get(num).getCurso()+"</h6>");
                                out.print("</div>");
                                out.print("<div class='w3-container' style ='background-color: white; border-top: groove;'>");
                                out.print("<div class='w3-row' style='margin-top: 5px'>");
                                out.print("<div class='w3-col s6'>");
                                out.print("<a href='#2' style='float: left'><img style='float: right' src='img/icon/delete.svg'/></a> ");
                                out.print("</div>");
                                out.print("<div class='w3-col s6'>");
                                out.print("<a href='#2'><img style='float: right' src='img/icon/editar.svg'/></a>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</a>");
                           
                        }
                        
                    }catch(Exception erro){
                        throw new RuntimeException("Erro 14:" + erro);
                    }                  
                %>
                    </div>
                </div>
                
            </div>
            
        </div>
                
    </body>
</html>
