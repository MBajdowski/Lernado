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
<body ng-app=""
      ng-init="creator=(${currentCourse.getCreator().getIduser()}==<sec:authentication property="principal.Id"/>)">
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <img src="${currentPhoto}" class="img-responsive logo">
                        <div class="pull-right">
                            <form ng-show="creator" method="POST" enctype="multipart/form-data"
                                  action="${pageContext.request.contextPath}/course/${currentCourse.idcourse}/updatePhoto">
                                <label  for="photobinary" class="btn">Update photo<i class="fa fa-2x fa-picture-o fa-fw"></i></label>
                                <input type="file" id="photobinary" name="photoBinary" onchange="this.form.submit();" style="display: none">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-center">${currentCourse.getTitle()}
                            <a ng-show="creator" data-toggle="modal" data-target="#myDetailsModal"><i class="fa fa-1x fa-edit fa-fw"></i></a></h1>
                        <p class="text-center">${currentCourse.getDescription()}</p>
                    </div>
                </div>
            </div>

            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
            <div class="row">
                <div class="col-md-9">

                    <div class="row">
                        <div class="col-md-10">
                            <h3>Level: ${currentCourse.getLevel()}</h3>
                            <h3>Category: ${currentCourse.getCategory()}</h3>
                        </div>
                        <div class="col-md-2">
                            Go to chat-room
                            <a href="${pageContext.request.contextPath}/course/${currentCourse.idcourse}/chatRoom"><i class='fa fa-3x fa-fw fa-envelope-o'></i></a>
                        </div>
                    </div>
                    <br>
                    <c:choose>
                        <c:when test="${currentCourse.getLessons().size() > 0}">
                            <c:forEach var="i" begin="0" end="${currentCourse.getLessons().size()-1}">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="col-md-1">
                                            <a ng-show="creator" href="${pageContext.request.contextPath}/course/${currentCourse.idcourse}/${currentCourse.getLessons().get(i).idlesson/deleteLesson}">
                                                 <i class="fa fa-3x fa-fw fa-trash-o pull-right "></i></a>
                                        </div>
                                        <div class="col-md-10">
                                            <h1>Lesson ${currentCourse.getLessons().get(i).getNumber()}
                                                - ${currentCourse.getLessons().get(i).getTitle()}</h1>
                                        </div>
                                        <div class="col-md-1">
                                            <a ng-show="creator" href="#"><i class="fa fa-3x fa-edit fa-fw"></i></a>
                                        </div>
                                        <table class="table">
                                            <tbody>

                                            <c:choose>
                                                <c:when test="${currentCourse.getLessons().get(i).getMaterials().size() >= 1}">
                                                    <c:forEach var="j" begin="0"
                                                               end="${currentCourse.getLessons().get(i).getMaterials().size()-1}">
                                                        <tr>
                                                            <td>
                                                                <i class="-circle-o fa fa-2x fa-file-movie-o fa-fw"></i>
                                                                <a href="${currentCourse.getLessons().get(i).getMaterials().get(j).path}">
                                                                        ${currentCourse.getLessons().get(i).getMaterials().get(j).title} </a>
                                                            </td>
                                                            <td>
                                                                <a href="${pageContext.request.contextPath}/course/${currentCourse.getLessons().get(i).idlesson}/${currentCourse.getLessons().get(i).getMaterials().get(j).idmaterial}/removeMaterial">
                                                                    <i ng-show="creator"
                                                                       class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>

                                            </tbody>
                                        </table>
                                        <div class="col-md-12">
                                            <a ng-show="creator" data-toggle="modal" data-target="#myModal${i}"
                                               onclick=""><h3 class="text-right">Add new material<i
                                                    class="fa fa-1x fa-file fa-fw pull-right"></i></h3></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-1">
                                <a href="#"><i class="fa fa-3x fa-fw fa-trash-o pull-right"></i></a>
                            </div>
                            <div class="col-md-10">
                                <h1>Example lesson to remember icons</h1>
                            </div>
                            <div class="col-md-1">
                                <a href="#"><i class="fa fa-3x fa-edit fa-fw"></i></a>
                            </div>
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw fa-file-zip-o"></i>ZipFile - Title
                                        of the zipFile
                                    </td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw -pdf-o fa-file-text-o"></i>Txt -
                                        Title of the txt
                                    </td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw -photo-o fa-file-pdf-o"></i>Pdf -
                                        Title of the pdf
                                    </td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="-circle-o fa fa-2x -movie-o fa-fw -photo-o fa-file-code-o"></i>Code -
                                        Title of the code
                                    </td>
                                    <td>
                                        <i class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="col-md-12">
                                <a data-toggle="modal" data-target="#myModal"><h3 class="text-right">Add new material<i
                                        class="fa fa-1x fa-file fa-fw pull-right"></i></h3></a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <a ng-show="creator"
                               href="${pageContext.request.contextPath}/course/${currentCourse.getIdcourse()}/addLesson">
                                <h2><i class="fa fa-1x fa-fw fa-university pull-left"></i>New Lesson</h2></a>
                        </div>
                    </div>
                </div>
            </div>

    </div>
</div>

<div class="modal fade" id="myDetailsModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="${pageContext.request.contextPath}/course/${currentCourse.idcourse}/updateDetails">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title">Update course's details</h3>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Title</label>
                        </div>
                        <div class="col-sm-10">
                            <input name="title" type="text" class="form-control" value="${currentCourse.title}" required>
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Description</label>
                        </div>
                        <div class="col-sm-10">
                            <input name="description" type="text" class="form-control" value="${currentCourse.description}" required>
                        </div>
                    </div>
                    <hr>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button class='btn btn-primary' type="submit"/>Update</button>
                </div>
            </form>
        </div>
    </div>
</div>


<c:choose>
    <c:when test="${currentCourse.getLessons().size() > 0}">
        <c:forEach var="i" begin="0" end="${currentCourse.getLessons().size()-1}">
            <div class="modal fade" id="myModal${i}" role="dialog">
                <div class="modal-dialog">

                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3 class="modal-title">Add material's data</h3>
                        </div>
                        <div class="modal-body">
                            <form method="POST" enctype="multipart/form-data"
                                  action="${pageContext.request.contextPath}/upload">
                                <input name="idlesson" type="hidden"
                                       value="${currentCourse.getLessons().get(i).idlesson}">
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Title</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input name="title" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Description</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input name="description" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="control-label">Material to upload</label>
                                    </div>
                                    <div class="col-sm-10">
                                        <input type="file" name="file"/>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group text-right">
                                    <button class='btn btn-primary' type="submit"/>
                                    Upload</button>
                                </div>
                            </form>
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
                                                            <a href='${pageContext.request.contextPath}/course/${currentCourse.getLessons().get(i).idlesson}/${userMaterials.get(j).idmaterial}/addExistingMaterial'>
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
        </c:forEach>
    </c:when>
</c:choose>

<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>