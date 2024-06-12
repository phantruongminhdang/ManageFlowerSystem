<%-- 
    Document   : personalPage
    Created on : Jun 11, 2022, 10:09:46 PM
    Author     : ACER
--%>

<%@page import="sample.dao.OrderDAO"%>
<%@page import="sample.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text.css" />
        <style>
            .editable {
                border-collapse: collapse;
                margin-bottom: 10px;
                margin: auto;
            }
            .editable th, .editable td {
                border: 1px solid #000;
                padding: 10px;
            }
            .editable th {
                color: #fff;
                background: #000;
            }
            .editable td.edit {
                background: #ffe7e7;
            }
            /* WIDGET */
            .widget-wrap {
                text-align: center;
                width: 700px;; 
                padding: 30px;
                border-radius: 20px;
                background: rgba(255, 255, 255, 0.7);
                margin: auto;
            }
        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${name == null}"><p><font color="red">you must login to view personal page</font></p></c:when>
                <c:otherwise>
                    <c:import url="header_loginedUser.jsp"></c:import>   
                    <section>
                        <div class="widget-wrap">
                            <table id="demo" class="editable" style="width:100%">
                                <thead><tr><th>Order ID</th><th>Order Date</th><th>Ship Date</th><th>Order's Status</th><th>action</th></tr></thead>
                                        <c:if test="${not empty list}">
                                            <c:forEach items="${list}" var="o">                                                      
                                    <tbody>
                                        <tr>
                                            <td>${o.getOrderID()}</td>
                                            <td>${o.getOrderDate()}</td>
                                            <td>${(o.getShipDate()==null)?"N/A":o.getShipDate()}</td>
                                            <td>
                                                <c:if test="${o.getStatus()==1}">
                                                    processing
                                                    <br/>
                                                    <c:url var="mylink" value="updateStatusOrder">
                                                        <c:param name="ordId" value="${o.getOrderID()}"></c:param>
                                                        <c:param name="status2" value="${3}"></c:param>
                                                    </c:url>
                                                    <a href="${mylink}">cancel order</a>
                                                </c:if>
                                                <c:if test="${o.getStatus() == 3}">
                                                    canceled
                                                    <br/>
                                                    <c:url var="mylink" value="updateStatusOrder">
                                                        <c:param name="ordId" value="${o.getOrderID()}"></c:param>
                                                        <c:param name="status2" value="${1}"></c:param>
                                                    </c:url>
                                                    <a href="${mylink}">order again</a>
                                                </c:if>
                                                <c:if test="${o.getStatus() == 2}">
                                                    completed
                                                </c:if>
                                            </td>
                                            <td><c:url var="mylink" value="LoadOrderDetail">
                                                    <c:param name="orderid" value="${o.getOrderID()}"></c:param>
                                                </c:url>
                                                <a href="${mylink}">detail</a>
                                            </td>
                                        </tr>                                       
                                    </tbody>
                                </c:forEach>              
                            </c:if>
                        </table>
                        <p class="text-center">${(WARNING == null) ? "" : WARNING}</p>
                    </div>                   
                </section>
                <footer>
                    <c:import url="footer.jsp"></c:import>
                    </footer> 
            </c:otherwise>
        </c:choose>
    </body>
</html>
