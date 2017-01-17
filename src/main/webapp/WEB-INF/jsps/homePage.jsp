<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
    <script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
</head>
<body ng-app="">
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

                        <p class="text-center menuitems">We are honored to welcome you on the best e-learning platform
                            ever!<br>
                            We are grateful that you want to create with us a new world, <br>
                            in which everyone can have an easy access to the knowledge anywhere and anytime.<br>
                            We wish you the best experience!</p>

                    </div>
                </div>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
    </div>
</div>
<div class="section highlightedCarousel" ng-hide="${popular.isEmpty()}">
    <div class="container">
        <div class="row">
            <h1>Popoular courses:</h1>
        </div>
        <div id="paragraph1" class="row">
            <div id="owl-demo" class="owl-carousel owl-theme">
                <c:choose>
                    <c:when test="${popular.size()>= 1}">
                        <c:forEach var="i" begin="0" end="${popular.size()-1}">
                            <div class='item'>
                                <img src="${popular.get(i).getValue()}"
                                     class='img-responsive'>
                                <h2>${popular.get(i).getKey().title}</h2>
                                <p>${popular.get(i).getKey().description}</p>
                                <a href='${pageContext.request.contextPath}/course/${popular.get(i).getKey().idcourse}'>
                                    <button class='btn btn-primary'>More info</button>
                                </a>
                            </div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>