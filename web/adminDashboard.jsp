<%-- 
    Document   : adminDashboard
    Created on : 14 nov 2024, 15:36:30
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession session_actual = request.getSession(false);
    String username = (String) session_actual.getAttribute("USER");
    String role = (String) session_actual.getAttribute("ROLE");

    // Redirigir a la página de login si no hay sesión activa
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Página Principal</title>
    </head>
    <body>
        <h1>Bienvenido a la página principal</h1>
        <h2>Usuario: <%= username %></h2>
        <h2>Rol: <%= role %></h2>
        
        <!-- Contenido adicional para el usuario -->
        <p>Este es el contenido de la página principal. Aquí puedes mostrar opciones específicas para cada rol.</p>

        <!-- Ejemplo: Mostrar diferentes opciones según el rol -->
        <%
            if ("administrador".equals(role)) {
        %>
                <h3>Opciones de administrador</h3>
                <ul>
                    <li>Gestionar usuarios</li>
                    <li>Ver reportes</li>
                    <li>Configurar el sistema</li>
                </ul>
        <%
            } else if ("cliente".equals(role)) {
        %>
                <h3>Opciones de cliente</h3>
                <ul>
                    <li>Ver perfil</li>
                    <li>Realizar compras</li>
                    <li>Historial de actividades</li>
                </ul>
        <%
            }
        %>
    </body>
</html>