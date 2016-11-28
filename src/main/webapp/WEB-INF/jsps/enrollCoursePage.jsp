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
                        <img src="images/courseDefault.jpg" class="img-responsive">
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-9">
                                <h1>Title</h1>
                            </div>
                            <div class="col-md-3 text-center">
                                <form id="myForm" class="form-horizontal" role="form" method="POST" action="">
                                    <a onclick=""><i class="fa fa-3x fa-fw fa-heart"></i></a>
                                </form>
                                <h4>Add to Wishlist</h4>
                            </div>
                        </div>
                        <div class="row">
                            <form class="form-horizontal" role="form" method="POST" action="">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-lg btn-success">Enroll for the course for 100Euro </button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <h2>Category: Programming</h2>
                        <h2>Description:</h2>
                        <p>Course Description</p>
                        <h2>Level: Medium</h2>
                    </div>
                </div>
                <hr>

                <div class="row">
                    <div class="col-md-2">
                    <img src="images/defaultProfile.jpg" class="img-responsive logo">
                    </div>
                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-12">
                    <h2>TeacherName TeacherSurname</h2>
                                <h3>Telephone number: </h3>
                                <h3>About Teacher: </h3>
                                <p>Teacher Description</p>
                            </div>
                        </div>
                    </div>
                </div>
                <br><br>

                <div class="row">
                    <div class="col-md-12">
                            <h1>Lesson1 - Title of lesson1</h1>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <i class="-circle-o fa fa-2x fa-file-movie-o fa-fw"></i>Video1 - Title of the video1</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="-circle-o fa fa-2x fa-file-movie-o fa-fw"></i>Video2 - Title of the video2</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="-circle-o fa fa-2x -movie-o fa-fw fa-file-photo-o"></i>Image1 - Title of the image1</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                            <h1>Lesson2 - Title of lesson2</h1>
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <i class="-circle-o fa fa-2x -movie-o fa-fw fa-file-zip-o"></i>ZipFile - Title of the zipFile</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="-circle-o fa fa-2x -movie-o fa-fw -pdf-o fa-file-text-o"></i>Txt - Title of the txt</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="-circle-o fa fa-2x -movie-o fa-fw -photo-o fa-file-pdf-o"></i>Pdf - Title of the pdf</td>
                            </tr>
                            <tr>
                                <td>
                                    <i class="-circle-o fa fa-2x -movie-o fa-fw -photo-o fa-file-code-o"></i>Code - Title of the code</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>

    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>