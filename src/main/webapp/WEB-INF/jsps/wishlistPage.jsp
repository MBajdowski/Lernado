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
                <h1> Your Wishlist:</h1>
                <br>
                <c:choose>
                    <c:when test="${wishlist.size()> 0}">
                        <c:forEach var="i" begin="0" end="${wishlist.size()-1}">
                            <c:if test="${i%4==0}">
                                <div class="row">
                            </c:if>
                            <a href="${pageContext.request.contextPath}/course/${wishlist.get(i).getKey().idcourse}">
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <img src="${wishlist.get(i).getValue()}" class='img-responsive'>
                                    <div class="caption">
                                        <h3>${wishlist.get(i).getKey().title}</h3>
                                        <p>Price: ${wishlist.get(i).getKey().price}<br>
                                            <br>Category: ${wishlist.get(i).getKey().category}
                                            <br>Level: ${wishlist.get(i).getKey().level}</p>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <c:if test="${(i%4==3&&i>0)||(i==wishlist.size()-1)}">
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
<jsp:include page="common/leftPanel.jsp"></jsp:include>
</div>
</div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>