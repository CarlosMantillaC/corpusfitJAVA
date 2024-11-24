<%-- 
    Document   : gestionarInscripciones
    Created on : 24/11/2024, 9:54:23 a. m.
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
                <form class="contact100-form validate-form" action="../InscripcionesServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Gestión de Inscripciones
                    </span>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_inscripcion" placeholder="ID Inscripción" 
                               value="${id_inscripcion != null ? id_inscripcion : ''}" id="id_inscripcion">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_miembro" placeholder="ID Miembro"
                               value="${id_miembro != null ? id_miembro : ''}" id="id_miembro">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="number" name="id_actividad" placeholder="ID Actividad"
                               value="${id_actividad != null ? id_actividad : ''}" id="id_actividad">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="date" name="fecha_inscripcion" placeholder="Fecha de Inscripción"
                               value="${fecha_inscripcion != null ? fecha_inscripcion : ''}" id="fecha_inscripcion">
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
                let id_inscripcion = document.getElementById('id_inscripcion').value.trim();
                let id_miembro = document.getElementById('id_miembro').value.trim();
                let id_actividad = document.getElementById('id_actividad').value.trim();
                let fecha_inscripcion = document.getElementById('fecha_inscripcion').value.trim();

                // Validar campos según la acción
                if (accion === 'buscar') {
                    if (!id_inscripcion) {
                        alert('Por favor, ingresa el ID de inscripción para buscar.');
                        event.preventDefault();
                    }
                } else if (accion === 'registrar' || accion === 'modificar') {
                    if (!id_inscripcion || !id_miembro || !id_actividad || !fecha_inscripcion) {
                        alert('Por favor, completa todos los campos obligatorios.');
                        event.preventDefault();
                    }
                }
            }

            function validarEliminar(event) {
                let id_inscripcion = document.getElementById('id_inscripcion').value.trim();

                if (!id_inscripcion) {
                    alert('Por favor, ingresa el ID de inscripción para eliminar.');
                    event.preventDefault();
                } else if (!confirm('¿Estás seguro de que deseas eliminar esta inscripción?')) {
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
