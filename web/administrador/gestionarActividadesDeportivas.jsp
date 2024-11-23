<%-- 
    Document   : gestionarActividadesDeportivas
    Created on : 23/11/2024, 12:32:48 p. m.
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
                <form class="contact100-form validate-form" action="../ActividadDeportivaServlet" method="post" id="formulario">
                    <span class="contact100-form-title">
                        Gestión de Actividades Deportivas
                    </span>


                    <div class="wrap-input100">
                        <input class="input100" type="text" name="nombre" placeholder="Nombre de la Actividad" maxlength="100"
                               value="${nombre != null ? nombre : ''}" id="nombre">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <textarea class="input100" name="descripcion" placeholder="Descripción" 
                                  id="descripcion">${descripcion != null ? descripcion : ''}</textarea>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="text" name="tipo" placeholder="Tipo de Actividad" maxlength="50"
                               value="${tipo != null ? tipo : ''}" id="tipo">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <select class="input100" name="nivel_dificultad" id="nivel_dificultad">
                            <option value="" disabled selected>Seleccione el nivel de dificultad</option>
                            <option value="Básico" ${nivel_dificultad == 'Básico' ? 'selected' : ''}>Básico</option>
                            <option value="Intermedio" ${nivel_dificultad == 'Intermedio' ? 'selected' : ''}>Intermedio</option>
                            <option value="Avanzado" ${nivel_dificultad == 'Avanzado' ? 'selected' : ''}>Avanzado</option>
                        </select>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100">
                        <input class="input100" type="text" name="id_instructor" placeholder="ID del Instructor" maxlength="11"
                               value="${id_instructor != null ? id_instructor : ''}" id="id_instructor">
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
                let nombre = document.getElementById('nombre').value.trim();
                let nivel_dificultad = document.getElementById('nivel_dificultad').value.trim();

                if (accion === 'buscar' || accion === 'eliminar') {
                    if (!nombre) {
                        alert('Por favor, ingresa el Nombre de la actividad.');
                        event.preventDefault();
                    }
                } else if (accion === 'registrar' || accion === 'modificar') {
                    if (!nombre || !nivel_dificultad) {
                        alert('Por favor, completa los campos obligatorios (nombre y nivel de dificultad).');
                        event.preventDefault();
                    }
                }
            }

            function validarEliminar(event) {
                let nombre = document.getElementByNombre('nombre').value.trim();
                if (!nombre) {
                    alert('Por favor, ingresa el nombre de la actividad para eliminar.');
                    event.preventDefault();
                } else if (!confirm('¿Estás seguro de que deseas eliminar esta actividad?')) {
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