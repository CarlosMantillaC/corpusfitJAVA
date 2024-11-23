<%-- 
    Document   : gestionarInstructores
    Created on : 22/11/2024, 7:51:31 a. m.
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css">
    <jsp:include page="../head.jsp"/>
    <jsp:include page="menu.jsp"/>
    <title>Corpusfit - Admin Instructores</title>

    <body oncontextmenu='return false' class='snippet-body'>

        <div class="container-contact100">
            <div class="wrap-contact100">
                <form class="contact100-form validate-form" action="../InstructorServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Gestión de Instructores
                    </span>

                    <div class="wrap-input100">
                        <input class="input100" type="text" name="id_instructor" placeholder="ID del Instructor" maxlength="11"
                               value="${id_instructor != null ? id_instructor : ''}" id="id_instructor">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="text" name="nombre" placeholder="Nombre Completo" maxlength="100"
                               value="${nombre != null ? nombre : ''}" id="nombre">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="text" name="telefono" placeholder="Teléfono" maxlength="20"
                               value="${telefono != null ? telefono : ''}" id="telefono">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="email" name="email" placeholder="Correo Electrónico" maxlength="100"
                               value="${email != null ? email : ''}" id="email">
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
                let id_instructor = document.getElementById('id_instructor').value.trim();
                let nombre = document.getElementById('nombre').value.trim();
                let telefono = document.getElementById('telefono').value.trim();
                let email = document.getElementById('email').value.trim();

                if (accion === 'buscar' || accion === 'eliminar') {
                    if (!id_instructor) {
                        alert('Por favor, ingresa el ID del instructor.');
                        event.preventDefault();
                    }
                } else if (accion === 'registrar' || accion === 'modificar') {
                    if (!id_instructor || !nombre) {
                        alert('Por favor, completa al menos el ID del instructor y el nombre.');
                        event.preventDefault();
                    }
                }
            }

            function validarEliminar(event) {
                let id_instructor = document.getElementById('id_instructor').value.trim();
                if (!id_instructor) {
                    alert('Por favor, ingresa el ID del instructor para eliminar.');
                    event.preventDefault();
                } else if (!confirm('¿Estás seguro de que deseas eliminar este instructor?')) {
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

