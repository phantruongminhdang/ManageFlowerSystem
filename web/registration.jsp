<%-- 
    Document   : registration
    Created on : Jul 7, 2022, 5:58:46 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Male_Fashion</title>
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        body{
            background: rgb(219, 226, 226);
        }
        .row{
            background: white;
            border-radius: 30px;
            box-shadow: 12px 12px 22px gray;
        }
        img{
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }
        .btn1{
            border: none;
            outline: none;
            height: 50px;
            width: 100%;
            background-color: black;
            color: white;
            border-radius: 4px;
            font-weight: bold;
        }
        .btn1:hover{
            background: white;
            border: 1px solid;
            color: black;
        }
    </style>
  </head>
  <body>
    <section class="Form my-4 mx-5">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-lg-5">
                    <img src="images/logoImage.jpg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-7 px-5 pt-5">
                    <h1 class="font-weight-bold py-3">Sign Up</h1>
                    <h4>Sign Up Your Account</h4>
                    <form action="register" method="post">
                        <div class="form-row">
                            <div class="col-lg-7">
                                <input type="text" placeholder="Your name" value="${(txtfullname== null) ? "" : txtfullname}" class="form-control my-3 p-4" name="txtfullname" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-7">
                                <input type="email" placeholder="Email" value="${(txtemail== null) ? "" : txtemail}" class="form-control my-3 p-4" name="txtemail" required="" pattern="^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-7">
                                <input type="password" placeholder="************" class="form-control my-3 p-4" name="txtpassword">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-7">
                                <input type="text" placeholder="Your phone" value="${(txtphone== null) ? "" : txtphone}" class="form-control my-3 p-4" name="txtphone" required="">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-7">
                                <p class="text-danger">${(ERROR== null) ? "" : ERROR}</p>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-lg-7">
                               <input type="submit" value="Sign Up" class="btn1 mt-3 mb-5">
                            </div>
                        </div>
                        <p>Do you have account? <a href="login.jsp">Sign In?</a></p>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>
