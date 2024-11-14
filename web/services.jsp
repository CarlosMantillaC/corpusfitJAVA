<%-- 
    Document   : services.jsp
    Created on : 14 nov 2024, 10:54:50
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <jsp:include page="head.jsp"/>    
    <jsp:include page="menu.jsp"/>            
    <title>Corpusfit - Servicios</title>

    <body>
        
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb-text">
                            <h2>Servicios</h2>
                            <div class="bt-option">
                                <a href="./index.jsp">Inicio</a>
                                <span>Servicios</span>
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
                <div class="row mb-4">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>¿Por qué elegirnos?</span>
                            <h2>ESTO TE PODEMOS OFRECER</h2>
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

        <!-- Classes Section Begin -->
        <section class="classes-section spad">
            <div class="container">
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
                        <div class="bs-text service-banner">
                            <h2>Haz ejercicio hasta que el cuerpo obedezca.</h2>
                            <div class="bt-tips">Donde la salud, la belleza y el fitness se encuentran.</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->
        
        

        <jsp:include page="getintouch.jsp"/>
        <jsp:include page="footer.jsp"/>
        <jsp:include page="search.jsp"/>

       

    </body>

</html>
