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
