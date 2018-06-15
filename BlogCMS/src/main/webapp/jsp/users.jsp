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

        <!--=============LANDING PLANE IMAGE========-->
        <div class="user-image">
            <div class="user-image-text">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <h2>Hello:</h2>
                    <h1>${pageContext.request.userPrincipal.name}
                    </h1>
                </c:if>
            </div>
        </div>

        <div id="app" class="container">


            <div id="mainUserWindow">
                <header id="mainUserWindowPic"></header>

                <nav class="navbar navbar-expand-sm" id="mainUserNav">
                    <ul class="navbar-nav" id="inner">
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=notifications">Notifications</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=users">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=posts">Posts</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=categories">Categories</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=tags">Tags</a>
                        </li>
                    </ul>
                </nav>
                <div id="windowOptions">
                    <div class="dropdown show" id="dropdownDiv">
                        <a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filters
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="#">Users</a>
                            <a class="dropdown-item" href="#">Posts</a>
                            <a class="dropdown-item" href="#">Categories</a>
                            <a class="dropdown-item" href="#">Tags</a>
                        </div>
                    </div>
                </div>
                <div id="viewItems">

                    <c:choose>
                        <c:when test="${view == 'notifications'}">
                            <c:forEach var="i" begin="1" end="${notifications.size()-1}">
                                <div class="viewItem container" onclick="toggleItem(this)">

                                    <div class="row">
                                        <div class="col-md-11 itemDate">
                                            <span>
                                                ${notifications[i].date}
                                            </span>
                                        </div>
                                        <div class="col-md-1 itemToggle">
                                            <i class="fas fa-angle-double-down"></i>
                                        </div>
                                        <div class="col-md-7 itemSummary">
                                            <span> User: ${notifications[i].user} ${notifications[i].notificationClass}
                                                a ${notifications[i].notificationType}</span>
                                            <p class="itemBrief ">${notifications[i].notificationBrief} </p>
                                        </div>
                                        <div class="col-md-5 options">
                                            <button type="button" class="btn btn-outline-primary itemOptions">View</button>
                                            <button type="button" class="btn btn-outline-danger itemOptions">Deny</button>
                                            <button type="button" class="btn btn-outline-success itemOptions">Approve</button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </c:when>
                        <c:when test="${view == 'users'}">
                            <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                <ul class="navbar-nav" id="inner">
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/createUser" class="btn btn-warning" style="color: red; font-size: bold"> Create New User</a>
                                    </li> 

                                </ul>
                            </nav>
                            <c:forEach var="i" begin="1" end="${users.size()-1}">
                                <div class="viewItem container" onclick="toggleItem(this)">

                                    <div class="row">
                                        <div class="col-md-11 itemDate">
                                            <span>
                                                Last Active: ${users[i].lastActive}
                                            </span>
                                        </div>
                                        <div class="col-md-1 itemToggle">
                                            <i class="fas fa-angle-double-down"></i>
                                        </div>
                                        <div class="col-md-7 itemSummary">
                                            <span> Username: ${users[i].username} </span>
                                            <p class="itemBrief"> This user has a total of (Change me!) 45 posts </p>
                                        </div>
                                        <div class="col-md-5 options">
                                            <button type="button" class="btn btn-outline-primary itemOptions">View User Stats</button>
                                            <button type="button" class="btn btn-outline-danger itemOptions">Delete User</button>
                                            <button type="button" class="btn btn-outline-success itemOptions">Edit User</button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </c:when>
                        <c:when test="${view == 'posts'}">
                            <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                <ul class="navbar-nav" id="inner">
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/createPost" class="btn btn-warning" style="color: red; font-size: bold"> Create New Post</a>
                                    </li> 

                                </ul>
                            </nav>
                            <div class="viewItem container" onclick="toggleItem(this)">
                                All the posts goes here
                            </div>
                        </c:when>
                        <c:when test="${view == 'categories'}">
                            <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                <ul class="navbar-nav" id="inner">
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/createCategory" class="btn btn-warning" style="color: red; font-size: bold"> Create New Category</a>
                                    </li> 

                                </ul>
                            </nav>
                            <!--<div class="viewItem container" onclick="toggleItem(this)">-->
                            <c:forEach var="i" begin="1" end="${categories.size()-1}">
                                <div class="viewItem container" onclick="toggleItem(this)">

                                    <div class="row">
                                        <div class="col-md-11 itemDate">
                                            <span>
                                                Date Created: Yesterday 
                                            </span>
                                        </div>
                                        <div class="col-md-1 itemToggle">
                                            <i class="fas fa-angle-double-down"></i>
                                        </div>
                                        <div class="col-md-7 itemSummary">
                                            <span> Name of: ${categories[i].categoryName} </span>
                                            <p class="itemBrief"> See all posts of category </p>
                                        </div>
                                        <div class="col-md-5 options">
                                            <button type="button" class="btn btn-outline-primary itemOptions">Edit Category</button>
                                            <button type="button" class="btn btn-outline-danger itemOptions">Delete Category</button>
                                            <!--<button type="button" class="btn btn-outline-success itemOptions">Edit User</button>-->
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!--</div>-->
                        </c:when>
                        <c:when test="${view == 'tags'}">
                            <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                <ul class="navbar-nav" id="inner">
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/createTag" class="btn btn-warning" style="color: red; font-size: bold"> Create New Tag</a>
                                    </li> 

                                </ul>
                            </nav>
                            <div class="viewItem container" onclick="toggleItem(this)">
                                <c:forEach var="i" begin="1" end="${tags.size()-1}">
                                    <div class="viewItem container" onclick="toggleItem(this)">

                                        <div class="row">
                                            <div class="col-md-11 itemDate">
                                                <span>
                                                    Date Created: Yesterday 
                                                </span>
                                            </div>
                                            <div class="col-md-1 itemToggle">
                                                <i class="fas fa-angle-double-down"></i>
                                            </div>
                                            <div class="col-md-7 itemSummary">
                                                <span> Name of: ${tags[i].tagName} </span>
                                                <p class="itemBrief"> See all posts with tag </p>
                                            </div>
                                            <div class="col-md-5 options">
                                                <button type="button" class="btn btn-outline-primary itemOptions">View User Stats</button>
                                                <button type="button" class="btn btn-outline-danger itemOptions">Delete User</button>
                                                <button type="button" class="btn btn-outline-success itemOptions">Edit User</button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                    </c:choose>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

</html>
