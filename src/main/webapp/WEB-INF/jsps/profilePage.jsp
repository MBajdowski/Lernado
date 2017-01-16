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
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body ng-app="">
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-4">
                        <img src="${currentPhoto}" class="img-responsive logo">
                    </div>
                    <div class="col-md-7">
                        <h1><sec:authentication property="principal.firstName"/> <sec:authentication
                                property="principal.lastName"/></h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">

                    </div>
                </div>
                <div class="col-md-12">
                    <h2>Personal Information:</h2>
                    <form class="form-horizontal" role="form" method="POST"
                          action="${pageContext.request.contextPath}/user/edit" ng-init="notChanged=true"
                          enctype="multipart/form-data">
                        <div class="form-group" ng-mouseover="nameEdit=false" ng-mouseleave="nameEdit=true"
                             ng-init="nameEdit=true; nameInputEnable=true">
                            <div class="col-sm-2">
                                <label class="control-label">Name:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="firstName" name="firstName" value="<sec:authentication
                                property="principal.firstName"/>" type="text" ng-readonly="nameInputEnable"
                                       ng-blur="nameInputEnable=true" required>
                            </div>
                            <div class="col-sm-2"><a ng-hide="nameEdit"
                                                     ng-click="nameInputEnable=false; notChanged= false"><i
                                    class="fa fa-2x fa-fw fa-edit"></i></a></div>
                        </div>
                        <div class="form-group" ng-mouseover="surnameEdit=false" ng-mouseleave="surnameEdit=true"
                             ng-init="surnameEdit=true; surnameInputEnable=true">
                            <div class="col-sm-2">
                                <label class="control-label">Surname:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="lastName" name="lastName" value="<sec:authentication
                                property="principal.lastName"/>" type="text" ng-readonly="surnameInputEnable"
                                       ng-blur="surnameInputEnable=true" required>
                            </div>
                            <div class="col-sm-2"><a ng-hide="surnameEdit"
                                                     ng-click="surnameInputEnable=false; notChanged= false"><i
                                    class="fa fa-2x fa-fw fa-edit"></i></a></div>
                        </div>
                        <div class="form-group" ng-mouseover="nicknameEdit=false" ng-mouseleave="nicknameEdit=true"
                             ng-init="nicknameEdit=true; nicknameInputEnable=true">
                            <div class="col-sm-2">
                                <label class="control-label">Nick-name:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="nickName" name="nickName" value="<sec:authentication
                                property="principal.nickName"/>" type="text" ng-readonly="nicknameInputEnable"
                                       ng-blur="nicknameInputEnable=true">
                            </div>
                            <div class="col-sm-2"><a ng-click="nicknameInputEnable=false; notChanged= false"
                                                     ng-hide="nicknameEdit"><i class="fa fa-2x fa-fw fa-edit"></i></a>
                            </div>
                        </div>
                        <div class="form-group" ng-mouseover="emailEdit=false" ng-mouseleave="emailEdit=true"
                             ng-init="emailEdit=true; emailInputEnable=true">
                            <div class="col-sm-2">
                                <label class="control-label">Email:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="email" name="email" value="<sec:authentication
                                property="principal.email"/>" type="email" ng-readonly="emailInputEnable"
                                       ng-blur="emailInputEnable=true" required>
                            </div>
                            <div class="col-sm-2"><a ng-click="emailInputEnable=false; notChanged= false"
                                                     ng-hide="emailEdit"><i class="fa fa-2x fa-fw fa-edit"></i></a>
                            </div>
                        </div>


                        <div class="form-group" ng-mouseover="desEdit=false" ng-mouseleave="desEdit=true"
                             ng-init="desEdit=true; desInputEnable=true">
                            <div class="col-sm-2">
                                <label class="control-label">Description:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="description" name="description" value="<sec:authentication
                                property="principal.description"/>" type="text" ng-readonly="desInputEnable"
                                       ng-blur="desInputEnable=true">
                            </div>
                            <div class="col-sm-2"><a ng-click="desInputEnable=false; notChanged= false"
                                                     ng-hide="desEdit"><i class="fa fa-2x fa-fw fa-edit"></i></a></div>
                        </div>


                        <div class="form-group" ng-mouseover="telEdit=false" ng-mouseleave="telEdit=true"
                             ng-init="telEdit=true; telInputEnable=true">
                            <div class="col-sm-2">
                                <label class="control-label">Tel. number:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="phoneNumber" name="phoneNumber" value="<sec:authentication
                                property="principal.phoneNumber"/>" type="text" ng-readonly="telInputEnable"
                                       ng-blur="telInputEnable=true">
                            </div>
                            <div class="col-sm-2"><a ng-click="telInputEnable=false; notChanged= false"
                                                     ng-hide="telEdit"><i class="fa fa-2x fa-fw fa-edit"></i></a></div>
                        </div>
                        <div class="form-group" ng-mouseover="telEdit=false" ng-mouseleave="telEdit=true"
                             ng-init="telEdit=true; telInputEnable=true">
                            <div class="col-sm-2">
                                <label class="control-label">Photo:</label>
                            </div>
                            <div class="col-sm-8">
                                <input name="photo" type="file" ng-click="notChanged= false">
                            </div>
                        </div>
                        <div class="form-group">
                            <button type='submit' class='btn btn-primary pull-right' ng-hide="notChanged">Save changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
    </div>
</div>
<div class="section highlightedCarousel">
    <div class="container">
        <div class="row">
            <h1>Suggested courses:</h1>
        </div>
        <div id="paragraph1" class="row">
            <div id="owl-demo" class="owl-carousel owl-theme">
                <c:choose>
                    <c:when test="${suggested.size()>= 1}">
                        <c:forEach var="i" begin="0" end="${suggested.size()-1}">
                            <div class='item'>
                                <img src="${suggested.get(i).getValue()}"
                                     class='img-responsive'>
                                <h2>${suggested.get(i).getKey().title}</h2>
                                <p>${suggested.get(i).getKey().description}</p>
                                <a href='${pageContext.request.contextPath}/course/${suggested.get(i).getKey().idcourse}'>
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