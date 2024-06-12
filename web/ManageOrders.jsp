<%-- 
    Document   : ManageOrders
    Created on : Jul 9, 2022, 9:22:27 PM
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Accounts</title>
        <style>
            table {
                width: 700px;
                text-align: center;
                border: 1px solid #fff;
                border-spacing: 1px;
                font-family: 'Cairo', sans-serif;
                margin: auto;
            }

            table td {
                padding: 10px;
                background-color: #eee;
            }

            table th {
                background-color: #333;
                color: #fff;
                padding: 10px;
            }

        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${(name == null) || (role!=1)}"><p><font color="red">you must login to view admin page</font></p></c:when>
                <c:otherwise>
                    <c:import url="header_loginedAdmin.jsp"></c:import>
                    <section>
                        <div class="shop__sidebar__search" style="width:30%;margin: 50px auto;">
                            <form action="searchByDateOrder" method="post">
                                <div class="row">
                                    <div class="col-lg-11">
                                        <div class="row mb-2">
                                            <div class="col-lg-2">
                                                From:
                                            </div>
                                            <div class="col-lg-10">
                                                <input type="date" name="from">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2">
                                                To:
                                            </div>
                                            <div class="col-lg-10">
                                                <input type="date" name="to">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-1">
                                        <button type="submit" value="Search" name="action"><span class="icon_search" ></span></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <table class="order mb-4">
                            <tr>
                                <th>Order ID</th>
                                <th>Account ID</th>
                                <th>Order Date</th>
                                <th>Ship Date</th>
                                <th>Order's Status</th>
                                <th>Action</th>
                            </tr>
                            <tr><td colspan="6">${(WARNING==null)?"":WARNING}</td></tr>
                            <c:if test="${not empty ordersList}">
                                <c:forEach var="o" items="${ordersList}">
                                <tr>
                                    <td>${o.getOrderID()}</td>
                                    <td>${o.getAccID()}</td>
                                    <td>${o.getOrderDate()}</td>
                                    <td>${(o.getShipDate()==null)?"N/A":o.getShipDate()}</td>
                                    <td>
                                        <c:if test="${o.getStatus()==1}">
                                            <div>
                                                Processing
                                            </div>
                                            <div>
                                                <c:url var="mylink" value="completeOrder">
                                                    <c:param name="ordId" value="${o.getOrderID()}"></c:param>
                                                    <c:param name="status2" value="${2}"></c:param>
                                                </c:url>
                                                <a href="${mylink}">Complete</a>
                                            </div>
                                        </c:if>
                                        <c:if test="${o.getStatus() == 3}">
                                            Canceled
                                        </c:if>
                                        <c:if test="${o.getStatus() == 2}">
                                            Completed
                                        </c:if>
                                    </td>
                                    <td><c:url var="mylink" value="LoadOrderDetail">
                                            <c:param name="orderid" value="${o.getOrderID()}"></c:param>
                                        </c:url>
                                        <a href="${mylink}">detail</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </section>
                <c:import url="footer.jsp"></c:import>
            </c:otherwise>
        </c:choose>
    </body>
</html>

