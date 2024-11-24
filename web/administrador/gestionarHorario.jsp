<%-- 
    Document   : gestionarHorario
    Created on : 24/11/2024, 9:11:29 a. m.
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css">
    <jsp:include page="../head.jsp"/>
    <jsp:include page="menu.jsp"/>
    <title>Corpusfit - Admin</title>

    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container-contact100">
            <div class="wrap-contact100">
                <form class="contact100-form validate-form" action="../HorarioServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Registro de Horarios de Actividad
                    </span>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_sesion" placeholder="ID Sesión" 
                               value="${id_sesion != null ? id_sesion : ''}" id="id_sesion">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_actividad" placeholder="ID Actividad"
                               value="${id_actividad != null ? id_actividad : ''}" id="id_actividad">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="date" name="fecha" placeholder="Fecha"
                               value="${fecha != null ? fecha : ''}" id="fecha">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="time" name="hora_inicio" placeholder="Hora de Inicio"
                               value="${hora_inicio != null ? hora_inicio : ''}" id="hora_inicio">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="time" name="hora_fin" placeholder="Hora de Fin"
                               value="${hora_fin != null ? hora_fin : ''}" id="hora_fin">
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Botones de Acción -->
                    <div class="container-contact100-form-btn" style="display: flex; gap: 20px; justify-content: center;">
                        <button class="contact100-form-btn" type="submit" name="accion" value="registrar" onclick="validarFormulario(event, 'registrar')">
                            Registrar
                        </button>
                        <button class="contact100-form-btn" type="submit" name="accion" value="modificar" onclick="validarFormulario(event, 'modificar')">
                            Modificar
                        </button>
                        <button class="contact100-form-btn" type="submit" name="accion" value="eliminar" onclick="validarEliminar(event)">
                            Eliminar
                        </button>
                        <button class="contact100-form-btn" type="submit" name="accion" value="buscar" onclick="validarFormulario(event, 'buscar')">
                            Buscar
                        </button>
                        <button class="contact100-form-btn" type="submit" name="accion" value="nuevo">
                            Nuevo
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <jsp:include page="../getintouch.jsp"/>
        <jsp:include page="../footer.jsp"/>
        <jsp:include page="../search.jsp"/>

        <script>
            function validarFormulario(event, accion) {
                let id_sesion = document.getElementById('id_sesion').value.trim();
                let id_actividad = document.getElementById('id_actividad').value.trim();
                let fecha = document.getElementById('fecha').value.trim();
                let hora_inicio = document.getElementById('hora_inicio').value.trim();
                let hora_fin = document.getElementById('hora_fin').value.trim();

                // Validar campos según la acción
                if (accion === 'buscar') {
                    if (!id_sesion) {
                        alert('Por favor, ingresa el ID de sesión para buscar.');
                        event.preventDefault();
                    }
                } else if (accion === 'registrar' || accion === 'modificar') {
                    if (!id_sesion || !id_actividad || !fecha || !hora_inicio || !hora_fin) {
                        alert('Por favor, completa todos los campos.');
                        event.preventDefault();
                    }
                    // Validar que hora_fin sea mayor que hora_inicio
                    if (hora_inicio && hora_fin) {
                        if (hora_fin <= hora_inicio) {
                            alert('La hora de fin debe ser posterior a la hora de inicio.');
                            event.preventDefault();
                        }
                    }
                }
            }

            function validarEliminar(event) {
                let id_sesion = document.getElementById('id_sesion').value.trim();

                if (!id_sesion) {
                    alert('Por favor, ingresa el ID de sesión para eliminar.');
                    event.preventDefault();
                } else if (!confirm('¿Estás seguro de que deseas eliminar este horario?')) {
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