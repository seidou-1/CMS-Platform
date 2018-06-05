<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
                        <%@page contentType="text/html" pageEncoding="UTF-8"%>

                            <html>

                            <head>
                                <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
                                <title>Users add page</title>
                                <!-- Bootstrap core CSS -->
                                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
                                    crossorigin="anonymous">
                                <!-- Main CSS -->
                                <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
                            </head>

                            <body>

                                <!--=============NAVBAR=============-->
                                <div id="app" class="container">
                                    <!--===========BRAND NAME BUTTON==========-->
                                    <nav class="navbar navbar-expand-lg">
                                        <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Bit BucketList Travels</a>
                                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                                            aria-expanded="false" aria-label="Toggle navigation">
                                            <span class="navbar-toggler-icon"></span>
                                        </button>


                                        <div id="navbarNavDropdown" class="navbar-collapse collapse">
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
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/addPost">Add Post</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact Us</a>
                                                </li>

                                                <!--==========DROPDOWN==========-->
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
                                                        aria-expanded="false">
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


                                    <div class="row">
                                        <div class="col-md-6">
                                            <h4>Create User</h4>
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


                                                <button class="btn btn-primary"> Create User </button>

                                            </form>

                                        </div>

                                        <div class="col-md-5">
                                            <p> // Getting all users </p>
                                            <table>
                                                <thead>
                                                    
                                                    <tr>
                                                        <th> User ID </th>
                                                        <th> Username </th>
                                                        <th> Email</th>
                                                        <th> Password </th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="i" begin="1" end="${users.size() - 1}">
                                                        <tr>
                                                            <td>
                                                                <c:out value="${users[i].userId}"></c:out>
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
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <br>
                                            <hr>
                                            <br>

                                            <form action="deleteUser">
                                                <label for="userID"> // Delete user </label>
                                                <input class="formInput" type="text" id="userID" name="userID" value="2" placeholder="2" />
                                                <button class="btn btn-primary"> Delete User </button>
                                            </form>
                                            <br>
                                            <hr>
                                            <br>

                                            <form action="selectUser">
                                                <label for="userID"> // Select user </label>
                                                <input class="formInput" type="text" id="userID" name="userID" value="2" placeholder="2" />
                                                <button class="btn btn-primary"> Select User </button>
                                            </form>
                                            <h3> <c:out value="${user}"></c:out> true nuh</h3>
                                            <br>
                                        </div>
                                    </div>

                                </div>

                                </div>

                                <!-- Placed at the end of the document so the pages load faster -->
                                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                                    crossorigin="anonymous"></script>
                                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                                    crossorigin="anonymous"></script>
                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                                    crossorigin="anonymous"></script>

                            </body>

                            </html>