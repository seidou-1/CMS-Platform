<%-- 
    Document   : viewPosts
    Created on : Jun 12, 2018, 9:21:28 PM
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
                                    <title>View All Posts</title>
                                    <!-- Bootstrap core CSS -->
                                    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                                        crossorigin="anonymous">
                                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
                                        crossorigin="anonymous">
                                    <!-- Main CSS -->
                                    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">


                                </head>


                                <body>
                                    <!--===========BRAND NAME BUTTON==========-->
                                    <nav id="mainNav" style="background: rgb(5, 44, 122)" class="navbar navbar-expand-lg navbar-fixed-top">
                                        <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
                                            <embed id="mylogo" src="images/blt_logo.png" alt="logo">
                                        </a>


                                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                                            aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                                            Menu
                                            <i class="fa fa-bars"></i>
                                        </button>
                                        <div id="navbarResponsive" class="navbar-collapse collapse">
                                            <!--===========FLOATS RIGHT=========-->
                                            <ul class="navbar-nav mr-auto">
                                                <li class="nav-item active">
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/index">
                                                        <span class="sr-only">(current)</span>
                                                    </a>
                                                </li>
                                            </ul>
                                            <ul class="navbar-nav">

                                                <li class="nav-item">
                                                    <a class="nav-link " href="${pageContext.request.contextPath}/index">Home</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/viewPosts">Posts</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=notifications">Users</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a class="nav-link active" href="${pageContext.request.contextPath}/about">About</a>
                                                </li>

                                                <!--==========DROPDOWN==========-->
                                                <li class="nav-item" id="user-option">

                                                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                                                        <div class="username">
                                                            <p>${pageContext.request.userPrincipal.name}
                                                                <br>
                                                                <i class="fas fa-caret-down"></i>
                                                                <br>
                                                                <a style="color: orange" href="<c:url value=" /j_spring_security_logout " />"> Logout</a>
                                                            </p>


                                                        </div>
                                                    </c:if>


                                                    <c:if test="${pageContext.request.userPrincipal.name == null}">

                                                        <a class="nav-link dropdown-toggle loginButton" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"
                                                            aria-haspopup="true" aria-expanded="false">
                                                            Login
                                                        </a>
                                                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/login" data-toggle="modal" data-target="#loginModal" onclick="document.getElementById('loginModal').style.display = 'block'">Login</a>
                                                            <a class="dropdown-item" href="#">Sign Up</a>
                                                        </div>

                                                    </c:if>


                                                </li>
                                            </ul>
                                        </div>
                                    </nav>

                                    <!--===========LOGIN MODAL===========-->
                                    <div id="loginModal" class="modal">
                                        <span onclick="document.getElementById('loginModal').style.display = 'none'" class="close" title="Close Modal">&times;</span>

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

                                                <button type="submit" class="loginBtn" id="search-" value="Sign In">Login</button <label>
                                                <input type="checkbox" checked="checked" name="remember"> Remember me
                                                </label>
                                            </div>

                                            <div class="container modalContainer" style="background-color: RGBA(47, 52, 54, 0.6);">
                                                <button type="button" onclick="document.getElementById('loginModal').style.display = 'none'" class="cancelbtn">Cancel</button>
                                            </div>
                                        </form>
                                    </div>

                                    <hr>


                                    <!--============PAGE CONTENT=============-->
                                    <div class="container-fluid">
                                        <div id="imageGallery">
                                            <img src="https://randomuser.me/api/portraits/men/3.jpg">
                                            <img src="https://randomuser.me/api/portraits/women/45.jpg">
                                            <img src="https://randomuser.me/api/portraits/men/12.jpg">
                                            <img src="https://randomuser.me/api/portraits/women/53.jpg">
                                            <img src="https://randomuser.me/api/portraits/men/34.jpg">
                                            <img src="https://randomuser.me/api/portraits/women/23.jpg">
                                            <img src="https://randomuser.me/api/portraits/men/15.jpg">
                                            <img src="https://randomuser.me/api/portraits/women/65.jpg">
                                        </div>
                                    </div>

                                    <div class="container">
                                        <h4>We are we?</h4>
                                        <h5>We are 4 developers who love to code and create. We realized that there was a huge
                                            opportunity to create something that was beaufiful and creative and this is what
                                            we came up with! So enjoy!</h5>

                                        <hr>
                                        <h4>Testimonials</h4>
                                        <div class="testimony-left">
                                            <img src="https://randomuser.me/api/portraits/women/93.jpg" alt="Asher D">
                                            <h4>Hi, My name is and I am very cute</h4>
                                        </div>

                                        <div class="testimony-right">
                                            <img src="hhttps://randomuser.me/api/portraits/men/3.jpg" alt="Asher D">
                                            <h4>Hey there I am Matthew. When I am not asleep, I code brillaint applications from
                                                scratch</h4>
                                        </div>

                                        <div class="testimony-left">
                                                <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Asher D">
                                                <h4>My name is Mo. Or Mo Life. I'm busy creating tomorrow so I have no time to write something cool</h4>
                                            </div>
    
                                            <div class="testimony-right">
                                                <img src="https://randomuser.me/api/portraits/men/7.jp" alt="Asher D">
                                                <h4>You don't need to know my name. Just know I'm a very cool Mofo</h4>
                                            </div>


                                    </div>
                                    <!--End of row -->

                                    </div>
                                    <br>
                                    <br>
                                    <footer>
                                        <h5 style="color:white">This blog was made with Java and Love</h5>
                                        <hr>
                                        <h6>All rights reserved</h6>
                                    </footer>


                                    <!--End of container -->

                                    <!-- Placed at the end of the document so the pages load faster -->
                                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                        crossorigin="anonymous"></script>
                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                                        crossorigin="anonymous"></script>
                                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                                        crossorigin="anonymous"></script>

                                </body>


                                </html>
                                <c:choose>
                                    <c:when test="${display == 'view'}">

                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>