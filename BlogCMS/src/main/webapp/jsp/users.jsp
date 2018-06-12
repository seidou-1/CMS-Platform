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
                                    <div id="app" class="container">
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
                                                                <span> User: ${notifications[i].user} ${notifications[i].notificationClass}  a ${notifications[i].notificationType}</span>
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