<%-- 
    Document   : footer.jsp
    Created on : 14 nov 2024, 09:24:57
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <!-- Footer Section Begin -->
    <section class="footer-section">
        <div class="container">
            <div class="row justify-content-center text-center">
                <div class="col-lg-6">
                    <div class="fs-about">
                        <div class="fa-logo mb-3">
                            <a href="#"><img src="${pageContext.request.contextPath}/img/logo.png" alt="" class="img-fluid"></a>
                        </div>
                        <p>Es fundamental cuidar a cada persona y seguir su proceso de entrenamiento,
                            especialmente en los momentos más desafiantes. Durante estos, puede surgir incomodidad,
                            pero al superar los obstáculos, es cuando se logran los mayores avances.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center text-center">
                <div class="col-lg-12">
                    <div class="copyright-text">
                        <p>Derechos de autor &copy;
                            <script>document.write(new Date().getFullYear());</script> Todos los derechos reservados
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer Section End -->

    <!-- Search model Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>