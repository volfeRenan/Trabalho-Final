<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page import="model.Projeto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ProjetoDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv=”Content-Type” content=”text/html; charset=iso-8859-1″>
        <title>Projetos de Extensão - Inicial</title>
        <link rel="stylesheet" href="CSS/w3schools/style.css"/>
                
    </head>
    <body>

        <div class="w3-row">
            
            <div class="menuLateral w3-col s2 w3-border-right">
                
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
            
            <div class="container w3-col s10">  
                <!--Titulo da Página-->
                <header class="w3-black" id="home">
                    <div class=" w3-black">
                        <div class="titulo w3-black w3-center">
                            <a class="w3-button" style="float: left" href="viewNovoProjeto.jsp"><img src="img/icon/novoProjeto.png"/></a>                        
                            <h4><b>Projetos</b></h4>
                        </div>
                    </div>
                </header>
                <!--Fim titulo da página-->
                                
                <div class="w3-row-padding w3-padding-32 w3-margin-left w3-margin-right">
                    <div class="w3-row-padding w3-padding-32">
                <%
                    try{
                        
                        
                        ProjetoDao prd = new ProjetoDao();
                        ArrayList<Projeto> lista = prd.listarProjeto();
                            
                            for(int num=0; num < lista.size(); num ++){
                                out.print("<a href='viewDetalheProjeto.jsp?idProj="+ lista.get(num).getIdProj()+"'>");
                                out.print("<div class='w3-third w3-margin-bottom'>");
                                out.print("<div class='w3-card' style='width: 300px'>");
                                out.print("<div class='w3-center'>");
                                out.print("<h5 style ='background-color: #121689; margin: 0; color: white'><b>"+lista.get(num).getNomeProj()+"</b></h5>");
                                out.print("</div>");
                                out.print("<div class='w3-container' style='background-color: white'>");
                                out.print("<h6 style=''> Professor: "+lista.get(num).getProfessor()+"</h6>");
                                out.print("<h6 style=''> Curso: "+lista.get(num).getCurso()+"</h6>");
                                out.print("</div>");
                                out.print("<div class='w3-container w3-border-top' style ='background-color: white; '>");
                                out.print("<div class='w3-row' style='margin-top: 5px'>");
                                out.print("<div class='w3-col s6'>");
                                out.print("<a href='viewExcluirProjeto.jsp?idProj="+lista.get(num).getIdProj()+
                                            "&nomeProj="+lista.get(num).getNomeProj() +
                                            "&objGerProj="+lista.get(num).getObjGerProj()+
                                            "&objEspProj="+lista.get(num).getObjEspProj()+
                                            "&professor="+lista.get(num).getProfessor()+
                                            "&curso="+lista.get(num).getCurso()+
                                            "'><img src='img/icon/delete.svg'/></a> ");
                                out.print("</div>");
                                out.print("<div class='w3-col s6'>");
                                out.print("<a href='viewAlterarProjeto.jsp?idProj="+lista.get(num).getIdProj()+
                                            "&nomeProj="+lista.get(num).getNomeProj() +
                                            "&objGerProj="+lista.get(num).getObjGerProj()+
                                            "&objEspProj="+lista.get(num).getObjEspProj()+
                                            "&professor="+lista.get(num).getProfessor()+
                                            "&curso="+lista.get(num).getCurso()+
                                            "'><img style='float: right' src='img/icon/editar.svg'/></a>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</a>");
                           
                        }
                        
                    }catch(Exception erro){
                        throw new RuntimeException("Erro 10:" + erro);
                    }                  
                %>
                    </div>
                </div>
              
            </div>
            
        </div>
        
    </body>
</html>
