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
                if(request.getParameter("login").equals("admin")&& request.getParameter("senha").equals("1234")){
                    
                    response.sendRedirect("viewInicial.jsp");
                        
                }else{
                    response.sendRedirect("index.jsp");
                }
            } catch (Exception e) {
                throw new RuntimeException("Erro 15: " + e);
            }
        %>
        
    </body>
</html>
