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
        <div class="container">
            <h1>Bit BucketList Travels</h1>
            <hr/>

            <div class="row">
                <!-- NOTE: Please refer to the main.css file for custom css -->
                <!-- bg nav -->
                <div class="nav">
                    <!-- buttons for each nav -->
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/index" class="text-center">
                            <p>Bit BucketList Travels</p>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/addPost" class="text-center">
                            <p>Add Post</p>
                        </a>   
                    </div>
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/contact" class="text-center"> 
                            <p>Contact Us</p>
                        </a>   
                    </div>
                    <div class="col-md-3">
                        <li><a href="${pageContext.request.contextPath}/login" class="btn btn-large btn-primary" rel="popover" data-content='
                               <form id="mainForm" name="mainForm" method="post" action="">
                               <p>
                               <label>Name :</label>
                               <input type="text" id="txtName" name="txtName" />
                               </p>
                               <p>
                               <label>Address 1 :</label>
                               <input type="text" id="txtAddress" name="txtAddress" />
                               </p>
                               <p>
                               <label>City :</label>
                               <input type="text" id="txtCity" name="txtCity" />
                               </p>
                               <p>
                               <input type="submit" name="Submit" value="Submit" />
                               </p>
                               </form>
                               ' data-placement="top" data-original-title="Fill in form">Open form</a></li>


                    </div>
                </div>           
            </div>
            <div class="row landingIndex"></div>

            <div></div>






        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>


    </body>
</html>
