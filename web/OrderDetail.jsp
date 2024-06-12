<%-- 
    Document   : OrderDetail
    Created on : Jun 14, 2022, 10:07:49 PM
    Author     : ACER
--%>

<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text.css" />
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
            <c:when test="${name == null}"><p><font color="red">you must login to view personal page</font></p></c:when>
                <c:otherwise>z
                    <c:import url="header_loginedUser.jsp"></c:import>
                    <section>
                        <h4 class="error">${(WARNING == null) ? "" : WARNING}</h4>
                    <c:if test="${not empty list}">             
                        <table class='shopping'>
                            <thead><tr><th>Detail ID</th><th>Plant ID</th><th>Plant Name</th><th>Image</th><th>quantity</th></tr></thead>
                                        <c:forEach items="${list}" var="d">
                                <tbody>
                                    <tr>
                                        <td class="shoppingid">${d.getOrderDetailID()}</td>
                                        <td>${d.getPlantID()}</td>
                                        <td>${d.getPlantName()}</td>
                                        <td><img src="${d.getImgPath()}" style="width:100px;height:100px;"/></td>
                                        <td>${d.getQuantity()} </td>
                                    </tr>
                                </tbody>
                                <c:set var="money" value="${money+d.getPrice() * d.getQuantity()}"/>
                            </c:forEach>
                        </table>
                    </c:if>
                    <p class="text-center"> Total money:${money}.000VND</p>          
                </section>
                <footer>
                    <c:import url="footer.jsp"></c:import>
                    </footer>  
            </c:otherwise>
        </c:choose> 
    </body>
</html>
