<%-- 
    Document   : menu
    Created on : 18 nov 2024, 13:32:12
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menuadminclien.css" type="text/css">


<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Offcanvas Menu Section Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="canvas-close">
        <i class="fa fa-close"></i>
    </div>
    <div class="canvas-search search-switch">
        <i class="fa fa-search"></i>
    </div>
    <nav class="canvas-menu mobile-menu">
        <ul>
            <li><a href="./index.jsp">Inicio</a></li>
            <li><a href="../login.jsp">Cerrar Sesión</a></li>

        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>

</div>
<!-- Offcanvas Menu Section End -->

<!-- Header Section Begin -->
<header class="header-section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                <div class="logo">
                    <a href="./index.jsp">
                        <img src="../img/logo.png" alt="">
                    </a>
                </div>
            </div>
            <div class="col-lg-8">
                <nav class="nav-menu">
                    <ul>
                        <li><a href="./index.jsp">Inicio</a></li>                   
                        <li><a href="gestionarInscripciones.jsp">Inscribirse</a></li>
                        <li><a href="consultarAsistenciaActividad.jsp">Asistencia actividad</a></li>
                        <li><a href="consultarAsistenciaGeneral.jsp">Asistencia general</a></li>
                        <li><a href="../login.jsp">Cerrar Sesión</a></li>

                    </ul>
                </nav>
            </div>
        </div>
        <div class="canvas-open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
