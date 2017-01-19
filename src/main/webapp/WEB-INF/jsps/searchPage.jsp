<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/owl.theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/carouselHighlited.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
    <script src="${pageContext.request.contextPath}/js/carouselHighlited.js"></script>
    <link href="${pageContext.request.contextPath}/css/defaultStyles.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/angular.min.js"></script>

</head>
<body ng-app="">
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9 text-center">
                <div class="row">
                    <div class="col-md-4">
                        <h1>Search:</h1><br>
                    </div>
                </div>
                <form class="form-horizontal" role="form" method="GET" action="${pageContext.request.contextPath}/course/advanceSearch">
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-7">
                            <div class="form-group textfield">
                                <div class="col-sm-10">
                                    <input type="text" name="phrase" value="${searchBean.phrase}"
                                           class="form-control input-sm">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-11 text-left">
                            <h3 class="text-muted">Advanced Searching:<a href="" ng-click="showMenu = !showMenu">
                                <i class="fa fa-1x fa-fw fa-angle-double-down"></i></a></h3></div>
                    </div>
                    <div ng-init="showMenu=false" ng-show="showMenu">
                        <div class="row">
                            <div class="col-sm-1">
                                <label class="control-label">Category</label>
                            </div>
                            <div class="col-sm-4">
                                <select class="form-control" name="category">
                                    <option value="Any" selected="selected">Any</option>
                                    <option value="Programming">Programming</option>
                                    <option value="Economics">Economics</option>
                                    <option value="Computer Networks">Computer Networks</option>
                                    <option value="Telecommunication">Telecommunication</option>
                                    <option value="Design">Design</option>
                                    <option value="Data Bases">Data Bases</option>
                                </select>
                            </div>
                            <div class="col-sm-1">
                                <label class="control-label">Level</label>
                            </div>
                            <div class="col-sm-4">
                                <select class="form-control" name="level">
                                    <option value="Any" selected="selected">Any</option>
                                    <option value="easy">Easy</option>
                                    <option value="medium">Medium</option>
                                    <option value="hard">Hard</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-2">
                                <label class="control-label">Search for:</label>
                            </div>
                            <div class="col-sm-3">
                                <input type="radio" name="roomChecked" value="false" ng-checked="true"> Courses
                                <input type="radio" name="roomChecked" value="true"> Rooms
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-info">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
    </div>
</div>

<div class='section'>
    <div class='container'>
        <div class='row'>
            <h1 ng-hide="${searchBean.roomChecked}">Courses:</h1>
            <h1 ng-show="${searchBean.roomChecked}">Rooms:</h1>
        </div>
    </div>
    <c:if test="${pairs.size()> 0}">
        <c:forEach var="i" begin="0" end="${pairs.size()-1}">
            <c:if test="${i%3==0}">
                <div class='container'>
                <div class='row'>
            </c:if>
            <div class='col-md-4'>
                <div style="margin-bottom: 15px">
                    <img src="${pairs.get(i).getValue()}"
                         class='img-responsive'>
                    <h2>${pairs.get(i).getKey().title}</h2>
                    <p>${pairs.get(i).getKey().description}</p>
                    <c:choose>
                        <c:when test="${searchBean.roomChecked}">
                            <a href='${pageContext.request.contextPath}/room/${pairs.get(i).getKey().idroom}'>
                                <button class='btn btn-primary'>More info</button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href='${pageContext.request.contextPath}/course/${pairs.get(i).getKey().idcourse}'>
                                <button class='btn btn-primary'>More info</button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${searchBean.roomChecked}"></c:if>
                </div>
            </div>
            <c:if test="${(i%3==2&&i>0)||(i==pairs.size()-1)}">
                </div>
                </div>
            </c:if>
        </c:forEach>
    </c:if>

    <div class='container'>
        <div class='row'>
            <div class="col-md-6 text-left">
                <c:if test="${(page-1)>=0}">
                    <form method="GET", role="search", action="${pageContext.request.contextPath}/course/advanceSearch">
                        <input type="hidden" name="phrase" value="${searchBean.phrase}">
                        <input type="hidden" name="category" value="${searchBean.category}">
                        <input type="hidden" name="level" value="${searchBean.level}">
                        <input type="hidden" name="roomChecked" value="${searchBean.roomChecked}">
                        <input type="hidden" name="page" value="${page-1}">
                        <input type="submit" value="<-- Previous page">
                    </form>
                </c:if>
            </div>
            <div class="col-md-6 text-right">
                <c:if test="${!endOfList}">
                    <form method="GET", role="search", action="${pageContext.request.contextPath}/course/advanceSearch">
                        <input type="hidden" name="phrase" value="${searchBean.phrase}">
                        <input type="hidden" name="category" value="${searchBean.category}">
                        <input type="hidden" name="level" value="${searchBean.level}">
                        <input type="hidden" name="roomChecked" value="${searchBean.roomChecked}">
                        <input type="hidden" name="page" value="${page+1}">
                        <input type="submit" value="Next page -->">
                    </form>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="section highlightedCarousel">
    <div class="container">
        <div id="paragraph1" class="row">
            <h1>Highlighted:</h1>
            <div id="owl-demo" class="owl-carousel owl-theme">
                <c:choose>
                    <c:when test="${highlighted.size()>= 1}">
                        <c:forEach var="i" begin="0" end="${highlighted.size()-1}">
                            <div class='item'>
                                <img src="${highlighted.get(i).getValue()}"
                                     class='img-responsive'>
                                <h2>${highlighted.get(i).getKey().title}</h2>
                                <p>${highlighted.get(i).getKey().description}</p>
                                <a href='${pageContext.request.contextPath}/course/${highlighted.get(i).getKey().idcourse}'>
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