<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Salvando</title>
    </head>
    <body>
        
        <%
            try {
                Relatorio rel = new Relatorio();
                RelatorioDao relDao = new RelatorioDao();
                
                if(request.getParameter("txtAtividades").equals("") || request.getParameter("txtData").equals("")){
                        rel.setFkProjeto((Integer.parseInt(request.getParameter("txtIdFk"))));
                        response.sendRedirect("viewNovoRelatorio.jsp?idProj="+rel.getFkProjeto());
                        
                }else{
                    rel.setAtividadeRel(request.getParameter("txtAtividades"));
                    rel.setDataRel(request.getParameter("txtData"));
                    rel.setFkProjeto((Integer.parseInt(request.getParameter("txtIdFk"))));
                    relDao.salvarRel(rel);
                    response.sendRedirect("viewDetalheProjeto.jsp?idProj="+rel.getFkProjeto());
                }
            } catch (Exception e) {
                throw new RuntimeException("Erro 8: " + e);
            }
        %>
        
    </body>
</html>
