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

                    <li class ="nav-item">
                        <a class ="nav-link" href="${pageContext.request.contextPath}/viewPosts">View Posts</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/createPost">Add Post</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/contact">About Us</a>
                    </li>

                    <!--==========DROPDOWN==========-->
                    <li class="nav-item dropdown">

                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <p>${pageContext.request.userPrincipal.name}
                                | <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
                            </p>

                            <a class="nav-link dropdown-toggle loginButton" href="${pageContext.request.contextPath}/usersDashboard?view=users" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${pageContext.request.userPrincipal.name}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
                            </div>

                        </c:if>


                        <a class="nav-link dropdown-toggle loginButton" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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

        <!--===========LOGIN MODAL===========-->
        <div id="loginModal" class="modal">
            <span onclick="document.getElementById('loginModal').style.display = 'none'" 
                  class="close" title="Close Modal">&times;</span>

            <!-- Modal Content -->
            <form role="form" class="modal-content animate" action="j_spring_security_check" method="POST">
                <!--                <div class="imgcontainer">
                                    <img src="../images/get-buckets.png" alt="Avatar" class="avatar">
                                </div>-->

                <div class="container form-group">
                    <c:if test="${param.login_error == 1}">
                        <h3>Wrong id or password!</h3>
                    </c:if>

                    <c:if test="${param.login_error == 2}">
                        <h3>${param.login_error}</h3>
                    </c:if>

                    <label for="j_username" class="col-md-4 control-label">Username:</label>
                    <input type="text" class=" col-md-8 form-control" name="j_username" placeholder="Username Here " maxlength="45" required>

                    <label for="j_password" class="col-md-4 control-label">Password:</label>
                    <input type="password" class=" col-md-8 form-control" name="j_password" placeholder="Username Here " maxlength="45" required>

                    <button type="submit" class="loginBtn" id="search-" value="Sign In">Login</button
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container modalContainer" style="background-color: RGBA(47, 52, 54, 0.6);">
                    <button type="button" onclick="document.getElementById('loginModal').style.display = 'none'" class="cancelbtn">Cancel</button>
                </div>
            </form>
        </div>

        <hr>

        <div class="conatiner-fluid">

            <!--=============LANDING IMAGE========-->
            <div class="row row-first">
                <div class="hero-image">

                    <div class="carousel-inner" class="carousel slide" data-ride="carousel" role="listbox" style=" width:100%; height: 500px !important;">
                        <div class="carousel-inner">
                           
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="images/1.jpg" alt="1st">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/2.jpg" alt="2nd">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/3.jpg" alt="3rd">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/4.jpg" alt="4th ">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" style="top: -200px" src="images/5.jpg" alt="5th">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/8.jpg" alt="6th">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="images/7.jpg" alt="7th"
                            </div>
                        </div>
                    </div>
                </div>

                <div class="hero-text">
                    <h1>Where BucketList's become Memories</h1>
                </div>
            </div>


            <!--============PAGE CONTENT=============-->
            <div class="contentContainer">
                <div class="row">

                    <div class="card-deck">
                        <div class="card">
                            <img class="card-img-top" src="..." alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Blog Title</h5>
                                <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            </div>
                            <div class="card-footer">
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                <a href="#" class="btn btn-primary">See More</a>
                            </div>
                        </div>
                        <div class="card">
                            <img class="card-img-top" src="..." alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Blog Title</h5>
                                <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                            </div>
                            <div class="card-footer">
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                <a href="#" class="btn btn-primary">See More</a>
                            </div>
                        </div>
                        <div class="card">
                            <img class="card-img-top" src="..." alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Blog Title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                            </div>
                            <div class="card-footer">
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                <a href="#" class="btn btn-primary">See More</a>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

        </div>

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


    </body>
</html>
