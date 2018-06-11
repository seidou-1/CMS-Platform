<%-- 
    Document   : addPost
    Created on : Jun 1, 2018, 5:43:21 PM
    Author     : laptop
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BBLT</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <!-- Main CSS -->        
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet"> 


    </head>
    <body>

        <!--===========BRAND NAME BUTTON==========-->
        <nav class="navbar navbar-expand-lg navbar-fixed-top">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Bit BucketList Travels</a>


            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fa fa-bars"></i>
            </button>
            <div id="navbarResponsive" class="navbar-collapse collapse">
                <!--===========FLOATS RIGHT=========-->
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/index"> <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/createPost">Add Post</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact Us</a>
                    </li>

                    <!--==========DROPDOWN==========-->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Login
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/login" data-toggle="modal" data-target="#loginModal" onclick="document.getElementById('loginModal').style.display = 'block'">Login</a>
                            <a class="dropdown-item" href="#">Sign Up</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <hr>



        <!--===========LOGIN MODAL===========-->
        <div id="loginModal" class="modal">
            <span onclick="document.getElementById('loginModal').style.display = 'none'" 
                  class="close" title="Close Modal">&times;</span>

            <!-- Modal Content -->
            <form class="modal-content animate" action="#">
                <div class="imgcontainer">
                    <img src="img_avatar2.png" alt="Avatar" class="avatar">
                </div>

                <div class="container">
                    <label for="email"><b>Username</b></label>
                    <input type="text" placeholder="Enter Email" name="email" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <button type="submit" class="loginBtn">Login</button>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container modalContainer" style="background-color: RGBA(47, 52, 54, 0.6);">
                    <button type="button" onclick="document.getElementById('loginModal').style.display = 'none'" class="cancelbtn">Cancel</button>
                </div>
            </form>
        </div>


        <!--============PAGE CONTENT=============-->
        <div class="conatiner contentContainer">
            <div>
                <img src="images/get-buckets.png" alt = "Man getting buckets" class="center-block">
            </div>
            <div class="row">




                <!-- Form Starts -->

                <form action ="createPost" class ="displayForm" method ="POST" id="userForm"  >

                    <div class="form-group">
                        <label for="postTitle" class="control-label col-xs-4">Title</label> 
                        <div class="col-xs-8">
                            <input id="postTitle" value = "island vibes" name="postTitle" placeholder="Post Title" type="text" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="category" class="control-label col-xs-4">Category</label> 
                        <div class="col-xs-8">
                            <input id="categoryId" value = "1" name="categoryId" placeholder="1" type="text" class="form-control">

                            <!-- Asher to add Category logic here. Replace static value-->

                        </div>
                    </div>

                    <div class="form-group"> 

                        <!-- Matt to replace hard coded value with Tag code-->


                        <label for="tags" class="control-label col-xs-4">Tags</label> 
                        <div class="col-xs-8">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Programming" checked>
                                Programming
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Ice Cream">
                                Ice Cream
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Mountains">
                                Mountains
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Fishing">
                                Fishing
                            </label>
                        </div>
                    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
                    <br> <!-- Seperate tags from Body-->

                    <div class="form-group">
                        <br> <!-- Seperate tags from Body-->

                        <label for="postBody" class="control-label col-xs-4">Body</label> 
                        <div class="col-xs-8">
                            <textarea id="textarea" name="postBody" cols="40" rows="9" class="form-control">
                            Lorem Khaled Ipsum is a major key to success. 
                            To be successful you’ve got to work hard, to make history, 
                            simple, you’ve got to make it. Mogul talk. The key is to drink coconut, 
                            fresh coconut, trust me. Cloth talk. 
                            </textarea>
                        </div>
                    </div>
                    <br> <!-- Seperation-->

                    <div class="form-group">
                        <br> <!-- Seperation-->

                        <label for="postDate" class="control-label col-xs-4">Post Date</label> 
                        <div class="col-xs-8">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div> 
                                <input id="text" name="postDate" value = "2018-03-20" placeholder="i.e. 12/22/2018" type="text" class="form-control">
                            </div>
                        </div>
                    </div>

                    <br> <!-- Seperation-->

                    <div class="form-group">

                        <br> <!-- Seperation-->

                        <label for="expirationDate" class="control-label col-xs-4">Post Expiration Date</label> 
                        <div class="col-xs-8">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div> 
                                <input id="expirationDate" name="expirationDate" value = "2018-03-20" placeholder="i.e. 12/31/2022" type="text" class="form-control">
                            </div>
                        </div>
                    </div>

                    <br> <!-- Seperation-->

                    <div class="form-group">
                        <label for="userId" class="control-label col-xs-4">UserID</label> 
                        <div class="col-xs-8">
                            <select id="userId" name="userId" value = "1" class="select form-control">
                                <option value="1">UserID1</option>
                                <option value="2">UserID2</option>
                            </select>
                        </div>
                    </div> 


                    <br> <!-- Seperation-->

                    <div class="form-group row">
                        <div class="col-xs-offset-4 col-xs-8">
                            <button name="submit" type="submit" class="btn btn-primary" id ="createPost">Publish</button>
                            <button name="cancel" type="submit" class="btn btn-danger">Cancel</button>
                        </div>
                    </div>
                </form> 


                <!-- Form Ends -->













            </div>
        </div>



        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


    </body>
</html>
