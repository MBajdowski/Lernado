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
                    <div class="col-md-12">
                        <img src="images/courseDefault.jpg" class="img-responsive logo">
                    </div>
                </div>
                <h1 class="text-center">Titile</h1>
                <p class="text-center">Description</p>
                </div>

            <jsp:include page="common/leftPanel.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-9">

                <div class="row">
                    <div class="col-md-10">
                <h3>Level: Medium</h3>
                <h3>Category: Programming</h3>
                        </div>
                        <div class="col-md-2">
                        Go to chat-room <form id="myForm2" class="form-horizontal" role="form" method="POST" action="doChat"><a onclick="chat()"><i class='fa fa-3x fa-fw fa-envelope-o'></i></a></form>
                    </div>
                </div>
                <br><br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-1">
                                <a href="#"><i class="fa fa-3x fa-fw fa-trash-o pull-right"></i></a>
                            </div>
                            <div class="col-md-10">
                                <h1>Lesson1 - Title of lesson1</h1>
                            </div>
                            <div class="col-md-1">
                                <a href="#"><i class="fa fa-3x fa-edit fa-fw"></i></a>
                            </div>
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-file-movie-o fa-fw"></i>Video1 - Title of the video1</td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-file-movie-o fa-fw"></i>Video2 - Title of the video2</td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw fa-file-photo-o"></i>Image1 - Title of the image1</td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="col-md-12">
                                <a href="#"><h3 class="text-right">Add new material<i class="fa fa-1x fa-file fa-fw pull-right"></i></h3></a>
                            </div>
                        </div>
                    </div>
                <br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-1">
                                <a href="#"><i class="fa fa-3x fa-fw fa-trash-o pull-right"></i></a>
                            </div>
                            <div class="col-md-10">
                                <h1>Lesson2 - Title of lesson2</h1>
                            </div>
                            <div class="col-md-1">
                                <a href="#"><i class="fa fa-3x fa-edit fa-fw"></i></a>
                            </div>
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw fa-file-zip-o"></i>ZipFile - Title of the zipFile</td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw -pdf-o fa-file-text-o"></i>Txt - Title of the txt</td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw -photo-o fa-file-pdf-o"></i>Pdf - Title of the pdf</td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw -photo-o fa-file-code-o"></i>Code - Title of the code</td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="col-md-12">
                                <a href="#"><h3 class="text-right">Add new material<i class="fa fa-1x fa-file fa-fw pull-right"></i></h3></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a href="#"><h2><i class="fa fa-1x fa-fw fa-university pull-left"></i>New Lesson</h2></a>
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