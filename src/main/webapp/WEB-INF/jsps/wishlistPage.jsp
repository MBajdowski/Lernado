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
    <link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/owl.theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/carouselHighlited.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
    <script src="${pageContext.request.contextPath}/js/carouselHighlited.js"></script>
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<div class="section tlo">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <h1> Your Wishlist:</h1>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                         class="img-responsive">
                                    <div class="caption">
                                        <h3>Basic Programming</h3>
                                        <p>Price: 20 $
                                            <br>
                                            <br>Category: Programming
                                            <br>Level: Easy</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                         class="img-responsive">
                                    <div class="caption">
                                        <h3>Basic Programming</h3>
                                        <p>Price: 20 $
                                            <br>
                                            <br>Category: Programming
                                            <br>Level: Easy</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                         class="img-responsive">
                                    <div class="caption">
                                        <h3>Basic Programming</h3>
                                        <p>Price: 20 $
                                            <br>
                                            <br>Category: Programming
                                            <br>Level: Easy</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="thumbnail">
                                    <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                         class="img-responsive">
                                    <div class="caption">
                                        <h3>Basic Programming</h3>
                                        <p>Price: 20 $
                                            <br>
                                            <br>Category: Programming
                                            <br>Level: Easy</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                 class="img-responsive">
                            <div class="caption">
                                <h3>Basic Programming</h3>
                                <p>Price: 20 $
                                    <br>
                                    <br>Category: Programming
                                    <br>Level: Easy</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                 class="img-responsive">
                            <div class="caption">
                                <h3>Basic Programming</h3>
                                <p>Price: 20 $
                                    <br>
                                    <br>Category: Programming
                                    <br>Level: Easy</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                 class="img-responsive">
                            <div class="caption">
                                <h3>Basic Programming</h3>
                                <p>Price: 20 $
                                    <br>
                                    <br>Category: Programming
                                    <br>Level: Easy</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumbnail">
                            <img src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
                                 class="img-responsive">
                            <div class="caption">
                                <h3>Basic Programming</h3>
                                <p>Price: 20 $
                                    <br>
                                    <br>Category: Programming
                                    <br>Level: Easy</p>
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