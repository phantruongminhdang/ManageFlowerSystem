<%-- 
    Document   : viewPlant
    Created on : Jul 7, 2022, 6:46:30 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${name != null}">
                <c:import url="header_loginedUser.jsp"></c:import>  
            </c:when>
            <c:otherwise>
                <c:import url="header.jsp"></c:import>  
            </c:otherwise>
        </c:choose>
        <!-- Chi tiết cửa hàng Section Begin -->
        <section class="shop-details">
            <div class="product__details__pic">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__details__breadcrumb">
                                <a href="HomePage.jsp">Home Page</a>
                                <a href="LoadPlant">Shop</a>
                                <span>Product Detail</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                        <div class="product__thumb__pic set-bg" data-setbg="${plant.getImgpath()}">
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9">
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__pic__item">
                                        <img style="width: 500px;height: 500px" src="${plant.getImgpath()}" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product__details__content">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-8">
                            <div class="product__details__text">
                                <h4>${plant.getName()}</h4>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                    <span> - 5 Rate</span>
                                </div>
                                <h3>${plant.getPrice()}.000VND <span>${plant.getPrice()+99}.000VND</span></h3>    
                                <h4>Product ID: ${plant.getId()}</h4>    
                                <h4>Category: ${plant.getCatename()}</h4>
                                <div class="product__details__cart__option">
                                    <form action="updateCart" method="post">
                                        <input type="hidden" value="${plant.getId()}" name="pId"/>
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="${(quantity==null)?0:quantity}" name="quantity">
                                            </div>
                                        </div>
                                        <input type="submit" value="Update Cart" class="primary-btn"/>
                                    </form>                                   
                                </div>
                                <div class="product__details__btns__option">
                                    <a href="#"><i class="fa fa-heart"></i> ADD TO FAVORITE LIST</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!-- Chi tiết cửa hàng Section End -->
        <c:import url="footer.jsp"></c:import>  
    </body>
</html>
