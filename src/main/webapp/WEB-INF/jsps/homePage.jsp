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
    <link href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/css/defaultStyles.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/owl.theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/carouselHighlited.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
    <script src="${pageContext.request.contextPath}/js/carouselHighlited.js"></script>
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
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-center text-primary header2">Welcome to Lernado Platform <sec:authentication
                                property="principal.firstName"/>!</h1>

                        <p class="text-center menuitems">Lorem ipsum dolor sit amet, consectetur adipisici elit,
                        <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                        <br>Ut enim ad minim veniam, quis nostrud</p>
                    <h2>My Courses:</h2>
                    <ul class="list-group">
                        <li class="h3 list-group-item">Computing Technologies for the Web</li>
                        <li class="list-group-item list-group-item-success h3">Software Engineering</li>
                        <li class="list-group-item list-group-item-success h3">User Interfaces</li>
                        <li class="list-group-item list-group-item-success h3">Electronic Components and Circuits</li>
                        <li class="list-group-item list-group-item-success h3">Real Time Systems</li>
                    </ul>
                    <h2>My Rooms:</h2>
                    <ul class="list-group">
                        <li class="h3 list-group-item">EITI- new students</li>
                        <li class="list-group-item list-group-item-success h3">Course 16Z - Software Engineering</li>
                        <li class="list-group-item list-group-item-success h3">ECE group</li>
                    </ul>
                    <br>
                    <h1>Popoular courses:</h1>
                        <div class="section highlightedCarousel">
                            <div class="container">
                                <div id="paragraph1" class="row">
                                    <div id="owl-demo" class="owl-carousel owl-theme">


                                        <div class='item'>
                                            <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                                     class='img-responsive'>
                                                <h2>Title</h2>
                                                <p>Description</p>
                                                <input type='hidden' name='idCourse' value="courseId">
                                                <button type='submit' class='btn btn-primary'>More info</button>
                                            </form>
                                        </div>
                                        <div class='item'>
                                            <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                                     class='img-responsive'>
                                                <h2>Title</h2>
                                                <p>Description</p>
                                                <input type='hidden' name='idCourse' value="courseId">
                                                <button type='submit' class='btn btn-primary'>More info</button>
                                            </form>
                                        </div>
                                        <div class='item'>
                                            <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                                     class='img-responsive'>
                                                <h2>Title</h2>
                                                <p>Description</p>
                                                <input type='hidden' name='idCourse' value="courseId">
                                                <button type='submit' class='btn btn-primary'>More info</button>
                                            </form>
                                        </div>
                                        <div class='item'>
                                            <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                                     class='img-responsive'>
                                                <h2>Title</h2>
                                                <p>Description</p>
                                                <input type='hidden' name='idCourse' value="courseId">
                                                <button type='submit' class='btn btn-primary'>More info</button>
                                            </form>
                                        </div>
                                        <div class='item'>
                                            <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                                     class='img-responsive'>
                                                <h2>Title</h2>
                                                <p>Description</p>
                                                <input type='hidden' name='idCourse' value="courseId">
                                                <button type='submit' class='btn btn-primary'>More info</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
         </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>