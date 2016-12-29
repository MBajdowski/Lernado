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
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body ng-app="">
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-4" style="height:400px;overflow:scroll;">
                        <div class="row roomPanelBorder">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                     class="img-responsive img-circle">
                            </div>
                            <div class="col-md-8">
                                <a>Computer Science Group 2013</a>
                            </div>
                        </div>
                        <br>
                        <div class="row roomPanelBorder">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                     class="img-responsive img-circle">
                            </div>
                            <div class="col-md-8">
                                <a>Warsaw University of Warsaw Students</a>
                            </div>
                        </div>
                        <br>
                        <div class="row roomPanelBorder">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                     class="img-responsive img-circle">
                            </div>
                            <div class="col-md-8">
                                <a>Computer Graphics Room</a>
                            </div>
                        </div>
                        <br>
                        <div class="row roomPanelBorder">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                     class="img-responsive img-circle">
                            </div>
                            <div class="col-md-8">
                                <a>2016/2017 Biomedical semester 1</a>
                            </div>
                        </div>
                        <br>
                        <div class="row roomPanelBorder">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                     class="img-responsive img-circle">
                            </div>
                            <div class="col-md-8">
                                <a>2016/2017 Telecommunication semester</a>
                            </div>
                        </div>
                        <br>
                        <div class="row roomPanelBorder">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                     class="img-responsive img-circle">
                            </div>
                            <div class="col-md-8">
                                <a>2016/2017 Electronics semester</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <h1>Computer Science Group 2013</h1>
                        <div class="roomBorder">
                            <div class="row">
                                <div class="col-md-9">
                                    <p>Write your post here: &emsp;  <a>Add material<i class="fa fa-paperclip" aria-hidden="true"></i></a></p>
                                    <input type="text" placeholder="Your post...">
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="roomBorder">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                         class="img-responsive img-circle">
                                </div>
                                <div class="col-md-10">
                                    <h3>Tom Hanks</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                                        <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                                        <br>Ut enim ad minim veniam, quis nostrud</p>
                                    <hr>
                                    <a>See more comments</a>
                                    <br>
                                    <i class="fa fa-comment fa-fw fa-lg pull-left"></i>
                                    <input type="text" placeholder="Comment here">
                                </div>
                            </div>
                        </div>

                        <br>

                        <div class="roomBorder">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                         class="img-responsive img-circle">
                                </div>
                                <div class="col-md-10">
                                    <h3>Tom Hanks</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                                        <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                                        <br>Ut enim ad minim veniam, quis nostrud</p>
                                    <hr>
                                    <a>See more comments</a>
                                    <br>
                                    <i class="fa fa-comment fa-fw fa-lg pull-left"></i>
                                    <input type="text" placeholder="Comment here">
                                </div>
                            </div>
                        </div>

                        <br>

                        <div class="roomBorder">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                         class="img-responsive img-circle">
                                </div>
                                <div class="col-md-10">
                                    <h3>Tom Hanks</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                                        <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                                        <br>Ut enim ad minim veniam, quis nostrud</p>
                                    <hr>
                                    <a>See more comments</a>
                                    <br>
                                    <i class="fa fa-comment fa-fw fa-lg pull-left"></i>
                                    <input type="text" placeholder="Comment here">
                                </div>
                            </div>
                        </div>

                        <br>

                        <div class="roomBorder">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="${pageContext.request.contextPath}/images/defaultProfile.jpg"
                                         class="img-responsive img-circle">
                                </div>
                                <div class="col-md-10">
                                    <h3>Tom Hanks</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                                        <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                                        <br>Ut enim ad minim veniam, quis nostrud</p>
                                    <hr>
                                    <a>See more comments</a>
                                    <br>
                                    <i class="fa fa-comment fa-fw fa-lg pull-left"></i>
                                    <input type="text" placeholder="Comment here">
                                </div>
                            </div>
                        </div>
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