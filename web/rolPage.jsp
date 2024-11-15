<%-- 
    Document   : rolPage
    Created on : 14 nov 2024, 22:19:17
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession session_actual = request.getSession(false);
    String username = (String) session_actual.getAttribute("USER");
    String role = (String) session_actual.getAttribute("ROLE");

    // Redirigir según el rol
        if ("administrador".equals(role)) {
            response.sendRedirect("administrador/index.jsp");  // Redirige al index del administrador
            return;  // Detener la ejecución del código JSP
        } else if ("cliente".equals(role)) {
            response.sendRedirect("cliente/index.jsp");
            return;  // Detener la ejecución del código JSP
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
