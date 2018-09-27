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

                                    <hr>

                                    <!--=============NAVBAR=============-->
                                    <div id="app" class="container-fluid">
                                        <!--===========BRAND NAME BUTTON==========-->
                                        <nav class="navbar navbar-expand-lg">
                                            <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Bit BucketList Travels</a>
                                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                                                aria-expanded="false" aria-label="Toggle navigation">
                                                <span class="navbar-toggler-icon"></span>
                                            </button>


                                            <div id="navbarNavDropdown" class="navbar-collapse collapse">
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
                                                        <a class="nav-link" href="${pageContext.request.contextPath}/addPost">Add Post</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact Us</a>
                                                    </li>

                                                    <!--==========DROPDOWN==========-->
                                                    <li class="nav-item dropdown">
                                                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                                                            aria-expanded="false">
                                                            Login
                                                        </a>
                                                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/login">Login</a>
                                                            <a class="dropdown-item" href="#">Sign Up</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </nav>

                                        <hr>


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
                                            <div id="viewItems">

                                                <c:choose>
                                                    <c:when test="${view == 'notifications'}">
                                                        <section class="row" id="placement">
                                                            <div class="col-md-3 windowMenu">
                                                                <h4 class="heading1">Notification Menu</h4>
                                                                <ul class="list-group placementMenu">
                                                                    <li class="list-group-item d-flex justify-content-between align-items-center ">
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
                                                                <h4 class="heading1">Notification Display</h4>
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
                                                                                <span> User: ${notifications[i].user} ${notifications[i].notificationClass}
                                                                                    a ${notifications[i].notificationType}</span>
                                                                                <p class="itemBrief ">${notifications[i].notificationBrief} </p>
                                                                                </p>
                                                                            </div>
                                                                            <div class="col-md-5 options">
                                                                                <div class="btn-group itemOptions" role="group" aria-label="Button group with nested dropdown">
                                                                                    <a data-toggle="modal" data-target="#exampleModal" href="#" class="btn btn-success" onclick="populateModal('notifications_view', `${notifications[i].notificationID}`)">View </a>
                                                                                    <a data-toggle="modal" data-target="#exampleModal" href="#" class="btn btn-primary" onclick="populateModal('notifications_approve', `${notifications[i].notificationID}`)">Approve </a>

                                                                                    <div class="btn-group" role="group">
                                                                                        <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true"
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
                                                                                    Admin </span>
                                                                                <p class="itemBrief">This user has 1 post, 2 tags, 42 categories
                                                                                    pending
                                                                                </p>
                                                                            </div>
                                                                            <div class="col-md-5 options">
                                                                                <div class="btn-group itemOptions" role="group" aria-label="Button group with nested dropdown">
                                                                                    <button type="button" class="btn btn-success">Stats</button>
                                                                                    <button type="button" class="btn btn-warning">Edit</button>

                                                                                    <div class="btn-group" role="group">
                                                                                        <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                                                            aria-expanded="false">
                                                                                            Disable
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                                            <a class="dropdown-item" href="#">Ban for week</a>
                                                                                            <a class="dropdown-item" href="#">Ban until </a>
                                                                                            <a class="dropdown-item" href="#">Delete User </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
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
                                                                <h4 class="heading1">Post Bench</h4>
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
                                                        </section>
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
                                                                <h4 class="heading1">Category Bench</h4>
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
                                                                <c:forEach var="i" begin="1" end="${categories.size()-1}">
                                                                    <div class="viewItem " onclick="toggleItem(this)">

                                                                        <div class="row">
                                                                            <div class="col-md-11 itemDate">
                                                                                <span>
                                                                                    Created: Today
                                                                                    <!-- ${categories[i]} -->
                                                                                    <br> Views of posts with Tag: 107 &nbsp;
                                                                                    | &nbsp; Average Rating: 3.75
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
                                                        </section>
                                                    </c:when>
                                                </c:choose>

                                            </div>
                                        </div>


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
                                                    <div class="modal-body"  id="generalModalBody">
                                                    </div>
                                                    <div class="modal-footer" id="generalModalFooter">
                                                        
                                                    </div>
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
