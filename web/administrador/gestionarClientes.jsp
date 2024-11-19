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
                <form class="contact100-form validate-form" action="../ClienteServlet" method="post">
                    <span class="contact100-form-title">
                        Registro de Miembros
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Por favor, ingresa tu cedula">
                        <input class="input100" type="text" name="cedula" placeholder="Cedula" maxlength="100" required>
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Nombre -->
                    <div class="wrap-input100 validate-input" data-validate="Por favor, ingresa tu nombre">
                        <input class="input100" type="text" name="nombre" placeholder="Nombre Completo" maxlength="100" required>
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Teléfono -->
                    <div class="wrap-input100 validate-input" data-validate="Por favor, ingresa un número de teléfono válido">
                        <input class="input100" type="text" name="telefono" placeholder="Teléfono" maxlength="20">
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Email -->
                    <div class="wrap-input100 validate-input" data-validate="Por favor, ingresa un email válido: ejemplo@dominio.com">
                        <input class="input100" type="email" name="email" placeholder="Correo Electrónico" maxlength="100">
                        <span class="focus-input100"></span>
                    </div>

                    <!-- Botones de Acción -->
                    <div class="container-contact100-form-btn"  style="display: flex; gap: 20px; justify-content: center;">
                        <button class="contact100-form-btn" type="submit" name="accion" value="registrar">
                            Registrar
                        </button>
                        <button class="contact100-form-btn" type="button" name="accion" value="eliminar"">
                            Eliminar
                        </button>
                        <button class="contact100-form-btn" type="button" name="accion" value="buscar">
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

    </body>

</html>
