<%-- 
    Document   : gestionarLogin
    Created on : 23/11/2024, 6:58:29 a. m.
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>

<html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css">
    <jsp:include page="../head.jsp"/>
    <jsp:include page="menu.jsp"/>
    <title>Corpusfit - Admin Usuarios</title>

    <body oncontextmenu='return false' class='snippet-body'>

        <div class="container-contact100">
            <div class="wrap-contact100">
                <form class="contact100-form validate-form" action="../FLoginServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Gestión de Login
                    </span>

                    <!-- Username -->
                    <div class="wrap-input100">
                        <input class="input100" type="text" name="username" placeholder="Correo" maxlength="50"
                               value="${username != null ? username : ''}" id="username">
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Contraseña -->
                    <div class="wrap-input100">
                        <input class="input100" type="password" name="password" placeholder="Contraseña" maxlength="255"
                               value="${password != null ? password : ''}" id="password">
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Nombre -->
                    <div class="wrap-input100">
                        <input class="input100" type="text" name="nombre" placeholder="Nombre Completo" maxlength="200"
                               value="${nombre != null ? nombre : ''}" id="nombre">
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Rol -->
                    <div class="wrap-input100">
                        <select name="rol" id="rol">
                            <option value="" disabled selected>Selecciona un rol</option>
                            <option value="cliente" ${rol == "cliente" ? "selected" : ""}>Cliente</option>
                            <option value="administrador" ${rol == "administrador" ? "selected" : ""}>Administrador</option>
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
                let id_usuario = document.getElementById('id_usuario').value.trim();
                let nombre = document.getElementById('nombre').value.trim();
                let username = document.getElementById('username').value.trim();
                let password = document.getElementById('password').value.trim();
                let rol = document.getElementById('rol').value.trim();

                if (accion === 'buscar' || accion === 'eliminar') {
                    if (!id_usuario) {
                        alert('Por favor, ingresa el ID del usuario para continuar.');
                        event.preventDefault();
                    }
                } else if (accion === 'registrar' || accion === 'modificar') {
                    if (!id_usuario || !nombre || !username || !password || !rol) {
                        alert('Por favor, completa todos los campos para registrar.');
                        event.preventDefault();
                    }
                }
            }

            function validarEliminar(event) {
                let id_usuario = document.getElementById('id_usuario').value.trim();
                if (!id_usuario) {
                    alert('Por favor, ingresa el ID del usuario para eliminar.');
                    event.preventDefault();
                } else if (!confirm('¿Estás seguro de que deseas eliminar este usuario?')) {
                    event.preventDefault();
                }
            }
        </script>

        <%
            // Mostrar mensajes desde la sesión
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