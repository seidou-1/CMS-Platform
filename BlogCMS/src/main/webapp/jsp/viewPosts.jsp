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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <!-- Main CSS -->        
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet"> 


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
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/index"> </a>
                    </li>
                </ul>

                <ul class="navbar-nav">
                    <li class ="nav-item active">
                        <a class ="nav-link" href="${pageContext.request.contextPath}/viewPosts">View Posts</a>
                    </li>

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
            <form class="modal-content animate" action="#">
                <div class="imgcontainer">
                    <img src="img_avatar2.png" alt="Avatar" class="avatar">
                </div>

                <div class="container">
                    <label for="email"><b>Username</b></label>
                    <input type="text" placeholder="Enter Email" name="email" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <button type="submit" class="loginBtn">Login</button>
                    <label>
                        <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                </div>

                <div class="container modalContainer" style="background-color: RGBA(47, 52, 54, 0.6);">
                    <button type="button" onclick="document.getElementById('loginModal').style.display = 'none'" class="cancelbtn">Cancel</button>
                </div>
            </form>
        </div>


        <!--============PAGE CONTENT=============-->
        <div class="conatiner contentContainer">
            <div>
                <img src="images/get-buckets.png" alt = "Man getting buckets" class="center-block">
            </div>

            <br> <!-- Seperation-->



            <c:choose>

                <c:when test="${display == 'viewSinglePost'}">
                    <div class ="row">
                        
                        <div class="col-md-6 col-xs-12">
                            
                            <ul class ="displayPostDetails" style="list-style-type: none;">

                                <li>
                                    <span class = "postTitle"> Post Title: </span>
                                    <br>
                                    <span class = "outputtedTitle">
                                        <c:out value="${myPost.postTitle}"></c:out>
                                        </span>
                                    </li>

                                    <li>
                                        <span>
                                            <br>
                                            <span class ="postDate"> Post Date: </span>
                                            <br>
                                        <c:out value = "${myPost.postDate}"></c:out>
                                        </span>
                                    </li>

                                    <li>
                                        <span>
                                            <br>
                                            <span class ="postDate"> Category: </span>
                                            <br>

                                        <c:out value = "${myPost.category.categoryName}"></c:out>
                                        </span>
                                    </li>




                                </ul> 
                            </div>
                            <div class = "col-md-6 col-xs-12">
                                <ul class ="displayPostDetails" style="list-style-type: none;">

                                    <li>

                                    <c:choose>
                                        <c:when test = "${myPost.tag.size() > 0}">

                                            <span class = "postTags"> Tag(s):  </span>
                                            <br>
                                            <span class = "outputtedTags">

                                                <c:forEach items="${myPost.tag}" var = "tag">
                                                    <c:out value="${tag.tagName}"></c:out> 
                                                        <br>
                                                </c:forEach>
                                            </span>

                                        </c:when>


                                        <c:when test = "${myPost.tag == null}">

                                            <span class = "postTitle"> Tag(s):  </span>
                                            <br>
                                            <span class = "outputtedTitle">

                                                This post had no associated tags selected

                                            </span>

                                        </c:when>

                                        <c:otherwise>


                                            <span class = "postTitle"> Tag(s):  </span>
                                            <br>
                                            <span class = "outputtedTitle">

                                                This post had no associated tags selected

                                            </span>

                                        </c:otherwise>

                                    </c:choose>
 
                                </li>

                                <li>
                                    <span>
                                        <br>
                                        <span class ="postDate"> Expiration Date: </span>
                                        <br>

                                        <c:out value = "${myPost.expirationDate}"></c:out>
                                        </span>
                                    </li>


                                </ul>
                            </div>
                        </div>

                        <div class = "row">
                            <div class="col-md-12">
                                <ul style="list-style-type: none;">

                                    <li>
                                        <span>
                                            <br>
                                            <span class ="postBody"> Body: </span>
                                            <br>

                                        <c:out value = "${myPost.postBody}"></c:out>
                                        </span>
                                    </li>

                                </ul>
                            </div>

                        </div> 
                        
                        
                    <a href="${pageContext.request.contextPath}/choosePostToEdit?display=choose&postId=${myPost.postId}" class ="btn btn-warning">EDIT</a>

                </c:when>

                <c:when test="${display == 'choose'}">


                    <!-- Form Starts -->
                    <div class="row justify-content-center">
                        <div class ="choosePostToEdit col-md-8  ">
                            <form action ="editPost" class ="displayForm" method ="PUT" id="userForm"  >

                                <div class="form-group">
                                    <label for="postTitle" class="control-label col-xs-4">Title</label> 
                                    <div class="col-xs-8">
                                        <input id="postTitle" value = "${myPost.postTitle}" name="postTitle" placeholder="Post 2 Title" type="text" class="form-control">
                                    </div>
                                </div>



                                <br> <!-- Separation-->

                                <div class="form-group">

                                    <br> <!-- Separation-->

                                    <label for="postBody" class="control-label col-xs-4">Body</label> <!--How to get the textarea value -->
                                    <div class="col-xs-8">
                                        <textarea id="textarea" name="postBody" cols="40" rows="9" class="form-control" placeholder="">
                                            ${myPost.postBody}
                                            

                                        </textarea>
                                    </div>
                                </div>
                                <br> <!-- Seperation-->



                                <div class="form-group">
                                    <br> <!-- Seperation-->

                                    <label for="postDate" class="control-label col-xs-4">Post Date</label> <!-- Change this calendar to be a selection type-->
                                    <div class="col-xs-8">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div> 
                                            <input id="text" name="postDate" value = "${myPost.postDate}" placeholder="i.e. 2018-03-20" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <br> <!-- Seperation-->

                                <div class="form-group">

                                    <br> <!-- Seperation-->

                                    <label for="expirationDate" class="control-label col-xs-4">Post Expiration Date</label> 
                                    <div class="col-xs-8">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div> 
                                            <input id="expirationDate" name="expirationDate" value = "${myPost.expirationDate}" placeholder="i.e. 12/31/2022" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <br> <!-- Seperation-->

                                <div class="form-group">
                                    <input id="userId" name="userId" value = "${myPost.user.userId}" type = "hidden">

                                </div> 


                                <br> <!-- Seperation-->


                                <!-- ******************Category Selection************************-->

                                <div class="form-group">
                                    <!--<label for="category" class="control-label col-xs-4"></label>--> 
                                    <div class="col-xs-8">


                                        <h4>
                                            Select Category:
                                        </h4>
                                        <c:forEach items = "${allCategories}" var = "category">

                                            <label class="checkbox-inline">
                                                <input type="radio" name="category" value="${category.categoryId}">


                                                ${category.categoryName}
                                            </label>


                                        </c:forEach>
                                    </div>
                                </div>

                                <!-- ******************Category Selection************************-->


                                <!-- ******************Tag Selection************************-->
                                <div class="form-group"> 


                                    <h4> Select Tag(s): </h4>
                                    <div class="col-xs-8">

                                        <c:forEach items = "${allTags}" var = "tags">

                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="tags" value="${tags.tagId}">


                                                ${tags.tagName}
                                            </label>


                                        </c:forEach>

                                    </div>
                                </div>  
                                <!-- ******************Tag Selection************************-->

                                <div class="form-group row justify-content-center">
                                    <div class="col-xs-offset-4 col-xs-8">
                                        <button name="submit" type="submit" class="btn btn-primary" id ="createPost">Update</button>
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

                <c:otherwise > <!-- This otherwise is saying if it's not a single post you want, i'm going to display all the posts. It's like saying when test="{display == 'viewAllThePosts'}" or if there is no display value-->

                    <!--Asher to set the width to display 4 cards per row-->
                    
                    <div class = "entireCard">
                        <div class="card-deck">
                            <c:forEach var = "currentPost" begin="0" end="3"  >
                                <!--items= "${posts} "-->

                                <div class="card">
                                    <div class="card-header cardPostTitle">
                                        <h3>  <c:out value = "${posts[currentPost].postTitle}"/></h3>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text cardPostBody"> <c:out value = "${posts[currentPost].postBody}"/> </p>
                                        <a href="${pageContext.request.contextPath}/viewSinglePost?display=viewSinglePost&postId=${posts[currentPost].postId}" class ="btn btn-success">VIEW</a>
                                    </div>
                                    <div class="card-footer cardPostDate">
                                        <small class="text-muted">Post Date:  <c:out value = "${posts[currentPost].postDate}"/> </small>
                                    </div>
                                    <input id="userId" name="userId" value = "${posts[currentPost].user.userId}" type = "hidden">
                                    <a href="${pageContext.request.contextPath}/choosePostToEdit?display=choose&postId=${posts[currentPost].postId}" class ="btn btn-warning">EDIT</a>
                                    
                                </div>

                            </c:forEach>
                        </div>


                    </div>
                </c:otherwise>
            </c:choose>

        </div> <!--End of row -->

    </div> <!--End of container -->

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</body>


</html>
<c:choose>
    <c:when test = "${display == 'view'}">

    </c:when> 
    <c:otherwise>

    </c:otherwise>
</c:choose>

