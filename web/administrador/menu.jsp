<%-- 
    Document   : menu
    Created on : 17/11/2024, 5:15:19 p. m.
    Author     : Pc
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
                            <!-- Menú desplegable de Clientes -->
                            <li class="dropdown">
                                <a href="#">Clientes</a>
                                <ul class="dropdown-menu">
                                    <li><a href="gestionarAsistenciaActividad.jsp">Gestionar Asistencia Actividad</a></li>
                                    <li><a href="gestionarAsistenciaGeneral.jsp">Gestionar Asistencia General</a></li>
                                    <li><a href="gestionarClientes.jsp">Gestionar Clientes</a></li>
                                    <li><a href="gestionarLogin.jsp">Gestionar Login</a></li>

                                </ul>
                            </li>

                            <!-- Menú desplegable de Actividades -->
                            <li class="dropdown">
                                <a href="#">Actividades</a>
                                <ul class="dropdown-menu">
                                    <li><a href="gestionarActividadesDeportivas.jsp">Gestionar Actividades</a></li>
                                    <li><a href="gestionarInstructores.jsp">Gestionar Instructores</a></li>
                                    <li><a href="gestionarHorario.jsp">Gestionar Horarios</a></li>
                                </ul>
                            </li>
                            
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
    <!-- Header End -->
