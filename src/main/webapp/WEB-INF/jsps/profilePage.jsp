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
                        <img src="images/defaultProfile.jpg" class="img-responsive logo">
                    </div>
                    <div class="col-md-7">
                        <h1>Name Surname</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">

                    </div>
                </div>
                <div class="col-md-12">
                    <h1>Personal Information:</h1>
                    <form class="form-horizontal" role="form" method="POST" action="doEdit" enctype="multipart/form-data">
                        <div class="form-group" ng-mouseover="nameEdit=false" ng-mouseleave="nameEdit=true" ng-init="nameEdit=true">
                            <div class="col-sm-2">
                            <label class="control-label">Name:</label>
                                </div>
                            <div class="col-sm-8">
                            <input class="form-control" id="name" name="name" placeholder="Name" type="text">
                                </div>
                            <div class="col-sm-2"><a href="#" ng-hide="nameEdit"><i class="fa fa-3x fa-fw fa-edit"></i></a></div>
                        </div>
                        <div class="form-group"  ng-mouseover="surnameEdit=false" ng-mouseleave="surnameEdit=true" ng-init="surnameEdit=true">
                            <div class="col-sm-2">
                                <label class="control-label">Surname:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="surname" name="surname" placeholder="Surname" type="text">
                            </div>
                            <div class="col-sm-2"><a href="#" ng-hide="surnameEdit"><i class="fa fa-3x fa-fw fa-edit"></i></a></div>
                        </div>
                        <div class="form-group" ng-mouseover="nicknameEdit=false" ng-mouseleave="nicknameEdit=true" ng-init="nicknameEdit=true">
                            <div class="col-sm-2">
                                <label class="control-label">Nick-name:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="nickname" name="nickname" placeholder="Nick-name" type="text">
                            </div>
                            <div class="col-sm-2"><a href="#" ng-hide="nicknameEdit"><i class="fa fa-3x fa-fw fa-edit"></i></a></div>
                        </div>
                        <div class="form-group" ng-mouseover="emailEdit=false" ng-mouseleave="emailEdit=true" ng-init="emailEdit=true">
                            <div class="col-sm-2">
                                <label class="control-label">Email:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="emai" name="email" placeholder="Email" type="email">
                            </div>
                            <div class="col-sm-2"><a href="#" ng-hide="emailEdit"><i class="fa fa-3x fa-fw fa-edit"></i></a></div>
                        </div>
                        <div class="form-group" ng-mouseover="telEdit=false" ng-mouseleave="telEdit=true" ng-init="telEdit=true">
                            <div class="col-sm-2">
                                <label class="control-label">Tel. number:</label>
                            </div>
                            <div class="col-sm-8">
                                <input class="form-control" id="telephone" name="telephone" placeholder="Telephone number" type="text">
                            </div>
                            <div class="col-sm-2"><a href="#" ng-hide="telEdit"><i class="fa fa-3x fa-fw fa-edit"></i></a></div>
                        </div>
                        </form>
                    </div>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
        <div class="row">
            <div id="courses2" class="col-md-6">
                <h1 contenteditable="true">Your Courses:</h1>
                <ul class="list-group">
                    <form id="myForm1" class="form-horizontal" role="form" method="POST" action="doShowCourse">
                        <a onclick="">
                            <li class="h3 list-group-item list-group-item-success">Tytuł1</li>
                        </a>
                        <a onclick="">
                            <li class="h3 list-group-item list-group-item-success">Tytuł2</li>
                        </a>
                        <a onclick="">
                            <li class="h3 list-group-item list-group-item-success">Tytuł3</li>
                        </a>
                    </form>
                </ul>
            </div>
            <div id="rooms" class="col-md-6">
                <h1 contenteditable="true">Your Rooms:</h1>
                <ul class="list-group">
                    <form id="myForm2" class="form-horizontal" role="form" method="POST" action="doShowCourse">
                        <a onclick="">
                            <li class="h3 list-group-item list-group-item-success">Tytuł1</li>
                        </a>
                        <a onclick="">
                            <li class="h3 list-group-item list-group-item-success">Tytuł2</li>
                        </a>
                        <a onclick="">
                            <li class="h3 list-group-item list-group-item-success">Tytuł3</li>
                        </a>
                    </form>
                </ul>
            </div>
        </div>

        <div class="row">
            <div id="courses" class="col-md-12">
                <h1 contenteditable="true">Suggested Courses:&nbsp;</h1>
                <div id="owl-demo" class="owl-carousel owl-theme highlightedCarousel">
                    <div class='item'>
                        <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                            <img src="images/defaultProfile.jpg" class='img-responsive'>
                            <h2>Tytuł</h2>
                            <p>Opis</p>
                            <button type='submit' class='btn btn-primary'>More info</button>
                        </form>
                    </div>

                    <div class='item'>
                        <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                            <img src="images/defaultProfile.jpg" class='img-responsive'>
                            <h2>Tytuł2</h2>
                            <p>Opis2</p>
                            <button type='submit' class='btn btn-primary'>More info</button>
                        </form>
                    </div>

                    <div class='item'>
                        <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                            <img src="images/defaultProfile.jpg" class='img-responsive'>
                            <h2>Tytuł3</h2>
                            <p>Opis3</p>
                            <button type='submit' class='btn btn-primary'>More info</button>
                        </form>
                    </div>
                    <div class='item'>
                        <form class='form-horizontal' role='form' method='POST' action='doSearch'>
                            <img src="images/defaultProfile.jpg" class='img-responsive'>
                            <h2>Tytuł4</h2>
                            <p>Opis4</p>
                            <button type='submit' class='btn btn-primary'>More info</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <h1>Wishlist:</h1>
                <ul class="list-group">
                    <form id="myForm3" class='form-horizontal' role='form' method='POST' action='wishlist'>
                        <a onclick="">
                            <li class='h3 list-group-item list-group-item-success'>Tytuł1</li>
                        </a>
                        <a onclick="">
                            <li class='h3 list-group-item list-group-item-success'>Tytuł2</li>
                        </a>
                        <a onclick="">
                            <li class='h3 list-group-item list-group-item-success'>Tytuł3</li>
                        </a>
                    </form>
                </ul>
            </div>
        </div>
    </div>

</div>
<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>