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
                                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                                    crossorigin="anonymous">
                                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
                                    crossorigin="anonymous">
                                <!-- Main CSS -->
                                <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">


                            </head>

                            <body>

                                <section id="navMenu">
                                    <svg id="curved_window" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1476 190.92">
                                        <path class="cls-1" d="M69,86s80.36,86,187.5,28S525.38,60,539.8,61C554.52,62,1672,167,1672,167V54H69Z" transform="translate(-69 -54)"
                                        />
                                    </svg>

                                    <nav id="mainNav" class="navbar navbar-expand-lg navbar-fixed-top">
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
                                                    <a class="nav-link active" href="${pageContext.request.contextPath}/index">Home</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/viewPosts">Posts</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=notifications">Users</a>
                                                </li>

                                                <li class="nav-item">
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
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



                                </section>



                                <!--===========BRAND NAME BUTTON==========-->

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

                                <div class="container-fluid">

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
                                                        <img class="d-block w-100" src="images/7.jpg" alt="7th" </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="hero-text">
                                                <h1>Where BucketList's become Memories</h1>
                                            </div>
                                        </div>


                                        <!--============PAGE CONTENT=============-->
                                        <div class="container">
                                            <br>
                                            <br>
                                            <div class="row">

                                                <div class="card-deck">
                                                    <div class="card">
                                                        <img src="https://loremflickr.com/320/240?random=1" />
                                                        <div class="card-body">
                                                            <h5 class="card-title">Life on edge</h5>
                                                            <p class="card-text">Have you ever something crazy? Like, really out of this world.
                                                                How did it feel. Guess what we did this weekend! Find out
                                                                how we did some crazy stuff and went all the way to the top!
                                                            </p>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p class="card-text">
                                                                <p>
                                                                    <i class="fas fa-book-reader"></i> 1744 &nbsp; | &nbsp;
                                                                    <i class="fas fa-heart"></i> 645 &nbsp; | &nbsp;
                                                                    <i class="fas fa-share-alt">
                                                                        35</i>
                                                                </p>
                                                            </p>
                                                            <a href="#" class="btn btn-primary">Read Now!</a>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <img src="https://loremflickr.com/320/240?random=2" />
                                                        <div class="card-body">
                                                            <h5 class="card-title">Technicolor beat</h5>
                                                            <p class="card-text">Sometimes we have days when life seems to kick us right in the
                                                                nuts. It's on those days it's important to keep your head
                                                                up. That was an important lesson for me. Here's 10 facts
                                                                of life!
                                                            </p>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p class="card-text">
                                                                <p>
                                                                    <i class="fas fa-book-reader"></i> 340 &nbsp; | &nbsp;
                                                                    <i class="fas fa-heart"></i> 45 &nbsp; | &nbsp;
                                                                    <i class="fas fa-share-alt">
                                                                        140</i>
                                                                </p>
                                                            </p>
                                                            <a href="#" class="btn btn-primary">Read Now!</a>
                                                        </div>
                                                    </div>
                                                    <div class="card">
                                                        <img src="https://loremflickr.com/320/240?random=3" />
                                                        <div class="card-body">
                                                            <h5 class="card-title">Colouring this life</h5>
                                                            <p class="card-text">A wise man once said, "Girl, you color my life, like it's all
                                                                in crayons. You must've come from a magazine". That man is
                                                                known as the World Boss. Here's why we should strive to paint
                                                                some more </p>
                                                        </div>
                                                        <div class="card-footer">
                                                            <p class="card-text">
                                                                <p>
                                                                    <i class="fas fa-book-reader"></i> 3435 &nbsp; | &nbsp;
                                                                    <i class="fas fa-heart"></i> 832 &nbsp; | &nbsp;
                                                                    <i class="fas fa-share-alt">
                                                                        432</i>
                                                                </p>
                                                            </p>
                                                            <a href="#" class="btn btn-primary">Read Now!</a>
                                                        </div>
                                                    </div>
                                                </div>



                                            </div>




                                        </div>


                                    </div>




                                </div>

                                <footer>
                                    <h5 style="color:white">This blog was brought to you by the loving arms of the following people</h5>
                                    <hr>
                                    <br>
                                    <div id="creators">
                                        <div>
                                            <img src="https://randomuser.me/api/portraits/women/93.jpg" alt="Asher D">
                                            <h4>Asher D</h4>
                                        </div>
                                        <div>
                                            <img src="https://randomuser.me/api/portraits/men/3.jpg" alt="Matthew W">
                                            <h4>Matthew W</h4>
                                        </div>
                                        <div>
                                            <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Mohamed B">
                                            <h4>Mohamed B</h4>
                                        </div>

                                        <div>
                                            <img src="https://randomuser.me/api/portraits/men/7.jpg" alt="Travon C">
                                            <h4>Travon C</h4>
                                        </div>

                                    </div>
                                </footer>



                                <!-- Placed at the end of the document so the pages load faster -->
                                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                    crossorigin="anonymous"></script>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                                    crossorigin="anonymous"></script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                                    crossorigin="anonymous"></script>


                            </body>

                            </html>