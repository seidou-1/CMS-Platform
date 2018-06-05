<%-- 
    Document   : user
    Created on : May 31, 2018, 8:46:57 AM
    Author     : flake
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Users add page</title>
    </head>
    <body>

        <!--=============NAVBAR=============-->
        <div id="app" class="container">
            <!--===========BRAND NAME BUTTON==========-->
            <nav class="navbar navbar-expand-lg">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Bit BucketList Travels</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>


                <div id="navbarNavDropdown" class="navbar-collapse collapse">
                    <!--===========FLOATS RIGHT=========-->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/index"> <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
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
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/login">Login</a>
                                <a class="dropdown-item" href="#">Sign Up</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <hr>


        <h4>Create User</h4>
        <form action="createUser" method="POST">
            <label for="userName">Username </label> 
            <input class="formInput" type="text" id="userName" name="userName" value="randall" placeholder="${user.UserName}" /> <br>

            <label for="userType">User Type  </label> 
            <input class="formInput" type="text" id="userType" name="userType" value="1" placeholder="${user.userType}" /> <br>

            <label for="userEmail">Email </label> 
            <input class="formInput" type="text" id="userEmail" name ="userEmail" value="randall@sg.com" placeholder="${user.userEmail}" /> <br>

            <label for="userPassword">Password </label> 
            <input class="formInput" type="text" id="userPassword" name ="userPassword" value="rootSquared" placeholder="${user.userPassword}" /> <br>

            <label for="userAvatar">Avatar </label> 
            <input class="formInput" type="text" id="userAvatar" name ="userAvatar" value="Smiley" placeholder="${user.userAvatar}" /> <br>


            <button class="btn btn-primary"> Create User </button>

        </form>
    </body>
</html>
