<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
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
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <h1>My Courses</h1>
                <div class="row">
                    <div class="col-md-5">
                        <h2>Attended courses:</h2>
                        <ul class="list-group">
                            <c:choose>
                                <c:when test="${attendedCourses.size() >= 1}">
                                    <c:forEach var="i" begin="0" end="${attendedCourses.size()-1}">
                                        <a href='${pageContext.request.contextPath}/course/${attendedCourses.get(i).getIdcourse()}'>
                                            <li class="h3 list-group-item list-group-item-success">${attendedCourses.get(i).getTitle()}</li>
                                        </a>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <h4 style="color:grey">You don't attend for any course<br>
                                    <a href="${pageContext.request.contextPath}/course/advanceSearch?phrase=">Search for one!</a></h4>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-5">
                        <h2>Created Courses:</h2>
                        <ul class="list-group">
                            <c:choose>
                                <c:when test="${createdCourses.size() > 0}">
                                    <c:forEach var="i" begin="0" end="${createdCourses.size()-1}">
                                        <a href='${pageContext.request.contextPath}/course/${createdCourses.get(i).getIdcourse()}'>
                                            <li class="h3 list-group-item list-group-item-success">${createdCourses.get(i).getTitle()}</li>
                                        </a>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <h4 style="color:grey">You haven't created any course</h4>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>

            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
    </div>
    <div class="fillScreen">
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>