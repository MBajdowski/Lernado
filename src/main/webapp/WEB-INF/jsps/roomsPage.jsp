<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <div class="col-md-12">
                        <img src="${currentRoomPhoto}" class="img-responsive logo">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10 text-center">
                        <h1>${currentRoom.getTitle()}</h1>
                        <br>
                        <h3>${currentRoom.getDescription()}</h3>
                        <hr>
                        </div>
                    </div>
                </div>

            <jsp:include page="common/leftPanel.jsp"></jsp:include>

            <div class="row">
                <div class="col-md-9">
                        <div class="roomBorder">
                            <div class="row">
                                <form method="POST" enctype="multipart/form-data"
                                      action="${pageContext.request.contextPath}/room/upload">
                                <div class="col-md-9 margin10">
                                    <p>Write your post here: &emsp;  <a>Add material<i class="fa fa-paperclip" aria-hidden="true"></i></a>
                                        <input name="file" type="file">
                                    </p>
                                    <input name="description" type="text" placeholder="Your post...">
                                    <input name="title" type="text" ng-show="false" value="material${users.get(i).getKey().getMaterials().getSize()+1}">
                                    <input name="idlesson" type="hidden" value="${currentRoom.idroom}">
                                    <button class='btn btn-primary' type="submit"/>Send</button>
                                </div>
                                </form>
                            </div>
                        </div>
                        <br>
                        <br>
                        <c:choose>
                            <c:when test="${materials.size()>=1}">
                                <c:forEach var="i" begin="0" end="${materials.size()-1}">
                                <div class="row">
                                    <div class="col-md-10 roomBorder">
                                        <div class="row">
                                            <div class="col-md-1 margin10">
                                                <img src="${materials.get(i).getValue()}"
                                                     class="img-responsive img-circle">
                                            </div>
                                            <div class="col-md-10 margin10">
                                                <h3>${materials.get(i).getKey().getCreator().firstName} ${materials.get(i).getKey().getCreator().lastName}</h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 margin10">
                                                <p>${materials.get(i).getKey().description}</p>
                                                <hr><a href="${materials.get(i).getKey().path}">
                                                <i class="-circle-o fa fa-2x fa-file-movie-o fa-fw"></i></a>
                                                <a href="${materials.get(i).getKey().path}">
                                                        ${materials.get(i).getKey().path}</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <br>
                                </c:forEach>
                            </c:when>
                        </c:choose>

                        <br>

                        <div class="col-md-10 roomBorder">
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
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>

</html>