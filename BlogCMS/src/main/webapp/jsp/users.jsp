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


                                    <!--=============NAVBAR=============-->

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

                                    <hr>




                                    <div id="mainUserWindow" class="container">
                                        <header id="mainUserDetails">
                                            <img src="${pageContext.request.contextPath}/images/get-buckets.png" alt="User">
                                            <div>
                                                <h5 style="text-align: left; margin-left: 40px;">Workbench</h5>
                                                <section>
                                                    <ul>
                                                        <li class="userHead">User Details</li>
                                                        <li>Username: Travzlife</li>
                                                        <li>Last Active Date: Yesterday</li>
                                                        <li>Email: travz@shinobilife.com</li>
                                                    </ul>
                                                    <ul>
                                                        <li class="userHead">User Statistics</li>
                                                        <li>Posts: 3 submits</li>
                                                        <li>Categories: 2 submits</li>
                                                        <li>Tags: 10 submits</li>
                                                    </ul>
                                                    <ul>
                                                        <li class="userHead">User Settings</li>
                                                        <li>
                                                            <a href="#">Change Username</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Change Password</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Change Email</a>
                                                        </li>
                                                        <li>
                                                            <a href="#">Delete Account</a>
                                                        </li>

                                                    </ul>
                                                </section>
                                            </div>
                                        </header>

                                        <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                            <ul class="navbar-nav" id="inner">
                                                <c:choose>
                                                    <c:when test="${view == 'notifications'}">
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=notifications">Notifications</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=notifications">Notifications</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:choose>
                                                    <c:when test="${view == 'users'}">
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=users">Users</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=users">Users</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>


                                                <c:choose>
                                                    <c:when test="${view == 'posts'}">
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=posts">Posts</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=posts">Posts</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:choose>
                                                    <c:when test="${view == 'categories'}">
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=categories">Categories</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=categories">Categories</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:choose>
                                                    <c:when test="${view == 'tags'}">
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=tags">Tags</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="nav-item">
                                                            <a class="nav-link" href="${pageContext.request.contextPath}/userDashboard?view=tags">Tags</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>

                                            </ul>
                                        </nav>
                                        <div id="viewItems">

                                            <c:choose>
                                                <c:when test="${view == 'notifications'}">
                                                    <section class="row" id="placement">
                                                        <div class="col-md-3 windowMenu">
                                                            <h4 class="heading1">Notifications Menu</h4>
                                                            <ul class="list-group placementMenu">
                                                                <li class="list-group-item d-flex justify-content-between align-items-center active">
                                                                    <a href="${pageContext.request.contextPath}/userDashboard?view=notification&mode=notifications"> My Notifications</a>

                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                    <a data-toggle="modal" data-target="#exampleModal" href="#" onclick="populateModal('notifications')">Filter Notifications </a>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                    <a href="${pageContext.request.contextPath}/userDashboard?view=notification&mode=pending"> Pending / Watching</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-9 windowDisplay">
                                                            <h4 class="heading1">Notifications Display</h4>
                                                            <div class="navScroll">
                                                                <c:choose>
                                                                    <c:when test="${empty notifications == false}">
                                                                        <c:forEach var="i" begin="1" end="${notifications.size()-1}">
                                                                            <div class="viewItem container-fluid" onclick="toggleItem(this)">

                                                                                <div class="row">
                                                                                    <div class="col-md-11 itemDate">
                                                                                        <span>
                                                                                            Last Status Change: ${notifications[i].date}
                                                                                        </span>
                                                                                    </div>
                                                                                    <div class="col-md-1 itemToggle">
                                                                                        <i class="fas fa-angle-double-down"></i>
                                                                                    </div>
                                                                                    <div class="col-md-7 itemSummary">
                                                                                        <span> User: ${notifications[i].user} ${notifications[i].notificationClass}D
                                                                                            a ${notifications[i].notificationType}</span>
                                                                                        <p class="itemBrief ">${notifications[i].notificationBrief}
                                                                                        </p>
                                                                                        </p>
                                                                                    </div>
                                                                                    <div class="col-md-5 options">
                                                                                        <div class="btn-group itemOptions" role="group" aria-label="Button group with nested dropdown">
                                                                                            <a data-toggle="modal" data-target="#exampleModal" href="#" class="btn btn-success" onclick="populateModal('notifications_view', `${notifications[i].notificationID}`)">View </a>
                                                                                            <a data-toggle="modal" data-target="#exampleModal" href="#" class="btn btn-primary" onclick="populateModal('notifications_approve', `${notifications[i].notificationID}`)">Approve </a>

                                                                                            <div class="btn-group" role="group">
                                                                                                <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                                                                    aria-expanded="false">
                                                                                                    Deny
                                                                                                </button>
                                                                                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                                                    <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal" href="#" onclick="populateModal('notifications_request_edit', `${notifications[i].notificationID}`)">Request Edits </a>
                                                                                                    <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal" href="#" onclick="populateModal('notifications_vanquish', `${notifications[i].notificationID}`)">Vanquish </a>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="viewItem container-fluid">
                                                                            <h4>There are no notifications yet.</h4>
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </c:when>




                                                <c:when test="${view == 'users'}">
                                                    <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                                        <ul class="navbar-nav nav-btn" id="inner">
                                                            <a href="${pageContext.request.contextPath}/createUser" class="btn btn-warning navigationButton"> Create New User</a>
                                                            </li>

                                                        </ul>
                                                    </nav>

                                                    <section class="row" id="placement">
                                                        <div class="col-md-3 windowMenu">
                                                            <h4 class="heading1">User Menu</h4>
                                                            <ul class="list-group placementMenu">

                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                    <a data-toggle="modal" data-target="#exampleModal" href="#" onclick="populateModal('users_pending')"> My Pending Users </a>
                                                                </li>
                                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                    <a data-toggle="modal" data-target="#exampleModal" href="#" onclick="populateModal('users_settings')">My Settings </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-9 windowDisplay">
                                                            <h4 class="heading1">Window Display</h4>
                                                            <div class="navScroll">

                                                                <c:forEach var="i" begin="1" end="${users.size()-1}">
                                                                    <div class="viewItem container-fluid" onclick="toggleItem(this)">

                                                                        <div class="row">
                                                                            <div class="col-md-11 itemDate">
                                                                                <span>
                                                                                    Last Active: ${users[i].lastActive}
                                                                                    <br> Posts: 31 &nbsp; | &nbsp; Categories:
                                                                                    3 &nbsp; | &nbsp; Tags: 3
                                                                                </span>
                                                                            </div>
                                                                            <div class="col-md-1 itemToggle">
                                                                                <i class="fas fa-angle-double-down"></i>
                                                                            </div>
                                                                            <div class="col-md-7 itemSummary">
                                                                                <span> User: ${users[i].username} &nbsp; | &nbsp;
                                                                                    Admin &nbsp; | &nbsp; Active</span>
                                                                                <p class="itemBrief">This user has 1 post, 2 tags, 42 categories
                                                                                    pending
                                                                                </p>
                                                                            </div>
                                                                            <div class="col-md-5 options">
                                                                                <div class="btn-group itemOptions" role="group" aria-label="Button group with nested dropdown">
                                                                                    <a class="btn btn-success" data-target="#exampleModal" href="#"> View Posts </a>

                                                                                    <a class="btn btn-warning" data-target="#exampleModal" href="#"> Edit </a>

                                                                                    <div class="btn-group" role="group">
                                                                                        <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                                                            aria-expanded="false">
                                                                                            Options
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                                            <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal" href="#" onclick="populateModal('users_ban')">Ban User</a>
                                                                                            <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal" href="#" onclick="populateModal('users_delete')">Vanquish User</a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </section>




                                                </c:when>
                                                <c:when test="${view == 'posts'}">
                                                    <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                                        <ul class="navbar-nav" id="inner">
                                                            <li class="nav-item">
                                                                <a href="${pageContext.request.contextPath}/createPost" class="btn btn-warning" style="color: red; font-size: bold"> Create New Post</a>
                                                            </li>

                                                        </ul>
                                                    </nav>

                                                    <section class="row" id="placement">
                                                        <div class="col-md-3 windowMenu">
                                                            <h4 class="heading1">Posts Menu</h4>
                                                            <ul class="list-group placementMenu">
                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">

                                                                    <a href="${pageContext.request.contextPath}/userDashboard?view=users&mode=settings"> Post Notifications</a>
                                                                </li>

                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                    My Posts
                                                                </li>

                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                    Filter Posts By
                                                                </li>

                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                    All Posts
                                                                </li>

                                                            </ul>
                                                        </div>
                                                        <div class="col-md-9 windowDisplay">
                                                            <h4 class="heading1">Posts Display</h4>
                                                            <div class="navScroll">

                                                                <c:forEach var="i" begin="1" end="${posts.size()-1}">
                                                                    <div class="viewItem " onclick="toggleItem(this)">

                                                                        <div class="row">
                                                                            <div class="col-md-11 itemDate">
                                                                                <span>
                                                                                    Published Date: ${posts[i].postDate}
                                                                                    <br> Views: 107 &nbsp; | &nbsp; Edits: 3
                                                                                    &nbsp; | &nbsp; Ratings: 3.75
                                                                                </span>
                                                                            </div>
                                                                            <div class="col-md-1 itemToggle">
                                                                                <i class="fas fa-angle-double-down"></i>
                                                                            </div>
                                                                            <div class="col-md-7 itemSummary">
                                                                                <span> Title: ${posts[i].postTitle} &nbsp; |&nbsp;
                                                                                    Creator: ${posts[i].user} </span>
                                                                                <p class="itemBrief">This post has 2 tags (beaches, bottles) has
                                                                                    a category of Food.
                                                                                </p>
                                                                            </div>
                                                                            <div class="col-md-5 options">
                                                                                <div class="btn-group itemOptions" role="group" aria-label="Button group with nested dropdown">
                                                                                    <button type="button" class="btn btn-primary">View</button>
                                                                                    <button type="button" class="btn btn-warning">Edit</button>

                                                                                    <div class="btn-group" role="group">
                                                                                        <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                                                            aria-expanded="false">
                                                                                            Options
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                                            <a class="dropdown-item" href="#">Set Expiration</a>
                                                                                            <a class="dropdown-item" href="#">Change status </a>
                                                                                            <hr class="thinHr">
                                                                                            <a class="dropdown-item text" href="#">Delete Post </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                              
                                                            </div>
                                                      
                                                        </div>
                                                    </section>
                                                    <br><br>

                                                </c:when>
                                                <c:when test="${view == 'categories'}">
                                                    <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                                        <ul class="navbar-nav" id="inner">
                                                            <li class="nav-item">
                                                                <a href="${pageContext.request.contextPath}/createCategory" class="btn btn-warning" style="color: red; font-size: bold">
                                                                    Create New Category</a>
                                                            </li>

                                                        </ul>
                                                    </nav>

                                                    <section class="row" id="placement">
                                                        <div class="col-md-3 windowMenu">
                                                            <h4 class="heading1">Category Menu</h4>
                                                            <ul class="list-group placementMenu">
                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                    Category Notifications
                                                                </li>

                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                    My Categories
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-9 windowDisplay">
                                                            <h4 class="heading1">Category Display</h4>
                                                            <div class="navScroll">

                                                                <c:forEach var="i" begin="1" end="${categories.size()-1}">
                                                                    <div class="viewItem " onclick="toggleItem(this)">

                                                                        <div class="row">
                                                                            <div class="col-md-11 itemDate">
                                                                                <span>
                                                                                    Created: Today
                                                                                    <!-- ${categories[i]} -->
                                                                                    <br> Views of posts with category: 107 &nbsp;
                                                                                    | &nbsp; Average Rating: 3.75
                                                                                </span>
                                                                            </div>
                                                                            <div class="col-md-1 itemToggle">
                                                                                <i class="fas fa-angle-double-down"></i>
                                                                            </div>
                                                                            <div class="col-md-7 itemSummary">
                                                                                <span> Name: ${categories[i].categoryName} &nbsp;
                                                                                    |&nbsp; Creator: John Doe
                                                                                    <!-- ${categories[i]} -->
                                                                                </span>
                                                                                <p class="itemBrief">There are 5 posts with this category
                                                                                </p>
                                                                            </div>
                                                                            <div class="col-md-5 options">
                                                                                <div class="btn-group itemOptions" role="group" aria-label="Button group with nested dropdown">
                                                                                    <button type="button" class="btn btn-primary">View</button>
                                                                                    <button type="button" class="btn btn-warning">Edit</button>

                                                                                    <div class="btn-group" role="group">
                                                                                        <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                                                            aria-expanded="false">
                                                                                            Options
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                                            <a class="dropdown-item" href="#">Hide Posts</a>
                                                                                            <a class="dropdown-item" href="#">Delete Category </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </c:when>
                                                <c:when test="${view == 'tags'}">
                                                    <nav class="navbar navbar-expand-sm" id="mainUserNav">
                                                        <ul class="navbar-nav" id="inner">
                                                            <li class="nav-item">
                                                                <a href="${pageContext.request.contextPath}/createTag" class="btn btn-warning" style="color: red; font-size: bold"> Create New Tag</a>
                                                            </li>

                                                        </ul>
                                                    </nav>
                                                    <section class="row" id="placement">
                                                        <div class="col-md-3 windowMenu">
                                                            <h4 class="heading1">Tag Bench</h4>
                                                            <ul class="list-group placementMenu">
                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                    Tag Notifications
                                                                </li>

                                                                <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                    My Tags
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-9 windowDisplay">
                                                            <h4 class="heading1">Tag Display</h4>
                                                            <div class="navScroll">
                                                                
                                                                <c:forEach var="i" begin="1" end="${categories.size()-1}">
                                                                    <div class="viewItem " onclick="toggleItem(this)">
    
                                                                        <div class="row">
                                                                            <div class="col-md-11 itemDate">
                                                                                <span>
                                                                                    Created: Today
                                                                                    <!-- ${categories[i]} -->
                                                                                    <br> Views of posts with Tag: 1 &nbsp; | &nbsp;
                                                                                    Average Rating:  3.4
                                                                                </span>
                                                                            </div>
                                                                            <div class="col-md-1 itemToggle">
                                                                                <i class="fas fa-angle-double-down"></i>
                                                                            </div>
                                                                            <div class="col-md-7 itemSummary">
                                                                                <span> Name: ${tags[i].tagName} &nbsp; |&nbsp; Creator:
                                                                                    John Doe
                                                                                    <!-- ${categories[i]} -->
                                                                                </span>
                                                                                <p class="itemBrief">There are 5 posts with this Tag
                                                                                </p>
                                                                            </div>
                                                                            <div class="col-md-5 options">
                                                                                <div class="btn-group itemOptions" role="group" aria-label="Button group with nested dropdown">
                                                                                    <button type="button" class="btn btn-primary">View</button>
                                                                                    <button type="button" class="btn btn-warning">Edit</button>
    
                                                                                    <div class="btn-group" role="group">
                                                                                        <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                                                            aria-expanded="false">
                                                                                            Options
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                                            <a class="dropdown-item" href="#">Hide Posts</a>
                                                                                            <a class="dropdown-item" href="#">Delete Tag </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </section>
                                                </c:when>
                                            </c:choose>

                                        </div>
                                    </div>
                                    <br>
                                    <br>

                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="generalModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="generalModalLabel"></h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body" id="generalModalBody">
                                                </div>
                                                <div class="modal-footer" id="generalModalFooter">

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

                                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                        crossorigin="anonymous"></script>
                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                                        crossorigin="anonymous"></script>
                                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                                        crossorigin="anonymous"></script>
                                    <script src="${pageContext.request.contextPath}/js/main.js"></script>
                                </body>

                                </html>