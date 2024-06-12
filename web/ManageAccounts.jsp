<%-- 
    Document   : ManageAccounts
    Created on : Jul 1, 2022, 11:58:41 PM
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
                            <form action="searchAccount" method="post">
                                <input type="text" placeholder="Search Account..." name="txtSearch">
                                <button type="submit" value="Search Account" name="action"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <table class="order mb-4">
                            <tr>
                                <th>ID</th>
                                <th>Email</th>
                                <th>Full name</th>
                                <th>Status</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                            <tr><td colspan="7">${(WARNING==null)?"":WARNING}</td></tr>
                            <c:if test="${not empty accountsList}">
                                <c:forEach var="acc" items="${accountsList}">
                                <tr>
                                    <td>${acc.getAccID()}</td>
                                    <td>${acc.getEmail()}</td>
                                    <td>${acc.getFullname()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${acc.getStatus()==1}">Active</c:when>
                                            <c:otherwise>Inactive</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${acc.getPhone()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${acc.getRole()==1}">Admin</c:when>
                                            <c:otherwise>User</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:if test="${acc.getRole()==0}">
                                            <a data-target="#deleteAccountModal${acc.getAccID()}" data-toggle="modal" class="delete btn">Block/Unblock</a>
                                        </c:if>
                                    </td>
                                </tr>
                                <div id="deleteAccountModal${acc.getAccID()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="updateStatusAccount" method="post">
                                                <input type="hidden" value="${acc.getEmail()}" name="email"/>
                                                <input type="hidden" value="${acc.getStatus()}" name="status"/>
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Block/Unblock User</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <p>Do you want to block/unblock this user?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                    <input type="submit" class="btn btn-danger" value="Block/Unblock">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </table>
                </section>
                <c:import url="footer.jsp"></c:import>
            </c:otherwise>
        </c:choose>
    </body>
</html>
