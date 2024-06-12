<%-- 
    Document   : HomePage
    Created on : Jul 8, 2022, 6:01:59 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <jsp:useBean id="p" class="sample.dao.PlantDAO" scope="request"/>
        <c:choose>
            <c:when test="${name != null}">
                <c:import url="header_loginedUser.jsp"></c:import>  
            </c:when>
            <c:otherwise>
                <c:import url="header.jsp"></c:import>  
            </c:otherwise>
        </c:choose>
        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="images/hero-1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collections</h6>
                                    <h2>Summer Collections 2022</h2>
                                    <p style="color: black;">An expert label creating luxury essentials. Crafted in a special way with an unwavering commitment to exceptional quality.</p>
                                    <a href="LoadPlant" class="primary-btn">Buy now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="images/hero-1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collections</h6>
                                    <h2>Summer Collections 2022</h2>
                                    <p style="color: black;">An expert label creating luxury essentials. Crafted in a special way with an unwavering commitment to exceptional quality.</p>
                                    <a href="LoadPlant" class="primary-btn">Buy Now <span class="arrow_right"></span></a>
                                    <div class="hero__social">
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-pinterest"></i></a>
                                        <a href="#"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="product spad" style="margin-top: 50px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="filter__controls">
                            <li class="active" data-filter="*">Bestseller</li>
                            <li data-filter=".new-arrivals">New Product</li>
                            <li data-filter=".hot-sales">Discount</li>
                        </ul>
                    </div>
                </div>
                <div class="row product__filter">
                    <c:if test="${not empty p.getAllPlants()}">
                        <c:forEach items="${p.getAllPlants()}" var="plant">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${plant.getImgpath()}">
                                        <span class="label">New</span>
                                        <ul class="product__hover">
                                            <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                            <li><a href="#"><img src="img/icon/compare.png" alt=""> </a></li>
                                            <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                <h6>${plant.getName()}</h6>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                <h6>Category:${plant.getCatename()}</h6>
                                            </div>
                                        </div>
                                        <c:url var="mylink" value="addToCart">
                                            <c:param name="pId" value="${plant.getId()}"/>
                                        </c:url>
                                        <a href="${mylink}" class="add-cart">+ Add to cart</a>
                                        <div class="row">
                                            <div class="col-lg-7 col-md-6 col-sm-6">
                                                <h6>
                                                    <c:if test="${plant.getStatus()==0}">Out of stock</c:if>
                                                    <c:if test="${plant.getStatus()==1}">Availble</c:if>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-5 col-md-6 col-sm-6">
                                                    <div class="rating">
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <h5>${plant.getPrice()}.000 VND</h5>
                                        <div class="product__color__select">
                                            <label for="pc-1">
                                                <input type="radio" id="pc-1">
                                            </label>
                                            <label class="active black" for="pc-2">
                                                <input type="radio" id="pc-2">
                                            </label>
                                            <label class="grey" for="pc-3">
                                                <input type="radio" id="pc-3">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>                    
                </div>
            </div>  
        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>  
        </footer>
    </body>
</html>
