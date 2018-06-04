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
    </head>

    <!--Banner and nav -->
    <body>
        <div class="container landingIndex">
            <h1>Bit Bucket List Travels</h1>
            <hr/>

            <div class="container"> <!-- Container starts -->
                <!-- NOTE: Please refer to the main.css file for custom css -->
                <!-- Place logo here -->
                <div class="logo-bg text-center">
                    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> 
                    <a href="${pageContext.request.contextPath}/" >
                        <img src="images/get-buckets.png" class="travel"></img>
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

                <div class ="row"> <!-- First row starts-->
                    <!--<form action="createPost" class="displayForm" method="POST" id="userForm">-->



                    <!--Mo: pick up here.. work on form testing-->





                    <!-- ASAP Rocky Testing-->

                    <!--<form action="createPost" class="displayForm" method="POST" id="userForm">-->

                    <form action ="createPost" class ="displayForm" method ="POST" id="userForm">
                    
                    <div class="form-group">
                        <label for="postTitle" class="control-label col-xs-4">Title</label> 
                        <div class="col-xs-8">
                            <input id="postTitle" value = "island vibes" name="postTitle" placeholder="Post Title" type="text" class="form-control">
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <label for="category" class="control-label col-xs-4">Category</label> 
                        <div class="col-xs-8">
                            <input id="categoryId" value = "1" name="categoryId" placeholder="1" type="text" class="form-control">
<!--                            <select multiple="multiple" value = "1" id="categoryId" name="categoryId" class="select form-control">
                                <option value="Beaches">Beaches</option>
                                <option value="Sky Scrapers">Sky Scrapers</option>
                                <option value="Views">Views</option>
                                <option value="1">CategoryID1</option>
                                <option value="1">TagID1</option>
                            </select>-->
                        </div>
                    </div>
                        
                    <div class="form-group">    
                        <label for="tags" class="control-label col-xs-4">Tags</label> 
                        <div class="col-xs-8">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Programming" checked>
                                Programming
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Ice Cream">
                                Ice Cream
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Mountains">
                                Mountains
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="tags" value="Fishing">
                                Fishing
                            </label>
                        </div>
                    </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
                    <br> <!-- Seperate tags from Body-->

                    <div class="form-group">
                        <br> <!-- Seperate tags from Body-->

                        <label for="postBody" class="control-label col-xs-4">Body</label> 
                        <div class="col-xs-8">
                            <textarea id="textarea" name="postBody" cols="40" rows="9" class="form-control">
                                
                            
                            post detailsssssss body
 

                            </textarea>
                        </div>
                    </div>
                    <br> <!-- Seperation-->

                    <div class="form-group">
                        <br> <!-- Seperation-->

                        <label for="postDate" class="control-label col-xs-4">Post Date</label> 
                        <div class="col-xs-8">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div> 
                                <input id="text" name="postDate" value = "2018-03-20" placeholder="i.e. 12/22/2018" type="text" class="form-control">
                            </div>
                        </div>
                    </div>

                    <br> <!-- Seperation-->

                    <div class="form-group">

                        <br> <!-- Seperation-->

                        <label for="expirationDate" class="control-label col-xs-4">Post Expiration Date</label> 
                        <div class="col-xs-8">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div> 
                                <input id="expirationDate" name="expirationDate" value = "2018-03-20" placeholder="i.e. 12/31/2022" type="text" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userId" class="control-label col-xs-4">UserID</label> 
                        <div class="col-xs-8">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      Z
                            <select id="userId" name="userId" value = "1" class="select form-control">
                                <option value="1">UserID1</option>
                                <option value="2">UserID2</option>
                            </select>
                        </div>
                    </div> 
                                                                                                                                                                                                                                                                                   v class="form-group row">
                        <div class="col-xs-offset-4 col-xs-8">
                            <button name="submit" type="submit" class="btn btn-primary" id ="createPost">Publish</button>
                            <button name="cancel" type="submit" class="btn btn-danger">Cancel</button>
                        </div>
                        
                        </form>
                </div> <!-- First row ends -->
                <!--</form>-->







            </div> <!--Container closes-->












        </div> <!--Container ends -->
    </div>

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>



</body>
</html>
