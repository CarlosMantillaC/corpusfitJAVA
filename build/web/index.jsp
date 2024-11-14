<%-- 
    Document   : index
    Created on : 12 nov 2024, 19:47:07
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <jsp:include page="head.jsp"/>    
    <jsp:include page="menu.jsp"/>  
    <title>Corpusfit - Inicio</title>


    <body>

        <!-- Hero Section Begin -->
        <section class="hero-section">
            <div class="hs-slider owl-carousel">
                <div class="hs-item set-bg" data-setbg="img/hero/hero-1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-6">
                                <div class="hi-text">
                                    <span>Pastorea tu cuerpo</span>
                                    <h1>Se <strong>fuerte</strong> entrenando duro</h1>
                                    <a href="contact.jsp" class="primary-btn">Obtener información</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hs-item set-bg" data-setbg="img/hero/hero-2.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 offset-lg-6">
                                <div class="hi-text">
                                    <span>Pastorea tu cuerpo</span>
                                    <h1>Se <strong>fuerte</strong> entrenando duro</h1>
                                    <a href="contact.jsp" class="primary-btn">Obtener información</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

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
                            <p>Es esencial que el cliente valore un equipo de gimnasio moderno, que permite entrenar de
                                forma efectiva y segura, optimizando resultados y reduciendo riesgos</p>
                        </div>s
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="cs-item">
                            <span class="flaticon-002-dumbell"></span>
                            <h4>Plan de entrenamiento</h4>
                            <p>Un plan de entrenamiento profesional está diseñado para optimizar el rendimiento, adaptándose
                                a las metas individuales y asegurando progresos constantes de manera segura y efectiva.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="cs-item">
                            <span class="flaticon-014-heart-beat"></span>
                            <h4>Único para tus necesidades</h4>
                            <p>Adaptado exclusivamente a tus necesidades, brindando soluciones personalizadas para alcanzar
                                tus objetivos de manera efectiva y única.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ChoseUs Section End -->

        <!-- Classes Section Begin -->
        <section class="classes-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Nuestras clases</span>
                            <h2>LO QUE PODEMOS OFRECER</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="class-item">
                            <div class="ci-pic">
                                <img src="img/classes/class-1.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <span>Deportes de resistencia</span>
                                <h5>correr, ciclismo</h5>
                                <a href="login.jsp"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="class-item">
                            <div class="ci-pic">
                                <img src="img/classes/class-2.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <span>Actividades de fuerza</span>
                                <h5>levantamiento de pesas, <br>crossfit</h5>
                                <a href="login.jsp"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="class-item">
                            <div class="ci-pic">
                                <img src="img/classes/class-3.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <span>Actividades de flexibilidad y <br>equilibrio</span>
                                <h5>yoga, pilates</h5>
                                <a href="login.jsp"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="class-item">
                            <div class="ci-pic">
                                <img src="img/classes/class-4.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <span>Deportes de combate</span>
                                <h4>boxeo, karate</h4>
                                <a href="login.jsp"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="class-item">
                            <div class="ci-pic">
                                <img src="img/classes/class-5.jpg" alt="">
                            </div>
                            <div class="ci-text">
                                <span>Actividades recreativas</span>
                                <h4>baile, zumba</h4>
                                <a href="login.jsp"><i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ChoseUs Section End -->

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

        <!-- Gallery Section Begin -->
        <div class="gallery-section">
            <div class="gallery">
                <div class="grid-sizer"></div>
                <div class="gs-item grid-wide set-bg" data-setbg="img/gallery/gallery-9.jpg">
                    <a href="img/gallery/gallery-9.jpg" class="thumb-icon image-popup"><i class="fa fa-picture-o"></i></a>
                </div>
                <div class="gs-item set-bg" data-setbg="img/gallery/gallery-2.jpg">
                    <a href="img/gallery/gallery-2.jpg" class="thumb-icon image-popup"><i class="fa fa-picture-o"></i></a>
                </div>
                <div class="gs-item set-bg" data-setbg="img/gallery/gallery-3.jpg">
                    <a href="img/gallery/gallery-3.jpg" class="thumb-icon image-popup"><i class="fa fa-picture-o"></i></a>
                </div>
                <div class="gs-item set-bg" data-setbg="img/gallery/gallery-4.jpg">
                    <a href="img/gallery/gallery-4.jpg" class="thumb-icon image-popup"><i class="fa fa-picture-o"></i></a>
                </div>
                <div class="gs-item set-bg" data-setbg="img/gallery/gallery-5.jpg">
                    <a href="img/gallery/gallery-5.jpg" class="thumb-icon image-popup"><i class="fa fa-picture-o"></i></a>
                </div>
                <div class="gs-item grid-wide set-bg" data-setbg="img/gallery/gallery-6.jpg">
                    <a href="img/gallery/gallery-6.jpg" class="thumb-icon image-popup"><i class="fa fa-picture-o"></i></a>
                </div>
            </div>
        </div>
        <!-- Gallery Section End -->  
        
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
        
        <jsp:include page="getintouch.jsp"/>
        <jsp:include page="footer.jsp"/>
        <jsp:include page="search.jsp"/>

       

    </body>

</html>
