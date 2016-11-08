<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrapFiles/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/errorPage.css" rel="stylesheet" type="text/css">

</head><body>
<div class="cover">
    <div class="cover-image" style="background-image : url('http://www.discovertextures.com/wp-content/uploads/2015/11/wood-texture0020-e1447163908131-1024x765.jpg')"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1 class="h1color">
                    <b>Ups!
                        <i class="fa fa-fw fa-lg fa-user-md"></i>
                        <br>An error <c:out value="${errorStatus}"></c:out> has occurred!</b>
                </h1>
                <p class="text-inverse">If you keep seeing this message, please contact the administrator</p>
                <br>
                <br>
            </div>
        </div>

    </div>
</div>


</body></html>