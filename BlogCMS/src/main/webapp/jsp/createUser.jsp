<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
                        <%@page contentType="text/html" pageEncoding="UTF-8"%>
                            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


                                <html>

                                <head>
                                    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                                    <title>Users add page</title>
                                    <!-- Bootstrap core CSS -->
                                    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                                        crossorigin="anonymous">
                                    <!-- Main CSS -->
                                    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
                                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
                                        crossorigin="anonymous">
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
                            <a class="nav-link active" href="${pageContext.request.contextPath}/userDashboard?view=notifications">Users</a>
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


                                        <div id="mainUserWindow">
                                            <header id="mainUserWindowPic"></header>

                                            <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                                
                                                   <a href="${pageContext.request.contextPath}/userDashboard?view=users" class="btn btn-primary"><i class="fas fa-chevron-left"></i> Back To Dashboard</a href="">
                                               
                                            </nav>

                                            <div id="viewItems">
                                                <!-- <h4>Create a new User here</h4>
                                                <br>
                                                <hr> -->

                                                <div class="container">
                                                    <section class="row" id="placement">
                                                        <div class="col-md-3 windowMenu">
                                                            <h4 class="heading1">Your Instructions</h4>
                                                            <ul class="menuInstructions placementMenu">
                                                                <li>To create a new user you need to enter</li>
                                                                <li>
                                                                    1. A unique username
                                                                </li>
                                                                <li>
                                                                    2. A unique email address
                                                                </li>
                                                                <li>
                                                                    3. The user's type
                                                                </li>
                                                                <li>
                                                                    4. Optionally add a mugshot
                                                                </li>
                                                                <li>
                                                                    5. Click Submit
                                                                </li>
                                                                <li>
                                                                    Please Note: Password defaults to 12345
                                                                    <br> The user will be forced to update password on the first
                                                                    log in
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-9 windowDisplay">
                                                            <h4 style="text-align: right; padding: 10px 100px 5px 0; font-size: 14px; ">Create a new User</h4>
                                                            <form action="addUser" method="POST">
    
                                                             <div id="createForm">
                                                                    <div class="form-group" id="idealo">
                                                                        <label for="userName">User Name: </label>
                                                                        <input type="text" name="userName" id="userName" class="sm-form" value="mad">
                                                                        <br>
                                                                        <label for="UserEmail">User Email: </label>
                                                                        <input type="text" name="userEmail" id="userEmail" class="sm-form" value="madlife@shinobilife.com">
                                                                        <br>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="userAuthority" id="StandardAuth" value="2" checked>
                                                                            <label for="StandardAuth">Standard User</label>
                                                                         </div>
                                                                        <div class="form-check form-check-inline">
                                                                            <input class="form-check-input" type="radio" name="userAuthority" id="adminAuth" value="1">
                                                                            <label  for="adminAuth">Administrator</label>
                                                                        </div>
        
                                                                        
                                                                    </div>
    
                                                                    <div>
                                                                        <p>Optional Image</p>
                                                                        <img src="https://randomuser.me/api/portraits/women/93.jpg" alt="Asher D">
                                                                        <br> <br>
                                                                        <a href="#" class="btn btn-primary">Upload Image</a>
                                                                        <br> <br>
                                                                    
 
    
                                                                    </div>
                                                             </div>

                                                             <div class="form-group" style="width: 100%;">
                                                                    <button name="submit" type="submit" class="btn btn-success" id="createUser">Submit User</button>
                                                                </div>
    
                                                            </form>

                                                            
                                                        </div>
                                                    </section>
                                                </div>

                                            </div>
                                        </div>

                                        <footer>
                                                <h5 style="color:white ">This blog was brought to you by the loving arms of the following people</h5>
                                                <hr>
                                                <br>
                                                <div id="creators">
                                                    <div>
                                                        <img src="https://randomuser.me/api/portraits/women/93.jpg " alt="Asher D ">
                                                        <h4>Asher D</h4>
                                                    </div>
                                                    <div>
                                                        <img src="https://randomuser.me/api/portraits/men/3.jpg " alt="Matthew W ">
                                                        <h4>Matthew W</h4>
                                                    </div>
                                                    <div>
                                                        <img src="https://randomuser.me/api/portraits/men/1.jpg " alt="Mohamed B ">
                                                        <h4>Mohamed B</h4>
                                                    </div>
            
                                                    <div>
                                                        <img src="https://randomuser.me/api/portraits/men/7.jpg " alt="Travon C ">
                                                        <h4>Travon C</h4>
                                                    </div>
            
                                                </div>
                                            </footer>
                                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                            crossorigin="anonymous"></script>
                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                                            crossorigin="anonymous"></script>
                                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                                            crossorigin="anonymous"></script>
                                        <script src="${pageContext.request.contextPath}/js/main.js"></script>
                                </body>

                                </html>