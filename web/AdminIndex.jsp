<%-- 
    Document   : AdminIndex
    Created on : Jul 1, 2022, 10:54:19 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${(name == null) || (role!=1)}"><p><font color="red">you must login to view admin page</font></p></c:when>
            <c:otherwise>
                    <c:import url="header_loginedAdmin.jsp"></c:import>
                    <section class="right">
                        <img style="width: 100%;height: auto;" src="images/background.jpg"/>
                    </section>
                <c:import url="footer.jsp"></c:import>
            </c:otherwise>
        </c:choose>
    </body>
</html>
