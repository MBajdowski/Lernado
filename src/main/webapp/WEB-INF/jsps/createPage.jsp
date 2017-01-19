<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/defaultStyles.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
</head>
<body ng-app="">
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <h1>New Course/Room Creation:</h1>
                    </div>
                </div>
                <form class="form-horizontal" role="form" method="POST" action="${pageContext.request.contextPath}/createCourseRoom" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Title</label>
                        </div>
                        <div class="col-sm-10">
                            <input name="title" type="text" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Description</label>
                        </div>
                        <div class="col-sm-10">
                            <input name="description" type="text" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Visibility</label>
                        </div>
                        <div class="col-sm-10">
                            <input type="radio" name="isPrivate" value="true">Private
                            <input type="radio" name="isPrivate" value="false" ng-checked="true">Public
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Picture</label>
                        </div>
                        <div class="col-sm-10">
                            <input type="file" name="photo">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Type</label>
                        </div>
                        <div class="col-sm-10">
                            <input type="radio" name="type" value="course" ng-model="myVar">Course
                            <br>
                            <input type="radio" name="type" value="room" ng-checked="true" ng-model="myVar">Room
                            <br>
                        </div>
                    </div>
                    <div ng-hide="!(myVar=='course')">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Category</label>
                        </div>
                        <div class="col-sm-10">
                            <select name="category">
                                <option value="Programming">Programming</option>
                                <option value="Economics">Economics</option>
                                <option value="Computer Networks">Computer Networks</option>
                                <option value="Telecommunication">Telecommunication</option>
                                <option value="Design">Design</option>
                                <option value="Data Bases">Data Bases</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Level</label>
                        </div>
                        <div class="col-sm-10">
                            <select name="level">
                                <option value="easy">Easy</option>
                                <option value="medium">Medium</option>
                                <option value="hard">Hard</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Syllabus</label>
                        </div>
                        <div class="col-sm-10">
                            <input name="syllabus" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label class="control-label">Price</label>
                        </div>
                        <div class="col-sm-10">
                            <input name="price" type="number" step="0.01" class="form-control" value="0.00" required>
                        </div>
                    </div>
                    </div>
                    <input name="creatorId" type="hidden" value="<sec:authentication
                                property="principal.id"/>">
                    <div class="row">
                        <div class="col-md-11 text-right">
                            <button type="submit" class="btn btn-primary">Create</button>
                        </div>
                    </div>
                </form>
            </div>
            <jsp:include page="common/leftPanel.jsp"></jsp:include>
        </div>
    </div>
    <div class="fillScreen"></div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
</body>

</html>