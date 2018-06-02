<%-- 
    Document   : addPost
    Created on : Jun 1, 2018, 5:43:21 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Posts</title>

        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <!-- Main CSS -->        
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
    </head>

    <!--Banner and nav -->
    <body>
        <div class="container landingIndex">
            <h1>Bit Bucket List Travels</h1>
            <hr/>

            <div class="container">
                <!-- NOTE: Please refer to the main.css file for custom css -->
                <!-- Place logo here -->
                <div class="logo-bg text-center">
                    <a href="${pageContext.request.contextPath}/" >
                        <img src="images/logo.png" class="logo"></img>
                    </a>
                </div>


                <!-- Nav -->
                <div class="nav">

                    <!-- buttons for each nav -->
                    <div class="col-md-3">
                        <a href="${pageContext.request.contextPath}/index" class="hero-btns text-center">
                            <p>Bit Bucket List Travels</p>
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
                <!-- Nav ends-->            

                <div class ="row"> <!-- First row starts-->
                    <form action="createPost" class="displayForm" method="POST">
                        <div class="col-md-8">
                            <div class="btn-group btn-group-lg" role="group">

                                <button class="btn btn-secondary" type="button">
                                    Placeholder 1
                                </button> 
                                <button class="btn btn-secondary" type="button">
                                    Placeholder 2
                                </button> 
                                <!-- <button class="btn btn-secondary" type="button">
                                        Right
                                </button> 
                                <button class="btn btn-secondary" type="button">
                                        Justify
                                </button> -->
                            </div>
                            <p>
                                Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
                            </p>
                        </div>
                        <div class="col-md-4">


                            <div id="card-172162">
                                <div class="card">
                                    <div class="card-header">
                                        <a class="card-link collapsed" data-toggle="collapse" data-parent="#card-172162" href="#card-element-324970">Collapsible Group Item #1</a>
                                    </div>
                                    <div id="card-element-324970" class="collapse">
                                        <div class="card-body">
                                            Anim pariatur cliche...
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <a class="card-link collapsed" data-toggle="collapse" data-parent="#card-172162" href="#card-element-476329">Collapsible Group Item #2</a>
                                    </div>
                                    <div id="card-element-476329" class="collapse">
                                        <div class="card-body">
                                            Anim pariatur cliche...
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row btn-group"> <!-- Second Row starts-->
                                <div class="col-md-6">

                                    <button type="button" class="btn btn-success">
                                        Cancel
                                    </button>
                                </div>
                                <div class="col-md-6">

                                    <button type="button" class="btn btn-success">
                                        Delete Post
                                    </button>
                                </div>

                                <!-- Publish button-->

                                <button type="button" class="btn btn-success">
                                    Publish
                                </button>
                            </div>

                        </div>

                    </form>

                </div> <!--2nd Row ends -->


            </div> <!--Container ends -->
        </div>

    </body>
</html>
