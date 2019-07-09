<%@page import="dao.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Projeto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterando</title>
    </head>
    <body>
        
        <%
            try {
                Projeto proj = new Projeto();
                ProjetoDao projDao = new ProjetoDao();
                if(request.getParameter("txtNomeProjeto").equals("") || request.getParameter("txtObjGerProjeto").equals("")
                   || request.getParameter("txtObjEspProjeto").equals("") || request.getParameter("txtProfessor").equals("") 
                   || request.getParameter("txtCurso").equals("")){
                    
                        response.sendRedirect("viewInicial.jsp");
                        
                }else{
                    proj.setIdProj(Integer.parseInt(request.getParameter("txtId")));
                    proj.setNomeProj(request.getParameter("txtNomeProjeto"));
                    proj.setObjGerProj(request.getParameter("txtObjGerProjeto"));
                    proj.setObjEspProj(request.getParameter("txtObjEspProjeto"));
                    proj.setProfessor(request.getParameter("txtProfessor"));
                    proj.setCurso(request.getParameter("txtCurso"));
                    projDao.alterarProjeto(proj);
                    
                    response.sendRedirect("viewInicial.jsp");
                }
            } catch (Exception e) {
                throw new RuntimeException("Erro alteração: " + e);
            }
        %>
        
    </body>
</html>
