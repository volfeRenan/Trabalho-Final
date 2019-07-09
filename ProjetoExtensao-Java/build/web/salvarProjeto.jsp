<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Projeto"%>
<%@page import="dao.ProjetoDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvando</title>
    </head>
    <body>
        
        <%
            try {
                Projeto proj = new Projeto();
                ProjetoDao projDao = new ProjetoDao();
                if(request.getParameter("txtNomeProjeto").equals("") || request.getParameter("txtObjGerProjeto").equals("")
                   || request.getParameter("txtObjEspProjeto").equals("") || request.getParameter("txtProfessor").equals("") 
                   || request.getParameter("txtCurso").equals("")){
                    
                        response.sendRedirect("viewNovoProjeto.jsp");
                        
                }else{
                    proj.setNomeProj(request.getParameter("txtNomeProjeto"));
                    proj.setObjGerProj(request.getParameter("txtObjGerProjeto"));
                    proj.setObjEspProj(request.getParameter("txtObjEspProjeto"));
                    proj.setProfessor(request.getParameter("txtProfessor"));
                    proj.setCurso(request.getParameter("txtCurso"));
                    projDao.salvarProj(proj);
                    response.sendRedirect("viewInicial.jsp");
                }
            } catch (Exception e) {
                throw new RuntimeException("Erro 4: " + e);
            }
        %>
        
    </body>
</html>
