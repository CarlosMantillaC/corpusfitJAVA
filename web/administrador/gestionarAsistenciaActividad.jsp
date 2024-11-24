<%-- 
    Document   : gestionarAsistenciaActividad
    Created on : 24/11/2024, 9:24:33 a. m.
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
                <form class="contact100-form validate-form" action="../AsistenciaActividadServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Control de Asistencia de Actividades
                    </span>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_asistencia" placeholder="ID Asistencia" 
                               value="${id_asistencia != null ? id_asistencia : ''}" id="id_asistencia">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_miembro" placeholder="ID Miembro"
                               value="${id_miembro != null ? id_miembro : ''}" id="id_miembro">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_sesion" placeholder="ID Sesión"
                               value="${id_sesion != null ? id_sesion : ''}" id="id_sesion">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="date" name="fecha_asistencia" placeholder="Fecha de Asistencia"
                               value="${fecha_asistencia != null ? fecha_asistencia : ''}" id="fecha_asistencia">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <select class="input100" name="presente" id="presente">
                            <option value="1" ${presente == '1' ? 'selected' : ''}>Presente</option>
                            <option value="0" ${presente == '0' ? 'selected' : ''}>Ausente</option>
                        </select>
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
                let id_asistencia = document.getElementById('id_asistencia').value.trim();
                let id_miembro = document.getElementById('id_miembro').value.trim();
                let id_sesion = document.getElementById('id_sesion').value.trim();
                let fecha_asistencia = document.getElementById('fecha_asistencia').value.trim();
                let presente = document.getElementById('presente').value.trim();

                // Validar campos según la acción
                if (accion === 'buscar') {
                    if (!id_asistencia) {
                        alert('Por favor, ingresa el ID de asistencia para buscar.');
                        event.preventDefault();
                    }
                } else if (accion === 'registrar' || accion === 'modificar') {
                    if (!id_asistencia || !id_miembro || !id_sesion || !fecha_asistencia) {
                        alert('Por favor, completa todos los campos obligatorios.');
                        event.preventDefault();
                    }
                }
            }

            function validarEliminar(event) {
                let id_asistencia = document.getElementById('id_asistencia').value.trim();

                if (!id_asistencia) {
                    alert('Por favor, ingresa el ID de asistencia para eliminar.');
                    event.preventDefault();
                } else if (!confirm('¿Estás seguro de que deseas eliminar este registro de asistencia?')) {
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