<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    <div class="col-md-4">
                        <img src="${currentPhoto}" class="img-responsive">
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-9">
                                <h1>${currentCourse.title}</h1>
                            </div>
                            <c:choose>
                                <c:when test="${inWishlist}">
                                    <div class="col-md-3 text-center">
                                        <form id="myForm" class="form-horizontal" role="form" method="GET" action="${pageContext.request.contextPath}/course/removeFromWishlist">
                                            <input type="hidden" name="idCourse" value="${currentCourse.idcourse}">
                                            <a onclick="document.getElementById('myForm').submit();"><i class="fa fa-3x fa-fw fa-heart" style="color: red"></i></a>
                                        </form>
                                        <h4>Remove from Wishlist</h4>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-md-3 text-center">
                                        <form id="myForm" class="form-horizontal" role="form" method="GET" action="${pageContext.request.contextPath}/course/addToWishlist">
                                            <input type="hidden" name="idCourse" value="${currentCourse.idcourse}">
                                            <a onclick="document.getElementById('myForm').submit();"><i class="fa fa-3x fa-fw fa-heart"></i></a>
                                        </form>
                                        <h4>Add to Wishlist</h4>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="row">
                            <form class="form-horizontal" role="form" method="POST" action="${pageContext.request.contextPath}/course/${currentCourse.idcourse}/enroll">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-lg btn-success">Enroll for the course for
                                        ${currentCourse.price}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <h2>Category: ${currentCourse.category}</h2>
                        <h2>Description:</h2>
                        <p>${currentCourse.description}</p>
                        <h2>Level: ${currentCourse.level}</h2>
                    </div>
                </div>
                <hr>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>

            <div class="row">
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-2">
                            <img src="${currentTeacherPhoto}" class="img-responsive logo">
                        </div>
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2>${currentTeacher.firstName} ${currentTeacher.lastName}</h2>
                                    <h3>Telephone number: ${currentTeacher.phoneNumber}</h3>
                                    <h3>About Teacher:</h3>
                                    <p> ${currentTeacher.description}</p>
                                </div>
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