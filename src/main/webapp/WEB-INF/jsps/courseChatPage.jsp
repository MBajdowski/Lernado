<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <img src="${currentPhoto}" class="img-responsive logo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                    <h1 class="text-center">${currentCourse.getTitle()} chat-room</h1>
                    </div>
                    <div class="col-md-2">
                        Go to course
                        <a href="${pageContext.request.contextPath}/course/${currentCourse.idcourse}"><i class='fa fa-3x fa-fw fa-arrow-left'></i></a>
                    </div>
                </div>
            </div>

            <jsp:include page="common/leftPanel.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-9">
                    <c:choose>
                        <c:when test="${chat.size() > 0}">
                            <c:forEach var="i" begin="0" end="${chat.size()-1}">
                                <div class="row">
                                    <c:choose>
                                        <c:when test="${chat.get(i).iduser==principalId}">
                                            <div class="col-md-2"></div>
                                            <div class="col-md-9 customOwnMessage">
                                                <b>${chat.get(i).author}</b><br>
                                                ${chat.get(i).message}
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-md-9 customMessage">
                                                <b>${chat.get(i).author}</b><br>
                                                ${chat.get(i).message}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <h3>Write a message: </h3>
                    <form id="myForm" class="form-horizontal" role="form" method="POST" action="${pageContext.request.contextPath}/course/${currentCourse.idcourse}/chatRoom">
                        <textarea rows="4" class="col-md-12" name="message" form="myForm" style="resize: none; margin-bottom: 5px;" placeholder="Write your message!">
                        </textarea><br>
                        <button type="submit" class="btn btn-primary pull-right">Send message</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>