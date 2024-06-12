<%-- 
    Document   : index.jsp
    Created on : Jul 7, 2022, 6:00:15 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="p" class="sample.dao.CategoryDAO" scope="request"/>
        <c:choose>
            <c:when test="${name != null}">
                <c:import url="header_loginedUser.jsp"></c:import>  
            </c:when>
            <c:otherwise>
                <c:import url="header.jsp"></c:import>  
            </c:otherwise>
        </c:choose>
        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop__sidebar">
                            <div class="shop__sidebar__search ">
                                <form action="LoadPlant" method="post">
                                    <input type="text" placeholder="Search Plants..." name="txtsearch" value="${(txtsearch== null) ? "" : txtsearch}">
                                    <input type="hidden" name="searchby" value="byname">
                                    <button type="submit"><span class="icon_search"></span></button>
                                </form>
                            </div>
                            <div class="shop__sidebar__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <div class="shop__sidebar__categories">
                                                    <ul class="nice-scroll">
                                                        <c:if test="${not empty p.getCategories()}">
                                                            <c:forEach items="${p.getCategories()}" var="cate">
                                                                <li>
                                                                    <c:url var="mylink" value="LoadPlant">
                                                                        <c:param name="txtsearch" value="${cate.getCateName()}"></c:param>
                                                                        <c:param name="searchby" value="bycate"></c:param>
                                                                    </c:url>
                                                                    <a href="${mylink}">${cate.getCateName()}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:if>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">                           
                        <div class="row">
                            <c:if test="${not empty list}">
                                <c:forEach items="${list}" var="plant">
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg" data-setbg="${plant.getImgpath()}">
                                                <ul class="product__hover">
                                                    <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                                    <li><a href="#"><img src="img/icon/compare.png" alt=""></a>
                                                    </li>
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
<!--                                                <div class="product__color__select">
                                                    <label for="pc-4">
                                                        <input type="radio" id="pc-4">
                                                    </label>
                                                    <label class="active black" for="pc-5">
                                                        <input type="radio" id="pc-5">
                                                    </label>
                                                    <label class="grey" for="pc-6">
                                                        <input type="radio" id="pc-6">
                                                    </label>
                                                </div>-->
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
<!--                        <div class="row">
                            <div class="col-lg-12">
                                <div class="product__pagination">
                                    <a class="active" href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <span>...</span>
                                    <a href="#">21</a>
                                </div>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->
        <c:import url="footer.jsp"></c:import>  
    </body>
</html>
