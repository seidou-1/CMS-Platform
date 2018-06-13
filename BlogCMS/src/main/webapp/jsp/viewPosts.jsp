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
       
        <div class ="row">
            
            
            <!--<span class ="font-size: 24px; padding: 10px 0; font-weight: bold;"> All Blogs</span>-->
            
            <div class="col-md-8">
                
<!--                <table class ="table displayTable text-center">
                    
                    <thead>
                        
                        <tr>
                            <th>Post Title </th>
                            <th>Published Date </th>
                            <th>Category</th>
                            <th>Expiration Date</th>
                            <th>Post Tags</th>
                            
                        </tr>
                        
                    </thead>
                    
                    <tbody>
                        
                    </tbody>
                </table>-->

<c:forEach var = "currentPost" items= "${posts}">
    
    <a href="${pageContext.request.contextPath}/viewPosts?postId=${currentPost.postId}"/>
    
   <!-- Include display for title, body, dates...-->
   
   <p class = "text-center"><c:out value = "${currentPost.postTitle}"/></p>
   
   <p class ="text-center"><c:out value = "${currentPost.postDate}"/></p>
   
   <p class ="text-center"><c:out value = "${currentPost.expirationDate}"/></p>
   
   <p class ="text-center"><c:out value = "${currentPost.postBody}"/></p>
       
    
</c:forEach>
                
            </div> <!--End of col-md-8 Div-->
            
            
            
        </div> <!--End of row -->
        
        
        
        
        
</html>
