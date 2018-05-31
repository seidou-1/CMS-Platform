<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<t:genericpage>
    <jsp:attribute name="header">
      <h1>Welcome</h1>
    </jsp:attribute>
    <jsp:attribute name="footer">
      <p id="copyright">Copyright 2018, Team Shinobi Inc.</p>
    </jsp:attribute>
    <jsp:body>
      <div class="container">
            <h1>Spring MVC Application from Archetype</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                	<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                	<li role="presentation"><a href="${pageContext.request.contextPath}/hello/sayhi">Hello Controller</a></li>
                </ul>    
            </div>
            <h2>Home Page</h2>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </jsp:body>
</t:genericpage>
        


<t:genericpage>
    <jsp:attribute name="header">
      <h1>BUCKET LIST TRAVELS</h1>
    </jsp:attribute>
    <jsp:attribute name="footer">
      <p id="copyright">Copyright 2018, Team Shinobi Inc.</p>
    </jsp:attribute>
    <jsp:body>
      <div class="container-fluid">
	<div class="row">
		<div class="col-md-9">
			<ul class="nav">
				<li class="nav-item">
					<a class="nav-link active" href="#">About Us</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Add Post</a>
				</li>
				<li class="nav-item">
					<a class="nav-link disabled" href="#">Contact Us</a>
				</li>
                                
                                <li class="nav-item">
					<a class="nav-link disabled" href="#">Login</a>
				</li>
				<li class="nav-item dropdown ml-md-auto">
					 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown link</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
						 <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
						<div class="dropdown-divider">
						</div> <a class="dropdown-item" href="#">Separated link</a>
					</div>
				</li>
			</ul>
			<h3>
				h3. Lorem ipsum dolor sit amet.
                                <p>
				Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
			</p>
			</h3>
			<h3>
				h3. Lorem ipsum dolor sit amet.
			</h3>
			<p>
				Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
			</p>
			<p class="text-info">
				Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
			</p>
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="col-md-3">
			 
			<button type="button" class="btn btn-success btn-block disabled">
				Button
			</button> 
			<button type="button" class="btn btn-block btn-info">
				Button
			</button>
			<div class="tabbable" id="tabs-527352">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active show" href="#panel-460929" data-toggle="tab">Section 1</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#panel-275264" data-toggle="tab">Section 2</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active show" id="panel-460929">
						<p>
							I'm in Section 1.
						</p>
					</div>
					<div class="tab-pane" id="panel-275264">
						<p>
							Howdy, I'm in Section 2.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
                
                
                
                
                
                
                
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </jsp:body>
</t:genericpage>
        


