<%-- 
    Document   : header_loginedAdmin
    Created on : Jul 7, 2022, 10:59:30 PM
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
                                    <a href="manageAccounts">Manage Accounts</a>
                                    <a href="manageOrders">Manage Orders</a>
                                    <a href="managePlants">Manage Plants</a>
                                    <a href="manageCategories">Manage Categories</a>            
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="header__top__right">
                                <div class="header__top__links">
                                    <h6 style="color: #ffffff;font-size: 13px;text-transform: uppercase;letter-spacing: 2px;">Welcome ${name} | <a href="logout">Logout</a></h6>                        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
