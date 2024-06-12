<%-- 
    Document   : changeProfile
    Created on : Jun 15, 2022, 10:34:12 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text.css" />
    </head>
    <body>
        <c:choose>
            <c:when test="${name == null}"><p><font color="red">you must login to view personal page</font></p></c:when>
                <c:otherwise>
                    <c:import url="header_loginedUser.jsp"></c:import>   
                    <!-- Checkout Section Begin -->
                    <section class="checkout spad">
                        <div class="container">
                            <div class="checkout__form" style="width: 50%; margin: 0 auto;">
                                <form action="updateAccount" method="post">
                                    <div class="checkout__order">
                                        <h6 class="checkout__title text-center">Change your profile</h6>
                                        <div class="checkout__input">
                                            <p>Full Name<span>*</span></p>
                                            <input type="text" placeholder="Your full name" name="txtname" value="${(upname == null) ? "" : upname}">
                                    </div>
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" placeholder="Please enter your phone number" name="txtphone" value="${(upphone == null) ? "" : upphone}">
                                    </div>
                                    <div class="checkout__input">
                                        <p class="text-danger">${(warning == null) ? "" : warning}</p>
                                    </div>
                                    <button type="submit" class="site-btn">Save Information</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
                <!-- Checkout Section End -->

                <c:import url="footer.jsp"></c:import>
            </c:otherwise>
        </c:choose>
    </body>
</html>
