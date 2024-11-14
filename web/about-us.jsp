<%-- 
    Document   : about-us.jsp
    Created on : 14 nov 2024, 10:38:45
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <jsp:include page="head.jsp"/>    
    <jsp:include page="menu.jsp"/>    
    <title>Corpusfit - Nosotros</title>

    <body>

   <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>Sobre nosotros</h2>
                        <div class="bt-option">
                            <a href="./index.jsp">Inicio</a>
                            <span>Sobre nosotros</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

   <!-- ChoseUs Section Begin -->
   <section class="choseus-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <span>¿Por qué elegirnos?</span>
                    <h2>SUPERA TUS LÍMITES</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-6">
                <div class="cs-item">
                    <span class="flaticon-034-stationary-bike"></span>
                    <h4>Equipo moderno</h4>
                    <p>Es esencial que el cliente valore un equipo de gimnasio moderno, que permite entrenar de forma efectiva y segura, optimizando resultados y reduciendo riesgos</p>
                </div>s
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="cs-item">
                    <span class="flaticon-002-dumbell"></span>
                    <h4>Plan de entrenamiento</h4>
                    <p>Un plan de entrenamiento profesional está diseñado para optimizar el rendimiento, adaptándose a las metas individuales y asegurando progresos constantes de manera segura y efectiva.</p>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="cs-item">
                    <span class="flaticon-014-heart-beat"></span>
                    <h4>Único para tus necesidades</h4>
                    <p>Adaptado exclusivamente a tus necesidades, brindando soluciones personalizadas para alcanzar tus objetivos de manera efectiva y única.</p>
                </div>
            </div>
        </div>
     </div>
    </section>
    <!-- ChoseUs Section End -->

    <!-- About US Section Begin -->
    <section class="aboutus-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 p-0">
                    <div class="about-video set-bg" data-setbg="img/about-us.jpg">
                        <a href="https://www.youtube.com/watch?v=EzKkl64rRbM" class="play-btn video-popup"><i
                                class="fa fa-caret-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-6 p-0">
                    <div class="about-text">
                        <div class="section-title">
                            <span>Sobre nosotros</span>
                            <h2>lo que hemos hecho</h2>
                        </div>
                        <div class="at-desc">
                            <p>El dolor mismo se siente en el amor, la investigación y la práctica en la labor y el gran dolor. ¿Quién suspendió las cargas y la gravedad? Sonrisa y comodidad viven, con el buen gusto del trabajo y las facilidades. Las consecuencias de la misma satisfacción se sienten en la práctica y la investigación.</p>
                        </div>
                        <div class="about-bar">
                            <div class="ab-item">
                                <p>Culturismo</p>
                                <div id="bar1" class="barfiller">
                                    <span class="fill" data-percentage="80"></span>
                                    <div class="tipWrap">
                                        <span class="tip"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="ab-item">
                                <p>Capacitacion</p>
                                <div id="bar2" class="barfiller">
                                    <span class="fill" data-percentage="85"></span>
                                    <div class="tipWrap">
                                        <span class="tip"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="ab-item">
                                <p>Fitness</p>
                                <div id="bar3" class="barfiller">
                                    <span class="fill" data-percentage="75"></span>
                                    <div class="tipWrap">
                                        <span class="tip"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About US Section End -->

    <!-- Team Section Begin -->
    <section class="team-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="team-title">
                        <div class="section-title">
                            <span>Nuestro equipo</span>
                            <h2>FORMATE CON EXPERTOS</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="ts-slider owl-carousel">
                    <div class="col-lg-4">
                        <div class="ts-item set-bg" data-setbg="img/team/team-1.jpg">
                            <div class="ts_text">
                                <h4>Selena Aguilar</h4>
                                <span>Entrenadora</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="ts-item set-bg" data-setbg="img/team/team-2.jpg">
                            <div class="ts_text">
                                <h4>Oliver Johnson</h4>
                                <span>Entrenador</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="ts-item set-bg" data-setbg="img/team/team-3.jpg">
                            <div class="ts_text">
                                <h4>Daniel Smith</h4>
                                <span>Entrenador</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="ts-item set-bg" data-setbg="img/team/team-4.jpg">
                            <div class="ts_text">
                                <h4>Noah Williams</h4>
                                <span>Entrenador</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="ts-item set-bg" data-setbg="img/team/team-5.jpg">
                            <div class="ts_text">
                                <h4>Daniela Acevedo</h4>
                                <span>Entrenadora</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="ts-item set-bg" data-setbg="img/team/team-6.jpg">
                            <div class="ts_text">
                                <h4>Camila Herrera</h4>
                                <span>Entrenadora</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Team Section End -->

    <!-- Banner Section Begin -->
    <section class="banner-section set-bg" data-setbg="img/banner-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="bs-text">
                        <h2>Contactanos para obtener mas ofertas</h2>
                        <div class="bt-tips">Donde la salud, la belleza y el fitness se encuentran.</div>
                        <a href="contact.jsp" class="primary-btn  btn-normal">Obtener información</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Testimonial Section Begin -->
    <section class="testimonial-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Testimonios</span>
                        <h2>Nuestros Clientes Dicen</h2>
                    </div>
                </div>
            </div>
            <div class="ts_slider owl-carousel">
                <div class="ts_item">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="ti_pic">
                                <img src="img/testimonial/testimonial-1.jpg" alt="">
                            </div>
                            <div class="ti_text">
                                <p>“Gracias a este gimnasio he alcanzado metas que nunca creí posibles. Los entrenadores son <br>
                                    muy profesionales y siempre están dispuestos a ayudar en todo momento. Estoy más <br>
                                    fuerte y saludable.”</p>
                                <h5>Camila Ríos</h5>
                                <div class="tt-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ts_item">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="ti_pic">
                                <img src="img/testimonial/testimonial-2.jpg" alt="">
                            </div>
                            <div class="ti_text">
                                <p>“Este gimnasio no solo me ayudó a mejorar mi estado físico, sino también mi salud <br> 
                                    mental. El ambiente es muy motivador y siempre encuentras una sonrisa. ¡Recomendado <br>
                                    al 100%!”</p>
                                <h5>María José Mejía</h5>
                                <div class="tt-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->
        
        <jsp:include page="getintouch.jsp"/>
        <jsp:include page="footer.jsp"/>
        <jsp:include page="search.jsp"/>

       

    </body>

</html>

