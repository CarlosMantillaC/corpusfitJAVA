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
                <form class="contact100-form validate-form">
                    <span class="contact100-form-title">
                        Contact Us
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Please enter your name">
                        <input class="input100" type="text" name="name" placeholder="Full Name" required>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Please enter email: e@a.x">
                        <input class="input100" type="text" name="email" placeholder="Email" required>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Please enter your message">
                        <textarea class="input100" name="message" placeholder="Your Message" required></textarea>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="container-contact100-form-btn">
                        <button class="contact100-form-btn">
                            Send Email
                        </button>
                    </div>
                </form>

                <div class="contact100-more">
                    Contact our 24/7 call center: <span class="contact100-more-highlight">+001 345 6889</span>
                </div>
            </div>
        </div>

        <jsp:include page="../getintouch.jsp"/>
        <jsp:include page="../footer.jsp"/>
        <jsp:include page="../search.jsp"/>

    </body>

</html>
