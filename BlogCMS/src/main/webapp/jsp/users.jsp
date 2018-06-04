 <!-- `
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
                <%@page contentType="text/html" pageEncoding="UTF-8"%>
                    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
                        <!DOCTYPE html>
                        <html>

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                            <title>Users add page</title>
                        </head>

                        <body>
                            <hr/>

                            <h3> // Creating a user </h3>
                            <h5>// This is form is connected to the database. When the user clicks the button the form pushes
                                (method = Post) to "createUser" requestMapping on the UserController
                            </h5>
                            <form action="createUser" method="POST">
                                <label for="userName">Username </label>
                                <input class="formInput" type="text" id="userName" name="userName" value="randall" placeholder="${user.UserName}" />
                                <br>

                                <label for="userType">User Type </label>
                                <input class="formInput" type="text" id="userType" name="userType" value="1" placeholder="${user.userType}" />
                                <br>

                                <label for="userEmail">Email </label>
                                <input class="formInput" type="text" id="userEmail" name="userEmail" value="randall@sg.com" placeholder="${user.userEmail}"
                                />
                                <br>

                                <label for="userPassword">Password </label>
                                <input class="formInput" type="text" id="userPassword" name="userPassword" value="rootSquared" placeholder="${user.userPassword}"
                                />
                                <br>

                                <label for="userAvatar">Avatar </label>
                                <input class="formInput" type="text" id="userAvatar" name="userAvatar" value="Smiley" placeholder="${user.userAvatar}" />
                                <br>

                                <input class="formInput" type="text" id="userId" name="userId" value="1" hidden/>
                                <br>

                                <button class="btn btn-primary"> Create User </button>

                            </form>
                            <hr>

                            <h3> // Getting all users </h3>
                            <h5>// We use a for each loop to loop through an array of Users from the database </h5>
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th>User ID</th>
                                        <th>User Type</th>
                                        <th>User Name</th>
                                        <th>User Email</th>
                                        <th>User Password</th>
                                        <th>User Avatar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="i" begin="0" end="${users.size()}">
                                        <tr>
                                            <td>
                                                <c:out value="${users[i].userId}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${users[i].userType}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${users[i].username}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${users[i].email}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${users[i].userPassword}"></c:out>
                                            </td>
                                            <td>
                                                <c:out value="${users[i].userAvatar}"></c:out>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <hr>
<!-- 
                            <h3> // Getting a single users information </h3>
                            <h5>// We ask the user to select a user by id </h5> -->
                        </body>

                        </html> -->
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/addPost">Add Post</a>
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
