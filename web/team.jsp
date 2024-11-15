<%-- 
    Document   : team.jsp
    Created on : 14 nov 2024, 10:57:21
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"/>    
    <jsp:include page="menu.jsp"/>          
    <title>Corpusfit - Equipo</title>


    <body>
        
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb-text">
                            <h2>Nuestro equipo</h2>
                            <div class="bt-option">
                                <a href="./index.jsp">Inicio</a>
                                <span>Nuestro equipo</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Team Section Begin -->
        <section class="team-section team-page spad">
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
                    <div class="col-lg-4 col-sm-6">
                        <div class="ts-item set-bg" data-setbg="img/team/team-1.jpg">
                            <div class="ts_text">
                                <h4>Selena Aguilar</h4>
                                <span>Entrenadora</span>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="ts-item set-bg" data-setbg="img/team/team-2.jpg">
                            <div class="ts_text">
                                <h4>Oliver Johnson</h4>
                                <span>Entrenador</span>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="ts-item set-bg" data-setbg="img/team/team-3.jpg">
                            <div class="ts_text">
                                <h4>Daniel Smith</h4>
                                <span>Entrenador</span>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="ts-item set-bg" data-setbg="img/team/team-4.jpg">
                            <div class="ts_text">
                                <h4>Noah Williams</h4>
                                <span>Entrenador</span>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="ts-item set-bg" data-setbg="img/team/team-5.jpg">
                            <div class="ts_text">
                                <h4>Daniela Acevedo</h4>
                                <span>Entrenadora</span>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="ts-item set-bg" data-setbg="img/team/team-6.jpg">
                            <div class="ts_text">
                                <h4>Camila Herrera</h4>
                                <span>Entrenadora</span>
                                
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
