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
        
        <!--=============NAVBAR=============-->

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
            <form role="form" class="modal-content animate" action="j_spring_security_check" method="POST">
                <div class="imgcontainer">
                    <img src="img_avatar2.png" alt="Avatar" class="avatar">
                </div>

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

                    <button type="submit" class="loginBtn" id="search-button" value="Sign In">Login</button
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container modalContainer" style="background-color: RGBA(47, 52, 54, 0.6);">
                    <button type="button" onclick="document.getElementById('loginModal').style.display = 'none'" class="cancelbtn">Cancel</button>
                </div>
            </form>
        </div>

        
        
        
        
        
        
        
        
        
        
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


</body>
</html>
