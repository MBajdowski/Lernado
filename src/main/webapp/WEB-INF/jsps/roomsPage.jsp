<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                    <div class="col-md-3" style="height:500px;overflow:scroll;">
                        <ul class="list-group">
                            <li class="list-group-item">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                            <li class="list-group-item">Morbi leo risus</li>
                            <li class="list-group-item">Porta ac consectetur ac</li>
                            <li class="list-group-item">Vestibulum at eros</li>
                            <li class="list-group-item">Cras justo odio</li>
                            <li class="list-group-item">Dapibus ac facilisis in</li>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <div style="background-color: white; border: solid grey">
                            <div class="row">
                                <div class="col-md-9">
                                    <p>Write your post here:</p>
                                <input type="text" placeholder="Your post...">
                                    </div>
                                </div>
                            </div>
                        <br>


                        <div style="background-color: white; border: solid grey">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="images/defaultProfile.jpg"
                                         class="img-responsive img-circle">
                                </div>
                                <div class="col-md-10">
                                    <h1>Tom Hanks</h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                                        <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                                        <br>Ut enim ad minim veniam, quis nostrud</p>Comment
                                    <i class="fa fa-comment fa-fw fa-lg pull-left"></i>
                                    <input type="text" placeholder="Comment here">
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div style="background-color: white; border: solid grey">
                            <div class="row">
                                <div class="col-md-2">
                                    <img src="images/defaultProfile.jpg"
                                         class="img-responsive img-circle" >
                                </div>
                                <div class="col-md-10">
                                    <h1>John Smith</h1>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                                        <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                                        <br>Ut enim ad minim veniam, quis nostrud</p>Comment
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