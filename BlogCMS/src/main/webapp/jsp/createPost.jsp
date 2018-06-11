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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


        <!-- Main CSS -->        
        <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">


        <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
        <script type="text/javascript">
            tinymce.init({
                selector: '#tinymce',
                plugins: "code image",
                toolbar: 'newdocument| bold italic | underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect | cut copy paste | bullist numlist | outdent indent blockquote | undo redo removeformat | subscript superscript |code',
                menubar: "insert",
            });
        </script>
    </head>

    <!--Banner and nav -->
    <body>

        <!-- Nav -->
        <div class="nav">

            <!-- buttons for each nav -->
            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/index" class="hero-btns text-center">
                    <p>Bit Bucket List Travels</p>
                </a>
            </div>

            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/createPost" class="hero-btns text-center">
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

        <div class="container landingIndex">
            <!--            <h1>Bit Bucket List Travels</h1>
                        <hr/>-->

            <div class="container"> <!-- Container starts -->
                <!-- NOTE: Please refer to the main.css file for custom css -->
                <!-- Place logo here -->
                <div class="logo-bg text-center">
                    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> 
                    <a href="${pageContext.request.contextPath}/" >
                        <img src="images/get-buckets.png" class="travel"></img>
                    </a>
                </div>



                <!-- Mo: logout option near Nav bar -->
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <p>Hello : ${pageContext.request.userPrincipal.name}
                        | <a href="<c:url value="/j_spring_security_logout" />" > Logout</a>
                    </p>
                </c:if>
                <!-- Mo: logout option near Nav bar -->



                <form method="post">
                    <div id="tinymce">Hello, World!</div>
                </form>



            </div> <!--Container closes-->

            <!--Tag  --> 



            <div class="taggable-container">
                <ul class="taggable-tags">
                    <li class="taggable-tag">
                        <div class="taggable-text">Foo</div>
                        <button type="button" class="taggable-remove"></button>
                    </li>
                    <li class="taggable-tag">
                        <div class="taggable-text">Bar</div>
                        <button type="button" class="taggable-remove"></button>
                    </li>
                </ul>
                <div class="taggable-input">
                    <input type="text" placeholder="Type something...">
                </div>
            </div>









        </div> <!--Container ends -->


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>



    </body>
</html>
