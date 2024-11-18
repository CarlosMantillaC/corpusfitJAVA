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
    <jsp:include page="../head.jsp"/>
    <jsp:include page="menu.jsp"/>
    <title>Corpusfit - Admin</title>

    <body>
        <!-- Hero Section Begin-->
        <section class="hero-section">
            <div class="hs-slider owl-carousel">
                <div class="hs-item" style="background: linear-gradient(to bottom, rgba(0, 0, 0, 0.4) 60%, rgba(0, 0, 0, 1) 100%), url('../img/hero/admin-1.jpg') center/cover no-repeat;">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-6">
                                <div class="hi-text">
                                    <h1>¡Bienvenido <strong><%= session_actual.getAttribute("NOMBRE_USUARIO") %></strong>!</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- Hero Section End -->
     


        <jsp:include page="../getintouch.jsp"/>
        <jsp:include page="../footer.jsp"/>
        <jsp:include page="../search.jsp"/>

    </body>
</html>