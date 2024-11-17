<%-- 
    Document   : index.jsp
    Created on : 14 nov 2024, 21:25:43
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession session_actual = request.getSession(false);  // Recupera la sesión
    String role = (String) session_actual.getAttribute("ROLE");

    // Verificar si el usuario tiene rol de administrador
    if (role == null || !role.equals("administrador")) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");  // Redirige si no tiene rol adecuado
        return;
    }
%>
<!DOCTYPE html>
<html>
    <!-- Incluir el head -->
    <jsp:include page="head.jsp"/>
    <jsp:include page="menu.jsp"/>

    <body>
        <!-- Incluir el menú -->
        
        <main>
            <h1>Bienvenido al sistema Corpusfit</h1>
            <p>Contenido principal de la página aquí.</p>
        </main>
    </body>
</html>