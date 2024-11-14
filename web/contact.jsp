<%-- 
    Document   : contact.jsp
    Created on : 14 nov 2024, 10:51:53
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <jsp:include page="head.jsp"/>    
    <jsp:include page="menu.jsp"/>    
    <title>Corpusfit - Contacto</title>

    <body>

         <!-- Breadcrumb Section Begin -->
         <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb-bg.jpg">
             <div class="container">
                 <div class="row">
                     <div class="col-lg-12 text-center">
                         <div class="breadcrumb-text">
                             <h2>Contáctanos</h2>
                             <div class="bt-option">
                                 <a href="./index.jsp">Inicio</a>
                                 <span>Contáctanos</span>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </section>
         <!-- Breadcrumb Section End -->

         <!-- Contact Section Begin -->
         <section class="contact-section spad">
             <div class="container">
                 <div class="row justify-content-center">
                     <div class="col-lg-6">
                         <div class="leave-comment">
                             <form id="contactForm">
                                 <div class="form-group">
                                     <input type="text" class="form-control mb-3" id="name" placeholder="Nombre">
                                 </div>
                                 <div class="form-group">
                                     <input type="email" class="form-control mb-3" id="email" placeholder="Email">
                                 </div>
                                 <div class="form-group">
                                     <input type="text" class="form-control mb-3" id="numero" placeholder="Número">
                                 </div>
                                 <div class="form-group">
                                     <textarea class="form-control mb-3" id="comment" placeholder="Comentario"></textarea>
                                 </div>
                                 <button type="button" class="btn btn-primary" onclick="submitForm()">Enviar</button>
                             </form>
                         </div>
                     </div>
                 </div>
             </div>
         </section>
         <!-- Contact Section End -->

         <script>
             function submitForm() {
                 var name = document.getElementById('name').value;
                 var email = document.getElementById('email').value;
                 var numero = document.getElementById('numero').value;
                 var comment = document.getElementById('comment').value;

                 var mailtoLink = 'mailto:support.gymcenter@gmail.com'
                     + '?subject=Formulario de Contacto'
                     + '&body=Nombre: ' + encodeURIComponent(name)
                     + '%0D%0AEmail: ' + encodeURIComponent(email)
                     + '%0D%0ANúmero: ' + encodeURIComponent(numero)
                     + '%0D%0AComentario: ' + encodeURIComponent(comment);

                 window.location.href = mailtoLink;
             }
         </script>
        
        <jsp:include page="getintouch.jsp"/>
        <jsp:include page="footer.jsp"/>
        <jsp:include page="search.jsp"/>

       

    </body>

</html>
