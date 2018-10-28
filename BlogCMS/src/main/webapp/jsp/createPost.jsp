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
                                <hr>

                                <!--=============LANDING PLANE IMAGE========-->

                                <!--===========LOGIN MODAL===========-->
                                <div id="loginModal" class="modal">
                                    <span onclick="document.getElementById('loginModal').style.display = 'none'" class="close" title="Close Modal">&times;</span>

                                    <!-- Modal Content -->
                                    <form role="form" class="modal-content animate" action="j_spring_security_check" method="POST">
                                        <!--                <div class="imgcontainer">
                    <img src="img_avatar2.png" alt="Avatar" class="avatar">
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

                                            <button type="submit" class="loginBtn" id="search-button" value="Sign In">Login</button <label>
                                            <input type="checkbox" checked="checked" name="remember"> Remember me
                                            </label>
                                        </div>

                                        <div class="container modalContainer" style="background-color: RGBA(47, 52, 54, 0.6);">
                                            <button type="button" onclick="document.getElementById('loginModal').style.display = 'none'" class="cancelbtn">Cancel</button>
                                        </div>
                                    </form>
                                </div>


                                <!--============PAGE CONTENT=============-->
                                <div class="container">
                                    <div style="width: 100%; height:200px; overflow: hidden">
                                        <img style="margin-top: -120px" src="images/tea.png" alt="Man getting buckets">
                                    </div>



                                    <div class="row">

                                        <br>
                                        <br>

                                        <div id="postForm" class="col-md-12">
                                            <br>
                                            <h4>Write your very own Post here</h4>
                                            <h6>What's on that mind of yours? Create something beautiful to share with the world</h6>

                                            <hr>
                                            <!-- Form Starts -->
                                            <form action="createPost" class="displayForm" method="POST" id="userForm">
                                                <br>

                                                <div class="form-group">
                                                    <label for="postTitle" class="control-label">1. Title: Tell us what we should name your post</label>
                                                    <div class="col-xs-8">
                                                        <input id="postTitle" name="postTitle" placeholder="The life of an angel" type="text" class="form-control">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="postDescription" class="control-label">2. Description: Write a brief highlighter of your post. very Important</label>
                                                    <div class="col-xs-8">
                                                        <input id="postDescription" name="postDescription" placeholder="Mind blowing highlights goes here that captures your readers attention"
                                                            type="text" class="form-control">
                                                    </div>
                                                </div>



                                                <div class="form-group">

                                                    <label for="postBody" class="control-label col-xs-4">3. Body: Be smart, use a dictionary</label>
                                                    <!--How to get the textarea value -->
                                                    <div class="col-xs-8">
                                                        <textarea id="textarea" name="postBody" cols="40" rows="5" class="form-control" placeholder="All of the juicy post details goes here"></textarea>
                                                    </div>
                                                </div>
                                                <br>
                                                <!-- Seperation-->

                                                <div id="options">
                                                    <div>
                                                        <h6>4. What Category is this post?</h6>
                                                        <ul>
                                                            <c:forEach items="${allCategories} " var="category ">

                                                                <li class="checkbox-inline ">
                                                                    <input type="radio " name="category " value="${category.categoryId} "> ${category.categoryName}
                                                                </li>

                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                    <div>
                                                        <h6>5. What Tags is this post?</h6>
                                                        <ul>
                                                            <c:forEach items="${allTags} " var="tags ">

                                                                <li class="checkbox-inline ">
                                                                    <input type="checkbox " name="tags " value="${tags.tagId} "> ${tags.tagName}
                                                                </li>


                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div id="featuredImage">
                                                    <hr>
                                                    <h6 style="text-align: center;  padding-top: 5px; ">6. Would you like to add a featured image? (Optional)</h6>
                                                    
                                                    <div>
                                                        <img src="${pageContext.request.contextPath}/images/get-buckets.png" alt="">

                                                        <div>
                                                            <h6>You can add a beautiful image that helps describe how you feel
                                                                as you write your post. Your readers will love your for it and feel like they are important to you.
                                                                </h6>
                                                                <br>
                                                            <a href="#" class="btn btn-primary">Upload Image</a>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="featuredImage" hidden>
                                                </div>

                                                <div class="form-group ">
                                                    <input id="userId " name="username " value="${pageContext.request.userPrincipal.name}" type="text" hidden>
                                                </div>

                                                <hr>

                                                <div class="form-group row ">
                                                    <div style="display: flex; justify-content: center; width: 100%;">
                                                        <button name="cancel" type="submit" class="btn btn-danger" id="subPost">Submit Post</button>
                                                    </div>
                                                </div>

                                            </form>


                                        </div>
                                        <!-- div class col-md-7 ends-->

                                        <!-- ******************Category Selection************************-->
                                        <!-- <div class=" col-md-12 ">
                                            <ul class="nav nav-pills nav-stacked categoryList ">
                                                <c:forEach items="${categoryList} " var="category ">
                                                    <li class="nav-item ">
                                                        <span>
                                                            <a class="nav-link " href="# ">${category.categoryName}</a>
                                                            <a href="${pageContext.request.contextPath}/editCategory " data-toggle="modal
                                                            " data-target="#updateCatModal " onclick="document.getElementById(
                                                            'updateCatModal').style.display='block' ">
                                                                Edit
                                                            </a>
                                                        </span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div> -->

                                        <!--========ADD CATEGORY BUTTON=========-->
                                        <!-- <a href="# " data-toggle="modal " data-target="#addCatModal " onclick="document.getElementById(
                                                            'addCatModal').style.display='block' ">
                                            <button type="submit " class="addCatBtn " value="Update Cattegory ">Add Category </button>
                                        </a> -->

                                        <!--============ADD CATEGORY MODAL===========-->
                                        <!-- <div id="addCatModal " class="modal ">
                                            <span onclick="document.getElementById( 'addCatModal').style.display='none' " class="close " title="Close Modal ">&times;</span>
                                        
                                            <div class="modal-content animate ">
                                                <div class="container form-group ">
                                                    <label for="categoryName " class="col-md-4 control-label ">Category Name:</label>
                                                    <input type="text " class=" col-md-8 form-control " id="categoryName " name="categoryName
                                                            " placeholder="${c} " maxlength="45 " required>
                                                    <button class="addCatBtn " id="addCat-btn " value="Add Category ">Submit</button>
                                                </div>
                                                <div class="container modalContainer " style="background-color: RGBA(47, 52, 54, 0.6); ">
                                                    <button type="button " onclick="document.getElementById( 'addCatModal').style.display='none'
                                                            " class="cancelbtn ">Cancel</button>
                                                </div>
                                            </div>
                                        </div> -->

                                        <!--============UPDATE CATEGORY MODAL===========-->
                                        <!-- <div id="updateCatModal " class="modal ">
                                            <span onclick="document.getElementById( 'updateCatModal').style.display='none' " class="close " title="Close Modal ">&times;</span>
                                        
                                            <form role="form " class="modal-content animate " action="updateCategory " method="POST ">
                                                <label for="categoryName " class="col-md-4 control-label ">Category Name:</label>
                                                <input type="text " class=" col-md-8 form-control " id="category-name " name="categoryName
                                                            " placeholder="Category Name " maxlength="45 " />
                                                <button type="submit " class="updateCatBtn " id="updateCat-btn " value="updateCattegory ">Submit</button>

                                                <div class="container modalContainer " style="background-color: RGBA(47, 52, 54, 0.6); ">
                                                    <button type="button " onclick="document.getElementById( 'updateCatModal').style.display='none'
                                                            " class="cancelbtn ">Cancel</button>
                                                </div>
                                            </form>
                                        </div> -->
                                        <!-- ******************Category Selection************************-->



                                        <!-- ******************Previous Posts************************-->
                                        <div class="col-md-12">
                                            <!-- div class col-md-5 starts-->



                                            <!-- Previous posts\Categories\Tags will display here-->

                                            <!-- ******************Previous Posts************************-->
                                            <div class="scrollable ">
                                                <!-- Contains for each data-->
                                                <br>
                                                <h4>Recent Posts</h4>
                                                <table class="table displayTable text-center ">

                                                    <thead>
                                                        <tr>
                                                            <th>Post Title</th>
                                                            <th>Date</th>
                                                            <th>Category</th>
                                                        </tr>

                                                    </thead>

                                                    <tbody>
                                                        <c:forEach items="${allPosts} " var="post ">

                                                            <tr>
                                                                <td>
                                                                    ${post.postTitle}
                                                                </td>
                                                                <td>
                                                                    ${post.postDate}
                                                                </td>
                                                                <td>
                                                                    ${post.category.categoryName}
                                                                </td>
                                                            </tr>

                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                            </div>
                                            <!-- Scrollable class ends-->

                                            <!-- ******************Previous Posts************************-->

                                        </div>





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


                                <!-- Placed at the end of the document so the pages load faster -->
                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js "></script>
                                <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js " integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo
                                                            " crossorigin="anonymous "></script>-->
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js " integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49
                                                            " crossorigin="anonymous "></script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js " integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T
                                                            " crossorigin="anonymous "></script>
                                <script src="${pageContext.request.contextPath}/js/main.js "></script>

                            </body>

                            </html>