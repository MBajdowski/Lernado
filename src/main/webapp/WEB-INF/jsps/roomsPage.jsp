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
                                    <p>Write your post here: &emsp;  <label for="roomFile">Add new material<i class="fa fa-paperclip" aria-hidden="true"></i></label>
                                        <input id="roomFile" name="file" type="file" style="display: none">
                                        <a data-toggle="modal" data-target="#myModal" >Add existing material<i class="fa fa-paperclip" aria-hidden="true"></i></a>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title">Add file</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <c:choose>
                            <c:when test="${userMaterials.size()>= 1}">
                                <h4>Add material from your previously uploaded: </h4>
                                <div class="highlightedCarousel">
                                    <div id="owl-demo" class="owl-carousel owl-theme">
                                        <c:forEach var="j" begin="0" end="${userMaterials.size()-1}">
                                            <div class='item'>
                                                <i class="-circle-o fa fa-2x -movie-o fa-fw -photo-o fa-file-pdf-o"></i>
                                                <h3>${userMaterials.get(j).title}</h3>
                                                <a href='${pageContext.request.contextPath}/room/${currentRoom.idroom}/${userMaterials.get(j).idmaterial}/addExistingMaterial'>
                                                    <button class='btn btn-primary'>Add material</button>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>

</html>