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
                                                    <a class="nav-link active" href="${pageContext.request.contextPath}/viewPosts">Posts</a>
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
                                    <div class="container">


                                        <c:choose>

                                            <c:when test="${display == 'viewSinglePost'}">
                                                <div class="row" id="postView">

                                                    <div class="col-md-3 col-xs-12" style="text-align: center">

                                                        <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Mohamed B">  
                                                        <p><c:out value="${myPost.user.username}"></c:out></p>
                                                    </div>
                                                    <div class="col-md-9 col-xs-12">
                                                        <ul class="displayPostDetails" style="list-style-type: none;">
                                                            <li>
                                                                <span class="postDate"> Date:
                                                                    <c:out value="${myPost.postDate}"></c:out>
                                                                </span>
                                                            </li>

                                                            <li>
                                                                <span>
                                                                    Category:
                                                                    <c:out value="${myPost.category.categoryName}"></c:out>
                                                                </span>
                                                            </li>
                                                            <li>

                                                                <c:choose>
                                                                    <c:when test="${myPost.tag.size() > 0}">

                                                                        <span class="postTags"> Tag(s): </span>

                                                                        <span class="outputtedTags">
                                                                            <c:forEach items="${myPost.tag}" var="tag">
                                                                                |
                                                                                <a href="#">
                                                                                    <c:out value="${tag.tagName}"></c:out>
                                                                                </a>
                                                                            </c:forEach>
                                                                        </span>
                                                                        |
                                                                    </c:when>


                                                                    <c:when test="${myPost.tag == null}">

                                                                        <span class="postTitle"> Tag(s): </span>
                                                                        <span class="outputtedTitle">

                                                                            This post had no associated tags selected

                                                                        </span>

                                                                    </c:when>

                                                                    <c:otherwise>


                                                                        <span class="postTitle"> Tag(s): </span>
                                                                        <span class="outputtedTitle">

                                                                            This post had no associated tags selected

                                                                        </span>

                                                                    </c:otherwise>

                                                                </c:choose>

                                                            </li>

                                                            <li style="text-align: right;">
                                                                <a href="${pageContext.request.contextPath}/viewPosts" class="btn btn-primary" style="margin-top: 5px; padding:5px;">  <i class="fas fa-chevron-left"></i> See all Posts</a>
                                                            </li>
 

                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <h5 class="postTitle" > <c:out value="${myPost.postTitle}"></c:out>  </h5>

                                                    <div class="col-md-12">
                                                        <ul style="list-style-type: none;">

                                                            <li class="myBody">
                                                        <img src="${myPost.featureImage}" alt="Mohamed B" style="width: 200px; float: left; margin: 10px;">  
                                                     
                                                                    <c:out value="${myPost.postBody}"></c:out>
                                                                </span>
                                                            </li>

                                                        </ul>
                                                    </div>

                                                </div>


                                                <a href="${pageContext.request.contextPath}/choosePostToEdit?display=choose&postId=${myPost.postId}" class="btn btn-warning">EDIT</a>

                                            </c:when>

                                            <c:when test="${display == 'choose'}">


                                                <!-- Form Starts -->
                                                <div class="row justify-content-center">
                                                    <div class="choosePostToEdit col-md-8  ">
                                                        <form action="editPost" class="displayForm" method="PUT" id="userForm">

                                                            <div class="form-group">
                                                                <label for="postTitle" class="control-label col-xs-4">Title</label>
                                                                <div class="col-xs-8">
                                                                    <input id="postTitle" value="${myPost.postTitle}" name="postTitle" placeholder="Post 2 Title" type="text" class="form-control">
                                                                </div>
                                                            </div>



                                                            <br>
                                                            <!-- Separation-->

                                                            <div class="form-group">

                                                                <br>
                                                                <!-- Separation-->

                                                                <label for="postBody" class="control-label col-xs-4">Body</label>
                                                                <!--How to get the textarea value -->
                                                                <div class="col-xs-8">
                                                                    <textarea id="textarea" name="postBody" cols="40" rows="9" class="form-control" placeholder="">${myPost.postBody}</textarea>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <!-- Seperation-->



                                                            <div class="form-group">
                                                                <br>
                                                                <!-- Seperation-->

                                                                <label for="postDate" class="control-label col-xs-4">Post Date</label>
                                                                <!-- Change this calendar to be a selection type-->
                                                                <div class="col-xs-8">
                                                                    <div class="input-group">
                                                                        <div class="input-group-addon">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </div>
                                                                        <input id="text" name="postDate" value="${myPost.postDate}" placeholder="i.e. 2018-03-20" type="text" class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <br>
                                                            <!-- Seperation-->

                                                            <div class="form-group">

                                                                <br>
                                                                <!-- Seperation-->

                                                                <label for="expirationDate" class="control-label col-xs-4">Post Expiration Date</label>
                                                                <div class="col-xs-8">
                                                                    <div class="input-group">
                                                                        <div class="input-group-addon">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </div>
                                                                        <input id="expirationDate" name="expirationDate" value="${myPost.expirationDate}" placeholder="i.e. 12/31/2022" type="text"
                                                                            class="form-control">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <br>
                                                            <!-- Seperation-->

                                                            <div class="form-group">
                                                                <input id="userId" name="userId" value="${myPost.user.userId}" type="hidden">

                                                            </div>


                                                            <br>
                                                            <!-- Seperation-->


                                                            <!-- ******************Category Selection************************-->

                                                            <div class="form-group">
                                                                <!--<label for="category" class="control-label col-xs-4"></label>-->
                                                                <div class="col-xs-8">


                                                                    <h4>
                                                                        Select Category:
                                                                    </h4>
                                                                    <c:forEach items="${allCategories}" var="category">

                                                                        <label class="checkbox-inline">
                                                                            <input type="radio" name="category" value="${category.categoryId}"> ${category.categoryName}
                                                                        </label>


                                                                    </c:forEach>
                                                                </div>
                                                            </div>

                                                            <!-- ******************Category Selection************************-->


                                                            <!-- ******************Tag Selection************************-->
                                                            <div class="form-group">


                                                                <h4> Select Tag(s): </h4>
                                                                <div class="col-xs-8 ">

                                                                    <c:forEach items="${allTags}" var="tags">

                                                                        <label class="checkbox-inline">
                                                                            <input type="checkbox" name="tags" value="${tags.tagId}"> ${tags.tagName}
                                                                        </label>


                                                                    </c:forEach>

                                                                </div>
                                                            </div>
                                                            <!-- ******************Tag Selection************************-->

                                                            <div class="form-group row justify-content-center">
                                                                <div class="col-xs-offset-4 col-xs-8">
                                                                    <button name="submit" type="submit" class="btn btn-primary" id="createPost">Update</button>
                                                                    <a href="${pageContext.request.contextPath}/viewSinglePost?display=viewSinglePost&postId=${myPost.postId}"></a>

                                                                    <div>

                                                                        <button name="cancel" type="cancel" class="btn btn-danger">Cancel</button>
                                                                        <a href="${pageContext.request.contextPath}/viewPosts"></a>
                                                                    </div>
                                                                </div>


                                                            </div>

                                                        </form>
                                                    </div>
                                                </div>


                                                <!-- Form Ends -->


                                            </c:when>

                                            <c:otherwise>
                                                <!-- This otherwise is saying if it's not a single post you want, i'm going to display all the posts. It's like saying when test="{display == 'viewAllThePosts'}" or if there is no display value-->

                                                <!--Asher to set the width to display 4 cards per row-->

                                                <div class="row">
                                                    <div class="col-md-9">

                                                        <h3>All Blog Posts</h3>

                                                        <div class="row">
                                                            <c:forEach var="currentPost" begin="0" end="${posts.size() - 1}">


                                                                <div class="card">

                                                                    <div class="post-details">

                                                                        <img src="${posts[currentPost].featureImage}" alt="My Image">
                                                                        <div>
                                                                            <h5>
                                                                                <c:out value="${posts[currentPost].postTitle}" />
                                                                            </h5>
                                                                            <span>
                                                                                <c:out value="${posts[currentPost].postDescription}" />
                                                                            </span>

                                                                            <hr>
                                                                            <br>
                                                                            <a href="${pageContext.request.contextPath}/viewSinglePost?display=viewSinglePost&postId=${posts[currentPost].postId}" class="btn btn-success">Read Post</a>

                                                                        </div>
                                                                        <div class=></div>
                                                                    </div>
                                                                    <div class="card-footer cardPostDate" style="display: flex">
                                                                        <div>
                                                                            <h4>Bloggers:
                                                                                <a href="3/">
                                                                                    <c:out value="${posts[currentPost].user.username}" />
                                                                                </a>
                                                                            </h4>
                                                                            <small style="font-weight: bold; font-size: 14px;">Post Date:
                                                                                <c:out value="${posts[currentPost].postDate}" /> </small>
                                                                        </div>
                                                                        <div>
                                                                            <h5>
                                                                                <i class="fas fa-book-reader"></i>
                                                                                <c:out value="${posts[currentPost].readers}" /> reads </h5>
                                                                            <h5>
                                                                                <i class="fas fa-heart"></i>
                                                                                <c:out value="${posts[currentPost].likes}" /> likes </h5>
                                                                            <h5>
                                                                                <i class="fas fa-share-alt"></i>
                                                                                <c:out value="${posts[currentPost].shares}" /> shares </h5>
                                                                        </div>

                                                                    </div>
                                                                    <input id="userId" name="userId" value="${posts[currentPost].user.userId}" type="hidden">
                                                                    <!-- <a href="${pageContext.request.contextPath}/choosePostToEdit?display=choose&postId=${posts[currentPost].postId}" class="btn btn-warning">EDIT</a> -->

                                                                </div>
                                                                <br>

                                                            </c:forEach>


                                                        </div>
                                                    </div>

                                                    <div class="col-md-3">
                                                        <div id="filterMe">
                                                            <h5>Filter Posts</h5>
                                                            <div>
                                                                <h5>Select by User</h5>
                                                                <input type="checkbox" name="user" id="1">
                                                                <span>Asherlife</span>
                                                                <br>
                                                                <input type="checkbox" name="user" id="2">
                                                                <span>Mattlife</span>
                                                                <br>
                                                                <input type="checkbox" name="user" id="3">
                                                                <span>Molife</span>
                                                                <br>
                                                                <input type="checkbox" name="user" id="4">
                                                                <span>Travzlife</span>
                                                                <br>
                                                            </div>


                                                            <div>
                                                                <h5>Select by Category</h5>
                                                                <input type="checkbox" name="category" id="1">
                                                                <span>Life</span>
                                                                <br>
                                                                <input type="checkbox" name="category" id="2">
                                                                <span>Food</span>
                                                                <br>
                                                                <input type="checkbox" name="category" id="3">
                                                                <span>Stars</span>
                                                                <br>
                                                                <input type="checkbox" name="category" id="4">
                                                                <span>Bad Girls</span>
                                                                <br>
                                                            </div>
                                                            <div>
                                                                <h5>Select by Tag</h5>
                                                                <input type="checkbox" name="tag" id="1">
                                                                <span>Game</span>
                                                                <br>
                                                                <input type="checkbox" name="tag" id="2">
                                                                <span>Untagged</span>
                                                                <br>
                                                                <input type="checkbox" name="tag" id="3">
                                                                <span>Burgers</span>
                                                                <br>
                                                                <input type="checkbox" name="tag" id="4">
                                                                <span>Sky</span>
                                                                <br>
                                                            </div>

                                                            <button>Filter Now</button>
                                                            <br>
                                                            <a href="">Reset</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                    <!--End of row -->

                                    </div>
                                    <br>
                                    <br>
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