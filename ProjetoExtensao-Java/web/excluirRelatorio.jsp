<%@page import="dao.*"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Relatorio"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterando</title>
    </head>
    <body>
        
        <%
            try {
                Relatorio rel = new Relatorio();
                RelatorioDao relDao = new RelatorioDao();
                if(request.getParameter("txtData").equals("") || request.getParameter("txtAtividades").equals("")){
                    
                        response.sendRedirect("viewAlterarRelatorio.jsp");
                        
                }else{
                    rel.setIdRel(Integer.parseInt(request.getParameter("txtIdRel")));
                    rel.setFkProjeto(Integer.parseInt(request.getParameter("fkProj")));
                    rel.setDataRel(request.getParameter("txtData"));
                    rel.setAtividadeRel(request.getParameter("txtAtividades"));
                    relDao.deleterRelatorio(rel.getIdRel());
                    
                    response.sendRedirect("viewDetalheProjeto.jsp?idProj=" + rel.getFkProjeto());
                }
            } catch (Exception e) {
                throw new RuntimeException("Erro alteração relatório: " + e);
            }
        %>
        
    </body>
</html>
