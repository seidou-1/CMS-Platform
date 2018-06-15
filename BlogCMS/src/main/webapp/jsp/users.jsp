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
                                            <div id="windowOptions">
                                                <!-- <div class="dropdown show" id="dropdownDiv">
                                                    <a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        Filters
                                                    </a>

                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                        <a class="dropdown-item" href="#">Users</a>
                                                        <a class="dropdown-item" href="#">Posts</a>
                                                        <a class="dropdown-item" href="#">Categories</a>
                                                        <a class="dropdown-item" href="#">Tags</a>
                                                    </div>
                                                </div> -->
                                            </div>
                                            <div id="viewItems">

                                                <c:choose>
                                                    <c:when test="${view == 'notifications'}">
                                                        <section class="row" id="placement">
                                                            <div class="col-md-3 windowMenu">
                                                                <h4 class="heading1">Notification Menu</h4>
                                                                <ul class="list-group placementMenu">
                                                                    <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                        My Notifications
                                                                    </li>
                                                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                        Pending
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
                                                                                    <button type="button" class="btn btn-success">View</button>
                                                                                    <button type="button" class="btn btn-primary">Approve</button>

                                                                                    <div class="btn-group" role="group">
                                                                                        <button id="btnGroupDrop1" type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                                                                            aria-expanded="false">
                                                                                            Deny
                                                                                        </button>
                                                                                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                                                            <a class="dropdown-item" href="#">Request Edits</a>
                                                                                            <a class="dropdown-item" href="#">Vanquish</a>
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
                                                                    <li class="list-group-item d-flex justify-content-between align-items-center ">
                                                                        Manage Users
                                                                    </li>
                                                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                            Filter Users
                                                                        </li>
                                                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                        My Settings
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
                                                                                    <br> Posts: 31 &nbsp; | &nbsp; Categories: 3 &nbsp; | &nbsp; Tags: 3
                                                                                </span>
                                                                            </div>
                                                                            <div class="col-md-1 itemToggle">
                                                                                <i class="fas fa-angle-double-down"></i>
                                                                            </div>
                                                                            <div class="col-md-7 itemSummary">
                                                                                <span> User: ${users[i].username} &nbsp; | &nbsp; Admin </span>
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
                                                                        Post Notifications
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
                                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                            crossorigin="anonymous"></script>
                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                                            crossorigin="anonymous"></script>
                                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                                            crossorigin="anonymous"></script>
                                        <script src="${pageContext.request.contextPath}/js/main.js"></script>
                                </body>

                                </html>