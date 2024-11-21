<%-- 
    Document   : gestionarClientes
    Created on : 18 nov 2024, 16:03:39
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forms.css" type="text/css">
    <jsp:include page="../head.jsp"/>
    <jsp:include page="menu.jsp"/>
    <title>Corpusfit - Admin</title>

    <body oncontextmenu='return false' class='snippet-body'>

        <div class="container-contact100">
            <div class="wrap-contact100">
                                <form class="contact100-form validate-form" action="../ClienteServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Registro de Miembros
                    </span>
                    
                    <div class="wrap-input100">
                        <input class="input100" type="text" name="cedula" placeholder="Cedula" maxlength="100"
                               value="${cedula != null ? cedula : ''}" id="cedula">
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
                        <button class="contact100-form-btn" type="button" name="accion" value="eliminar">
                            Eliminar
                        </button>
                        <button class="contact100-form-btn" type="submit" name="accion" value="buscar" onclick="validarFormulario(event, 'buscar')">
                            Buscar
                        </button>
                        <button class="contact100-form-btn" type="reset" name="accion" value="nuevo">
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
                // Limpiar mensajes previos
                let cedula = document.getElementById('cedula').value.trim();
                let nombre = document.getElementById('nombre').value.trim();
                let telefono = document.getElementById('telefono').value.trim();
                let email = document.getElementById('email').value.trim();

                // Validar campos según la acción
                if (accion === 'buscar') {
                    if (!cedula) {
                        alert('Por favor, ingresa la cédula para buscar.');
                        event.preventDefault();
                    }
                } else if (accion === 'registrar') {
                    if (!cedula || !nombre || !telefono || !email) {
                        alert('Por favor, completa todos los campos para registrar.');
                        event.preventDefault();
                    }
                }
            }
        </script>

    </body>

</html>
