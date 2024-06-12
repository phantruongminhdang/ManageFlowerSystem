<%-- 
    Document   : ManageCategories
    Created on : Jul 9, 2022, 9:23:08 PM
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Accounts</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
                            <form action="manageCategories" method="post">
                                <input type="text" placeholder="Search Categories..." name="txtsearch">
                                <button type="submit" value="Search Categories" name="action"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <table class="order mb-4">
                            <tr>
                                <th>Cate ID</th>
                                <th>Cate Name</th>
                                <th>Action</th>
                            </tr>
                            <tr><td colspan="7">${(WARNING==null)?"":WARNING}</td></tr>
                            <c:if test="${not empty categoriesList}">
                                <c:forEach var="cate" items="${categoriesList}">
                                <tr>
                                    <td>${cate.getCateId()}</td>
                                    <td>${cate.getCateName()}</td>
                                    <td>
                                        <a data-target="#updateCategoryModal${cate.getCateId()}" data-toggle="modal" class="delete btn" ><i class="fa-solid fa-gear fa-lg" style="color:blue;"></i></a>
                                        <a data-target="#deleteCateModal${cate.getCateId()}" data-toggle="modal" class="delete btn"><i class="fa-solid fa-circle-xmark fa-lg" style="color:red;"></i></a>                                       
                                    </td>
                                </tr>
                                <div id="deleteCateModal${cate.getCateId()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="deleteCategory" method="post">
                                                <input type="hidden" value="${cate.getCateId()}" name="cateId"/>
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Delete Category</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <p>Do you want to delete this category?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                    <input type="submit" class="btn btn-danger" value="Delete">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>  
                                <div id="updateCategoryModal${cate.getCateId()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="updateCategory" method="posy">
                                                <input type="hidden" value="${cate.getCateId()}" name="cateId"/>
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Update category</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <div class="form-group">
                                                        <label>Cate Name</label>
                                                        <input type="text" value="${cate.getCateName()}" name="cateName" placeholder="required" class="form-control" required="">
                                                    </div>
                                                    <p>Do you want to update this category?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                    <input type="submit" class="btn btn-success" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </table>
                    <div class="mb-4" style="display:flex; align-items: center; justify-content: center;">
                        <a data-target="#addCategoryModal" class="btn btn-secondary" data-toggle="modal"><i class="fa-solid fa-circle-plus"></i> <span>Add new category</span></a>                                                        
                    </div>
                    <div id="addCategoryModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="addCategory" method="posy">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Add new category</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Cate Name</label>
                                            <input type="text" name="cateName" class="form-control" required="">
                                        </div>				
                                    </div>
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Add">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <c:import url="footer.jsp"></c:import>
            </c:otherwise>
        </c:choose>
    </body>
</html>
