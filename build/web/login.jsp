<%-- 
    Document   : login.jsp
    Created on : 14 nov 2024, 11:06:31
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"/>    
    <title>Corpusfit - Login</title>

    <link rel="stylesheet" href="css/login.css">
    
    <body>
        <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
            <div class="container">
              <div class="card login-card">
                <div class="row no-gutters">
                  <div class="col-md-5">
                    <img src="img/gallery/gallery-4.jpg" alt="login" class="login-card-img">
                  </div>
                  <div class="col-md-7">
                    <div class="card-body">
                      <div class="brand-wrapper">
                        <img src="img/logo.png" alt="logo" class="logo">
                      </div>
                      <p class="login-card-description">Inicia sesión en tu cuenta</p>
                      <form action="#!">
                        <div class="form-group">
                          <label for="email" class="sr-only">Usuario</label>
                          <input type="email" name="email" id="email" class="form-control" placeholder="Correo electronico">
                        </div>
                        <div class="form-group mb-4">
                          <label for="password" class="sr-only">Contraseña</label>
                          <input type="password" name="password" id="password" class="form-control" placeholder="Contraseña">
                        </div>
                        <input name="login" id="login" class="btn btn-block login-btn mb-4" type="button"
                          value="Iniciar sesion">

                        <!-- Botón para regresar al index -->
                        <a href="index.jsp" class="btn btn-black btn-block">Regresar al Inicio</a>
                      </form>
                      <br>
                      <p class="login-card-footer-text">¿No estás registrado? <br> Comunicate con la recepción del gimansio.
                      </p>

                    </div>
                  </div>
                </div>
              </div>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>

</html>
