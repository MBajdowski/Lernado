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
                <h1>My Rooms</h1>
                <div class="col-md-8">
                    <ul class="list-group">
                        <c:choose>
                            <c:when test="${rooms.size() >= 1}">
                                <c:forEach var="i" begin="0" end="${rooms.size()-1}">
                                    <a href='${pageContext.request.contextPath}/room/${rooms.get(i).getIdroom()}'>
                                        <li class="h3 list-group-item list-group-item-success">${rooms.get(i).getTitle()}</li>
                                    </a>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <h4 style="color:grey">You are not in any room<br>
                                <a href="${pageContext.request.contextPath}/course/advanceSearch?phrase=&category=Any&level=Any&roomChecked=true">Search for one!</a></h4>
                            </c:otherwise>
                        </c:choose>
                    </ul>
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