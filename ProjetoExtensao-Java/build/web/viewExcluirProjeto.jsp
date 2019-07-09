<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projetos de Extensão - Excluir Projeto</title>
        <link rel="stylesheet" href="CSS/w3schools/style.css"/>

        <!--Style form-->
        <style>
                .gridForm{
                    margin: 60px;
                }
                .formLeft{
                    margin-left: 80px;
                    margin-bottom: 65px;
                }
                .btnExcluir{
                    float: right;
                    margin: 20px;
                    margin-top: 0
                }
            </style>

        </head>
    <body>
        <div class="w3-row">

            <!--Menu Lateral-->
            <div class="menuLateral w3-border-right w3-col s2">
                <div id="imgLogo">  
                    <img width="240" height="100" src="img/logoUsj.png"></img>
                </div>

                <div class="menu ">
                    <label>Vice-Reitora</label>
                    <a href="viewInicial.jsp" style="background-color: #C7CDD4"><img src="img/icon/projetos.png"/> Projetos</a>
                    <a href="viewConsultaGeral.jsp"><img src="img/icon/consulta.png"/> Consultas</a>
                </div>

                <div class="menuSair">
                    <a href="index.jsp">Sair <img src="img/icon/sair.png"/></a>
                </div>
            </div>
            <!--Fim menu lateral-->

                    <div class="container w3-white w3-col s10">  
                        <!--Titulo da Página-->
                        <header class="w3-black" id="home">
                            <div class=" w3-black">
                                <div class="titulo w3-black w3-center">
                                    <a class="w3-button" href="viewInicial.jsp" style="float: left"><img src="img/icon/voltar.png"/></a>                        
                                    <h4><b>Excluir Projeto</b></h4>
                                </div>
                            </div>
                        </header>
                        <!--Fim titulo da página-->

                        <form action="excluirProjeto.jsp" method="post">
                            <div class="gridForm w3-">
                                <div class="w3-col s3"><p></p></div>
                                <div class="w3-col s6 w3-card" style="background-color: #EEEBFF;">
                                    <div class="formLeft">
                                   <%
                                        //RelatorioDao relDao = new RelatorioDao();
                                        ProjetoDao projDao = new ProjetoDao();
                                        ArrayList<Projeto> listaPro = projDao.detalhesProjeto(Integer.parseInt(request.getParameter("idProj")));
                                        //ArrayList<Relatorio> listaRel = relDao.listarRelatorios(Integer.parseInt(request.getParameter("idProj"))); 

                                        for (int num = 0; num < listaPro.size(); num++) {
                                    %>
                                        <p>
                                            <span>Nome do Projeto</span>
                                            <input class="w3-input w3-border-bottom"  name="txtNomeProjeto" style="width: 250px" Readonly value="<%=request.getParameter("nomeProj")%>"/>
                                        </p>
                                        <p>
                                            <span>Professor:</span>
                                            <input class="w3-input w3-border-bottom" name="txtProfessor"  style="width: 250px" Readonly value="<%=request.getParameter("professor")%>"/>
                                        </p>
                                        <p>
                                            <span>Curso</span><br/>
                                            <input class="w3-input w3-border-bottom" name="txtCurso"  style="width: 250px" Readonly value="<%=request.getParameter("curso")%>"/>
                                            
                                        </p>
                                        <p>
                                            <span>Objetivo Geral do Projeto</span>
                                            <textarea class="w3-input w3-border-bottom" name="txtObjGerProjeto" Readonly style="width: 350px; height: 100px" ><%=request.getParameter("objGerProj")%></textarea>
                                        </p>
                                        <p>
                                            <span>Objetivo Especifico do Projeto</span>
                                            <textarea class="w3-input w3-border-bottom" name="txtObjEspProjeto" Readonly style="width: 350px"><%=request.getParameter("objEspProj")%></textarea>
                                        </p>
                                        <p>
                                            <span>Cod. do Projeto</span>
                                            <input class="w3-input w3-border-bottom" type="text" name="txtId" Readonly value="<%=request.getParameter("idProj")%>" style="width: 100px"/>
                                        </p>
                                        <input class="btnExcluir w3-btn w3-red" type="submit" value="Excluir"/>
                                        <%
                                            }
                                        %>          
                                    </div>
                                </div>
                                <div class="w3-col s3"><p></p></div>
                            </div>
                        </form>

                </div>

        </div>
    </body>
</html>
