<%@page import="java.util.*" %>
<%@page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html><head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="bootstrapFiles/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrapFiles/bootstrap.min.js"></script>
		<link href="font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="css/homePage.css" rel="stylesheet" type="text/css">
        
        <link href="css/owl.carousel.css" rel="stylesheet">
        <link href="css/owl.theme.css" rel="stylesheet">
        <link href="css/carouselHighlited.css" rel="stylesheet">
    	<script src="js/owl.carousel.js"></script>
    	<script src="js/carouselHighlited.js"></script>
    </head><body>
		<jsp:include page="common/header.jsp"></jsp:include>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 text-center">
                        <div class="row">
                            <div class="col-md-4">
                                <h1>Search Course:&nbsp;</h1>
                            </div>
                            <div class="col-md-8">
                                <form class="form-horizontal" role="form" method="POST" action="doWordSearch">
                                    <div class="form-group textfield">
                                        <div class="col-sm-10">
                                            <input type="text" name="word" class="form-control input-sm">
                                        </div>
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h2 class="text-muted">Advanced Searching:</h2>
                                <form class="form-horizontal" role="form" method="POST" action="doAdvancedSearch">
                                    <div class="form-group">
                                        <div class="col-sm-2">
                                            <label class="control-label">Category</label>
                                        </div>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="category">
                                                 <option value="Any">Any</option>
                                                   <option value="Programming">Programming</option>
								                    <option value="Economics">Economics</option>
								                     <option value="Computer Networks">Computer Networks</option>
								                    <option value="Telecommunication">Telecommunication</option>
								                    <option value="Design">Design</option>
								                    <option value="Data Bases">Data Bases</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <div class="col-sm-2">
                                            <label class="control-label">Level</label>
                                        </div>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="level">
                                                <option value="Any">Any</option>
                                               <option value="easy">Easy</option>
							                    <option value="medium">Medium</option>
							                    <option value="hard">Hard</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-info">Search</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="kolumna list-group">
                            <a href="StudentProfilePage">
                	        <li class="list-group-item h2">
                		        My Profile
                	        </li>
                            </a>
                            <a href="StudentProfilePage">
                	        <li class="list-group-item h2">
                		        Taken Courses
                	        </li>
                            </a>
                            <a href="StudentProfilePage">
                	        <li class="list-group-item h2">
                		        My Achievements
                	        </li>
                            </a>
                            <a href="StudentHomePage">
                	        <li class="list-group-item h2">
                		        My Home Page
                	        </li>
                            </a>
                            </div> </div>
        <div class="section section-success">
            <div class="container">
                <div id="paragraph1" class="row">
                    <div id="owl-demo" class="owl-carousel owl-theme">
                    </div>
                </div>
            </div>
        </div>
        <div class="section"><div class="container"><div class="row">
            <div class="col-md-4">
                <form class="form-horizontal" role="form" method="POST" action="doSearch">
                <img src="" class="img-responsive">
                <h2>Title</h2>
                <p>Description</p>
                <input type="hidden" name="idCourse" value="">
                <button type="submit" class="btn btn-primary">More info</button>
                </form>
            </div>
        </div>
        </div>
        </div>
	<jsp:include page="common/footer.jsp"></jsp:include>
</body></html>