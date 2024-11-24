<%-- 
    Document   : consultarAsistenciaActividad
    Created on : 24/11/2024, 10:40:36 a. m.
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="java.util.List"%>
<%@page import="DatabaseConnection.ModeloAsistenciaActividad"%>

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css">
    <style>
        .wrap-contact100 {
            max-width: 100%;
            width: 900px;
            padding: 30px;
            margin: 0 auto;
        }

        .tabla-asistencias {
            width: 100%;
            margin-top: 30px;
            overflow-x: auto;
            display: block;
        }

        .tabla-asistencias table {
            width: 100%;
            min-width: 600px;
            border-collapse: collapse;
            background-color: #fff;
        }

        .tabla-asistencias th {
            background-color: #666666;
            color: white;
            padding: 15px;
            text-align: left;
            border-bottom: 2px solid #ddd;
        }

        .tabla-asistencias td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }

        .tabla-asistencias tr:hover {
            background-color: #f5f5f5;
        }

        @media screen and (max-width: 768px) {
            .wrap-contact100 {
                padding: 15px;
            }
        }
    </style>
    <jsp:include page="../head.jsp"/>
    <jsp:include page="menu.jsp"/>
    <title>Corpusfit - Consulta de Asistencia Actividad</title>

    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container-contact100">
            <div class="wrap-contact100">
                <form class="contact100-form validate-form" action="../ConsultarAsistenciaActividadServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Consulta de Asistencia Actividad
                    </span>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_miembro" placeholder="ID Miembro" 
                               value="<%= request.getAttribute("id_miembro") != null ? request.getAttribute("id_miembro") : ""%>" 
                               id="id_miembro">
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Botones de Acción -->
                    <div class="container-contact100-form-btn" style="display: flex; gap: 20px; justify-content: center;">
                        <button class="contact100-form-btn" type="submit" name="accion" value="consultarAsistencias" onclick="validarConsulta(event)">
                            Consultar
                        </button>
                        <button class="contact100-form-btn" type="submit" name="accion" value="nuevo">
                            Nuevo
                        </button>
                    </div>
                </form>

                <!-- Tabla de resultados -->
                <%
                    List<ModeloAsistenciaActividad> asistencias = (List<ModeloAsistenciaActividad>) session.getAttribute("asistencias");
                    if (asistencias != null && !asistencias.isEmpty()) {
                %>
                <div class="tabla-asistencias">
                    <table>
                        <thead>
                            <tr>
                                <th>ID Asistencia</th>
                                <th>ID Miembro</th>
                                <th>ID Sesión</th>
                                <th>Fecha</th>
                                <th>Presente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ModeloAsistenciaActividad asistencia : asistencias) {
                            %>
                            <tr>
                                <td><%= asistencia.getIdAsistencia() %></td>
                                <td><%= asistencia.getIdMiembro() %></td>
                                <td><%= asistencia.getIdSesion() %></td>
                                <td><%= asistencia.getFechaAsistencia() %></td>
                                <td><%= asistencia.isPresente() ? "Sí" : "No" %></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
        </div>

        <jsp:include page="../getintouch.jsp"/>
        <jsp:include page="../footer.jsp"/>
        <jsp:include page="../search.jsp"/>

        <script>
            function validarConsulta(event) {
                let id_miembro = document.getElementById('id_miembro').value.trim();

                if (!id_miembro) {
                    alert('Por favor, ingresa el ID del miembro para consultar.');
                    event.preventDefault();
                }
            }
        </script>

        <%
            String mensaje = (String) session.getAttribute("mensaje");
            if (mensaje != null && !mensaje.isEmpty()) {
                session.removeAttribute("mensaje");
        %>
        <script>
            alert("<%= mensaje%>");
        </script>
        <%
            }
        %>
    </body>
</html>