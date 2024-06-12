<%@page import="java.sql.Date"%>
<%@page import="sample.dto.Plant"%>
<%@page import="sample.dao.PlantDAO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Plant Shop</title>
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
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__text">
                            <h4>Shopping Cart</h4>
                            <div class="breadcrumb__links">
                                <a href="HomePage">Home</a>
                                <a href="LoadPlant">Shop</a>
                                <span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->
    <!-- Giỏ hàng Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div>
                <div>
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr class="text-center">
                                    <th>Product ID</th><th>Product</th><th>Quantity</th><th>Price</th><th>Actions</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty cart}">
                                        <c:forEach items="${cart.keySet()}" var="c">
                                            <c:set var="quantity" value="${cart.get(c)}" scope="request" />
                                            <c:set var="plant" value="${p.getPlant(c)}" scope="request" />
                                            <tr>
                                        <form action="updateCart" method="post">
                                            <td class="quantity__item">
                                                <div class="product__cart__item__text">
                                                    <input type="hidden" value="${c}" name="pId"/>
                                                    <c:url var="mylink" value="showDetailProduct">
                                                        <c:param name="pId" value="${c}"></c:param>
                                                    </c:url>
                                                    <a href="${mylink}">${c}</a>
                                                </div>
                                            </td>                                            
                                            <td class="product__cart__item">
                                                <div class="product__cart__item__pic">
                                                    <img style="width: 200px;height: 200px" src="${plant.getImgpath()}" alt="">
                                                </div>
                                                <div class="product__cart__item__text">
                                                    <h6>${plant.getName()}</h6>
                                                    <h5>${plant.getPrice()}.000VND</h5>
                                                </div>
                                            </td>
                                            <td class="quantity__item">
                                                <div class="quantity">
                                                    <div class="pro-qty-1">
                                                        <input type="text" value="${quantity}" name="quantity">
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="cart__price">${plant.getPrice()}.000VND</td>
                                            <td class="cart__close">
                                                <div class="row">
                                                    <div class="col-lg-8 col-md-8 col-sm-8">
                                                        <input type="submit" value="update" class="primary-btn"/>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-4">
                                                        <a data-target="#deleteCartModal${plant.getPrice()}" class="delete btn" data-toggle="modal"><i class="fa fa-close"></i></a>
                                                    </div>
                                                </div>                                                
                                            </td>
                                        </form>
                                        </tr>
                                        <c:set var="money" value="${money+plant.getPrice() * quantity}"/> 
                                        <div id="deleteCartModal${plant.getPrice()}" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <form action="deleteCart" method="post">
                                                        <input type="hidden" value="${c}" name="pId"/>
                                                        <div class="modal-header">						
                                                            <h4 class="modal-title">Delete Plant</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">					
                                                            <p>Do you want to delete product?</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                            <input type="submit" class="btn btn-danger" value="Delete">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach> 
                                </c:when>
                                <c:otherwise>
                                    <tr><td colspan="6">Your cart is empty</td></tr>
                                </c:otherwise>              
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <p><h5 style="text-align: center; color: red;" class="product__cart__item__text">${(WARNING == null) ? "" : WARNING}</h5></p>
                    <div>
                        <div class="cart__total">
                            <h6>Total</h6>
                            <ul>
                                <li>Provisional<span>${(money== null)?0:money}.000VND</span></li>
                                <li>Total money <span>${(money== null)?0:money}.000VND</span></li>
                            </ul>
                            <a href="saveShoppingCart" class="primary-btn">Make a payment</a>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <div class="continue__btn">
                        <a href="LoadPlant">Continue Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Giỏ hàng Section End -->
<footer>
    <c:import url="footer.jsp"></c:import>
</footer>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>