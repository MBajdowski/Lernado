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
<body ng-app="" ng-init="creator=(${currentCourse.getCreator().getIduser()}==<sec:authentication property="principal.Id"/>)">
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <img src="${currentPhoto}" class="img-responsive logo">
                    </div>
                </div>
                <h1 class="text-center">${currentCourse.getTitle()}</h1>
                <p class="text-center">${currentCourse.getDescription()}</p>
            </div>

            <jsp:include page="common/leftPanel.jsp"></jsp:include>
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
                                            <a ng-show="creator" href="#"><i class="fa fa-3x fa-fw fa-trash-o pull-right "></i></a>
                                        </div>
                                        <div class="col-md-10">
                                            <h1>Lesson ${currentCourse.getLessons().get(i).getNumber()} - ${currentCourse.getLessons().get(i).getTitle()}</h1>
                                        </div>
                                        <div class="col-md-1">
                                            <a ng-show="creator" href="#"><i class="fa fa-3x fa-edit fa-fw"></i></a>
                                        </div>
                                        <table class="table">
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <i class="-circle-o fa fa-2x fa-file-movie-o fa-fw"></i>Video1 -
                                                    Title of the video1
                                                </td>
                                                <td>
                                                    <i ng-show="creator" class="-circle-o fa fa-2x fa-close fa-fw pull-right"></i>
                                                </td>
                                            </tr>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="col-md-12">
                                            <a ng-show="creator" href="#"><h3 class="text-right">Add new material<i
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
                                <a href="#"><h3 class="text-right">Add new material<i
                                        class="fa fa-1x fa-file fa-fw pull-right"></i></h3></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <a ng-show="creator" href="${pageContext.request.contextPath}/course/${currentCourse.getIdcourse()}/addLesson"><h2><i class="fa fa-1x fa-fw fa-university pull-left"></i>New Lesson</h2></a>
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