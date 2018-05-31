<%-- 
    Document   : addCategory
    Created on : May 28, 2018, 5:00:27 PM
    Author     : darthvader
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
        <title>BBLT</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <!-- Main CSS -->        
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet"> 
    </head>
    <body>
        <div class="container landingIndex">
            <h1>Bit BucketList Travels</h1>
            <hr/>

            <div class="container">
                <!-- NOTE: Please refer to the main.css file for custom css -->
                <!-- Place logo here -->
                <div class="logo-bg text-center">
                    <a href="${pageContext.request.contextPath}/" >
                        <img src="images/logo.png" class="logo"></img>
                    </a>
                </div>
                <!-- bg nav -->
                <div class="nav">

                    <!-- buttons for each nav -->
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/index" class="hero-btns text-center">
                            <p>Bit BucketList Travels</p>
                        </a>
                    </div>

                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/addPost" class="hero-btns text-center">
                            <p>Add Post</p>
                        </a>   
                    </div>

                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/contact" class="hero-btns text-center"> 
                            <p>Contact Us</p>
                        </a>   
                    </div>

                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/login" class="hero-btns text-center"> 
                            <p>Login</p>
                        </a>    
                    </div>

                </div>
            </div>
        </div>

        <!--=======ADD CATEGORY FORM==========-->
        <div class="container">
            <form role="form" method="POST" 
                  action="submitSuper">

                <div class="form-group">
                    <label for="exampleFormControlInput1">Category Name</label>
                    <input type="text" class="form-control" name="orgName" placeholder="Add Category Name" maxlength="45" required>
                </div>

                <!--=============BUTTONS====================-->
                <input type="submit" class="btn btn-default" value="Submit Category"/>
                <a href="${pageContext.request.contextPath}/addPost" class="btn btn-danger" role="button">Cancel</a>

            </form>
        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


    </body>
</html>