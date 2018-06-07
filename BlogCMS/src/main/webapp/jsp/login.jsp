<%-- 
    Document   : login
    Created on : Jun 7, 2018, 12:25:52 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bit Bucket List Travels</title>
    </head>
    <body>

        <div class="container">
            <h1>Blog CMS</h1>

            <hr/>
            <h2>Login Page</h2>

            <c:if test="${param.login_error == 1}">
                <h3>Wrong id or password!</h3>
            </c:if>


            <!-- Mo: This is just a placehodler. Asher's login form goes here-->

            <form class="form-horizontal" 
                  role="form" 
                  method="post" 
                  action="j_spring_security_check">
                <div class="form-group">
                    <label for="j_username" 
                           class="col-md-4 control-label">Username:</label>
                    <div class="col-md-8">
                        <input type="text" 
                               class="form-control" 
                               name="j_username" 
                               placeholder="Username"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="j_password" 
                           class="col-md-4 control-label">Password:</label>
                    <div class="col-md-8">
                        <input type="password" 
                               class="form-control" 
                               name="j_password" 
                               placeholder="Password"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <input type="submit" 
                               class="btn btn-default" 
                               id="search-button" 
                               value="Sign In"/>
                    </div>
                </div>
            </form>   

            <!-- Mo: This is just a placehodler. Asher's login form goes here-->



        </div>
                <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
