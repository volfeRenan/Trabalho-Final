<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projetos de Extensão - Detalhes do Projeto</title>
        <link rel="stylesheet" href="CSS/w3schools/style.css"/>

        <!--Style form-->
        <style>
                .gridForm{
                    margin: 60px;
                    margin-top: 70px;
                    height: 567px;
                }
                .formLeft{
                    margin-bottom: 65px;
                    padding: 25px;
                    padding-top: 15px;
                    position: fixed;
                    background-color: #EEEBFF;
                }
                .btnSalvar{
                    float: right;
                    margin: 25px
                }
                .divRelatorio{    
                    margin-left: 400px;
                    padding-left: 50px;
                    padding-right: 50px;
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

                <div class="menu">
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
                                    <h4><b>Projeto Detalhado</b></h4>
                                </div>
                            </div>
                        </header>
                        <!--Fim titulo da página-->

                        
                        <div class="gridForm w3-row">
                            <form action="" method="post">
                                <div class="w3-col s6 w3-card" style="background-color: #EEEBFF;">
                                    <div class="formLeft">
                                    <%
                                        ProjetoDao projDao = new ProjetoDao();
                                        ArrayList<Projeto> listaPro = projDao.detalhesProjeto(Integer.parseInt(request.getParameter("idProj")));
                                        
                                        for (int num = 0; num < listaPro.size(); num++) {
                                    %>
                                        <p>
                                            <span>Nome do Projeto</span>
                                            <input class="w3-input w3-border-bottom"  name="txtNomeProjeto" style="width: 250px" Readonly value="<%out.print(listaPro.get(num).getNomeProj());%>"/>
                                        </p>
                                        <p>
                                            <span>Professor:</span>
                                            <input class="w3-input w3-border-bottom" name="txtProfessor"  style="width: 250px" Readonly value="<%out.print(listaPro.get(num).getProfessor());%>"/>
                                        </p>
                                        <p>
                                            <span>Curso</span><br/>
                                            <input class="w3-input w3-border-bottom" name="txtCurso"  style="width: 250px" Readonly value="<%out.print(listaPro.get(num).getCurso());%>"/>
                                        </p>
                                        <p>
                                            <span>Objetivo Geral do Projeto</span>
                                            <textarea class="w3-input w3-border-bottom" name="txtObjGerProjeto" style="width: 350px; height: 100px" Readonly><%out.print(listaPro.get(num).getObjGerProj());%></textarea>
                                        </p>
                                        <p>
                                            <span>Objetivo Especifico do Projeto</span>
                                            <textarea class="w3-input w3-border-bottom" name="txtObjEspProjeto" style="width: 350px" Readonly><%out.print(listaPro.get(num).getObjEspProj());%></textarea>
                                        </p>
                                        <%
                                            }
                                        %>          
                                    </div>
                                </div>
                            </form>
                            <div class="divRelatorio w3-white w3-col s6">
                                <h5 class="w3-center w3-border-bottom"><b>Relatórios Mensais</b></h5><br/>
                            <%
                                try {
                                                                        
                                    RelatorioDao relDAO = new RelatorioDao();
                                    ArrayList<Relatorio> listaRel = relDAO.listarRelatorios(Integer.parseInt(request.getParameter("idProj")));
                                    out.print("<div class='relatorio'>");
                                    out.print("<table>");
                                    out.print("<tr>");
                                    out.print("<h6><b>Data</b></h6>");
                                    for (int num = 0; num < listaPro.size(); num++) {
                                    out.print("<p>");
                                    out.print("<a href='viewNovoRelatorio.jsp?idProj="+listaPro.get(num).getIdProj()+
                                        "&nomeProj="+listaPro.get(num).getNomeProj() +
                                        "&objGerProj="+listaPro.get(num).getObjGerProj()+
                                        "&objEspProj="+listaPro.get(num).getObjEspProj()+
                                        "&professor="+listaPro.get(num).getProfessor()+
                                        "&curso="+listaPro.get(num).getCurso()+
                                        "'><img style='float: right; margin-top: 20px;' src='img/icon/addRelatorio.png'/></a>");
                                    out.print("</p>");
                                    }
                                    for (int n = 0; n < listaRel.size(); n++) {
                                    
                                        out.print("<tr>");
                                        out.print("<td>" + listaRel.get(n).getDataRel()+ "</td>");
                                        out.print("<td><a href='viewDetalheRelatorio.jsp?idRel=" + listaRel.get(n).getIdRel()
                                                + "&atividadeRel=" + listaRel.get(n).getAtividadeRel()
                                                + "&dataRel=" + listaRel.get(n).getDataRel()
                                                + "&fkProj=" + listaRel.get(n).getFkProjeto()
                                                + "'><img src='img/icon/visualizar.svg'/></a></td>");
                                        out.print("<td><a href='viewAlterarRelatorio.jsp?idRel=" + listaRel.get(n).getIdRel()
                                                + "&atividadeRel=" + listaRel.get(n).getAtividadeRel()
                                                + "&dataRel=" + listaRel.get(n).getDataRel()
                                                + "&fkProj=" + listaRel.get(n).getFkProjeto()
                                                + "'><img src='img/icon/editar.svg'/></a></td>");
                                        out.print("<td><a  href='viewExcluirRelatorio.jsp?idRel=" + listaRel.get(n).getIdRel()
                                                + "&atividadeRel=" + listaRel.get(n).getAtividadeRel()
                                                + "&dataRel=" + listaRel.get(n).getDataRel()
                                                + "&fkProj=" + listaRel.get(n).getFkProjeto()
                                                + "'><img src='img/icon/delete.svg'/></a></td>");
                                    }
                                    out.print("</table>");
                                    out.print("</div>");
                                    
                                } catch (Exception erro) {
                                    throw new RuntimeException("Erro na listagem de relatorios:" + erro);
                                }
                            %>
                            </div>
                            </div>
                    </div>
        </div>
    </body>
</html>
