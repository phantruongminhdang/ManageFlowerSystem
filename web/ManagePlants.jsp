<%-- 
    Document   : ManagePlants
    Created on : Jul 9, 2022, 9:22:51 PM
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
                width: 70%;
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
                            <form action="managePlants" method="post">
                                <input type="hidden" value="byname" name="searchby">
                                <input type="text" placeholder="Search Plant..." name="txtsearch">
                                <button type="submit" value="Search Plants" name="action"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <table class="order mb-4">
                            <tr>
                                <th>Plant ID</th>
                                <th>Plant Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Cate Name</th>
                                <th>Action</th>
                            </tr>
                            <tr><td colspan="8">${(WARNING==null)?"":WARNING}</td></tr>
                            <c:if test="${not empty plantsList}">
                                <c:forEach var="plant" items="${plantsList}">
                                <tr>
                                    <td>${plant.getId()}</td>
                                    <td>${plant.getName()}</td>
                                    <td><img src="${plant.getImgpath()}" style="width:100px;height:100px;"/></td>
                                    <td>${plant.getPrice()}.000VND</td>
                                    <td>${plant.getDescription()}</td>
                                    <td>
                                        <c:if test="${plant.getStatus()==0}">Out of stock</c:if>
                                        <c:if test="${plant.getStatus()==1}">Availble</c:if>
                                        </td>
                                        <td>${plant.getCatename()}</td>
                                    <td>
                                        <a data-target="#updatePlantModal${plant.getId()}" data-toggle="modal" class="delete btn" ><i class="fa-solid fa-gear fa-lg" style="color:blue;"></i></a>
                                        <a data-target="#deletePlantModal${plant.getId()}" data-toggle="modal" class="delete btn"><i class="fa-solid fa-circle-xmark fa-lg" style="color:red;"></i></a>

                                    </td>
                                </tr>
                                <div id="deletePlantModal${plant.getId()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="deletePlant" method="post">
                                                <input type="hidden" value="${plant.getId()}" name="pId"/>   
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Delete Plant</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <p>Do you want to delete this plant?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                    <input type="submit" class="btn btn-danger" value="Delete">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div> 
                                <div id="updatePlantModal${plant.getId()}" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="updatePlant" method="post">
                                                <input type="hidden" value="${plant.getId()}" name="pId"/> 
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Update plant</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <div class="form-group">
                                                        <label>Plant Name</label>
                                                        <input type="text" value="${plant.getName()}" name="plantName" placeholder="required" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Price</label>
                                                        <input type="text" value="${plant.getPrice()}" name="plantPrice" placeholder="required" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Image</label>
                                                        <input type="file" value="${plant.getImgpath()}" name="plantImg" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Description</label>
                                                        <input type="text" value="${plant.getDescription()}" name="plantDes" placeholder="required" class="form-control" required="">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                        <input type="text" value="${plant.getStatus()}" name="plantStatus" placeholder="0: out of stock, 1: available" class="form-control" required="">
                                                    </div>
                                                    <p>Do you want to update this plant?</p>
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
                        <a data-target="#addPlantModal" class="btn btn-secondary" data-toggle="modal"><i class="fa-solid fa-circle-plus"></i> <span>Add new plant</span></a>                                                        
                    </div>
                    <div id="addPlantModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="addPlant" method="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Add new plant</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Plant Name</label>
                                            <input type="text" name="plantName" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input type="text" name="plantPrice" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Image</label>
                                            <input type="file" name="plantImg" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <input type="text" name="plantDes" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Status</label>
                                            <input type="text" name="plantStatus" class="form-control" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Cate ID</label>
                                            <input type="text" name="cateId" class="form-control" required="">
                                        </div>
                                    </div>                                    
                                    <div class="modal-footer">
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                        <input type="submit" class="btn btn-success" value="Save">
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
