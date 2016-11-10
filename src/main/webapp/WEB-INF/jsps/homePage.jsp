<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/homePage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <img src="${pageContext.request.contextPath}/images/computerTlo.jpg" class="img-responsive logo">
                    </div>
                </div>
                <h1 class="text-center text-primary header2">Welcome to Lernado Platform <sec:authentication
                        property="principal.name"/>!</h1>

                <p class="text-center menuitems">Lorem ipsum dolor sit amet, consectetur adipisici elit,
                    <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                    <br>Ut enim ad minim veniam, quis nostrud</p>
                <h2 contenteditable="true">My Courses:</h2>
                <ul class="list-group">
                    <li class="h3 list-group-item">Computing Technologies for the Web</li>
                    <li class="list-group-item list-group-item-success h3">Software Engineering</li>
                    <li class="list-group-item list-group-item-success h3">User Interfaces</li>
                    <li class="list-group-item list-group-item-success h3">Electronic Components and Circuits</li>
                    <li class="list-group-item list-group-item-success h3">Real Time Systems</li>
                </ul>
                <h2 contenteditable="true">My Rooms:</h2>
                <ul class="list-group">
                    <li class="h3 list-group-item">EITI- new students</li>
                    <li class="list-group-item list-group-item-success h3">Course 16Z - Software Engineering</li>
                    <li class="list-group-item list-group-item-success h3">ECE group</li>
                </ul>
                <h1>Popoular courses:</h1>
                <div class="row">
                    <div class="col-md-4">
                        <img src="http://www.hogwart.edu.pl/swiadectwa/grudzien2013/pucharq.png" class="img-responsive">
                        <h1>Achievement1</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-4">
                        <img src="https://ahmadataka.files.wordpress.com/2014/01/achievement.gif"
                             class="img-responsive">
                        <h1>Achievement2</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-4">
                        <img src="https://carlweberconsulting.files.wordpress.com/2012/06/gold-trophy-cup.jpg"
                             class="img-responsive">
                        <h1>Achievement3</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 tlo">
                <ul class="kolumna list-group">
                    <li class="h2 list-group-item">My Profile</li>
                    <li class="h2 list-group-item">My Courses</li>
                    <li class="h2 list-group-item">My Rooms</li>
                    <li class="h2 list-group-item">Wishlist</li>
                    <li class="h2 list-group-item">Create Course</li>
                    <li class="h2 list-group-item">Create Room</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>