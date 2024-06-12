<%-- 
    Document   : header_loginedUser
    Created on : Jul 7, 2022, 10:54:33 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Plant Shop</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <script src="https://kit.fontawesome.com/469f1bfbe4.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <div class="header__top__left">
                                <div class="header__top__links">
                                    <a href="changeProfile.jsp">Change profile</a>
                                    <c:url var="mylink" value="LoadOrder">
                                        <c:param name="status" value="${2}"></c:param>
                                    </c:url>
                                    <a href="${mylink}">Completed orders</a>

                                    <c:url var="mylink1" value="LoadOrder">
                                        <c:param name="status" value="${3}"></c:param>
                                    </c:url>
                                    <a href="${mylink1}">Canceled orders</a>

                                    <c:url var="mylink2" value="LoadOrder">
                                        <c:param name="status" value="${1}"></c:param>
                                    </c:url>
                                    <a href="${mylink2}">Processing orders</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="header__top__right">
                                <div class="header__top__links">
                                    <p style="color: #ffffff;font-size: 13px;text-transform: uppercase;letter-spacing: 2px;">Welcome ${name} | <a href="logout">Logout</a></p> 
                                    <form action="searchByDateOrder" method="post">from<input type="date" name="from">to<input type="date" name="to">
                                        <button type="submit" value="Search" name="action" style="background-color: black;">
                                            <span class="icon_search" style="color: white;background-color: black;"></span></button></form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                            <a href="LoadPlant"><img src="images/banner.jpg" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="HomePage.jsp">Home</a></li>
                                <li><a href="LoadPlant">Shop</a></li>
                                <li><a href="LoadOrder">Order</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="header__nav__option">
                            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                            <a href="#"><img src="img/icon/heart.png" alt=""></a>
                            <a href="viewCart.jsp"><img src="img/icon/cart.png" alt=""> <span>${(cart.size()==null)?0:cart.size()}</span></a>

                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Search Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch">+</div>
                <form action="LoadPlant" method="post" class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here....." name="txtsearch" value="${(txtsearch== null) ? "" : txtsearch}">
                    <select name="searchby">
                        <option value="byname">by name</option>
                        <option value="bycate">by category</option>
                    </select>
                    <button type="submit" value="Search" name="action" style="background-color: black;">
                        <span class="icon_search" style="color: white;background-color: black;"></span></button>
                </form>
            </div>
        </div>
        <!-- Search End -->
    </body>
</html>
