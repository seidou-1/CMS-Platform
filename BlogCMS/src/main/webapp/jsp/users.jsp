 `
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

                        </html>