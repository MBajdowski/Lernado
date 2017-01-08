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
                        <img src="${pageContext.request.contextPath}/images/computerTlo.jpg"
                             class="img-responsive logo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-center text-primary header2">Welcome to Lernado Platform <sec:authentication
                                property="principal.firstName"/>!</h1>

                        <p class="text-center menuitems">Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>

                    </div>
                </div>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-9">
                        <h2>My Courses:</h2>
                        <ul class="list-group">
                            <c:choose>
                                <c:when test="${courses.size() >= 1}">
                                    <c:forEach var="i" begin="0" end="${courses.size()-1}">
                                        <a href='${pageContext.request.contextPath}/course/${courses.get(i).getIdcourse()}'>
                                            <li class="h3 list-group-item">${courses.get(i).getTitle()}</li>
                                        </a>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </ul>
                        <h2>My Rooms:</h2>
                        <ul class="list-group">
                            <c:choose>
                                <c:when test="${rooms.size() >= 1}">
                                    <c:forEach var="i" begin="0" end="${rooms.size()-1}">
                                        <a href='${pageContext.request.contextPath}/room/${rooms.get(i).getIdroom()}'>
                                            <li class="h3 list-group-item">${rooms.get(i).getTitle()}</li>
                                        </a>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </ul>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h1>Popoular courses:</h1>
            <div class="col-md-12 section highlightedCarousel">
                <div class="container">
                    <div id="paragraph1" class="row">
                        <div id="owl-demo" class="owl-carousel owl-theme">


                            <div class='item'>
                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                     class='img-responsive'>
                                <h2>Title</h2>
                                <p>Description</p>
                                <button type='submit' class='btn btn-primary'>More info</button>
                            </div>
                            <div class='item'>
                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                     class='img-responsive'>
                                <h2>Title</h2>
                                <p>Description</p>
                                <button type='submit' class='btn btn-primary'>More info</button>
                            </div>
                            <div class='item'>
                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                     class='img-responsive'>
                                <h2>Title</h2>
                                <p>Description</p>
                                <button type='submit' class='btn btn-primary'>More info</button>
                            </div>
                            <div class='item'>
                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                     class='img-responsive'>
                                <h2>Title</h2>
                                <p>Description</p>
                                <button type='submit' class='btn btn-primary'>More info</button>
                            </div>
                            <div class='item'>
                                <img src="https://unsplash.imgix.net/reserve/N13RIliTTASBbuYyszgq_P9020914-54.jpg?w=1024&q=50&fm=jpg&s=9c914a5c9288fc66860fde2c45521ff4"
                                     class='img-responsive'>
                                <h2>Title</h2>
                                <p>Description</p>
                                <button type='submit' class='btn btn-primary'>More info</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>