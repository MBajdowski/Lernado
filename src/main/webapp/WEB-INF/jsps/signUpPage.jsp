<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/defaultStyles.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/SignUp.js"></script>
</head>
<body>
<div class="cover" id="home">
    <div class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-ex-collapse">
                <ul class="nav navbar-nav navbar-right menuitems">
                    <li class="active">
                        <a href="/">Home</a>
                    </li>
                    <li>
                        <a href="#AboutUsSection">About Us</a>
                    </li>
                    <li>
                        <a href="#contact">Contact</a>
                    </li>
                    <li>
                        <a href="/">Log in</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="cover-image" style="background-image : url('${pageContext.request.contextPath}/images/wood-texture.jpg')"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="col-md-11 text-center">
                    <h1 class="mainheader">
                        <a href="#" class="logo"><i class="fa fa-graduation-cap text-muted text-info"></i></a>Lernado</h1>
                    <p>Best e-learning portal EVER!</p>
                </div>
                <form:form class="form-horizontal text-right" role="form" action="/user/create" method="POST" commandName="previousUser" onsubmit="return validateForm()">
                    <div class="form-group">
                        <div class="col-sm-3">
                            <label for="firstName" class="control-label">First name</label>
                        </div>
                        <div class="col-sm-8">
                            <form:input type="text" class="form-control input-sm" id="firstName" name="firstName" placeholder="First name"
                                   required="" style="max-width: 550px" path="firstName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3">
                            <label for="lastName" class="control-label">Last name</label>
                        </div>
                        <div class="col-sm-8">
                            <form:input type="text" class="form-control input-sm" id="lastName" name="lastName" placeholder="Last name"
                                   required="" style="max-width: 550px" path="lastName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3">
                            <label for="email" class="control-label">Email</label>
                        </div>
                        <div class="col-sm-8">
                            <c:if test="${emailInUse==true}"><div class="errorMessage">This email is already in use :(</div></c:if>
                            <form:input type="email" class="form-control" id="email" name="email" placeholder="Email"
                                   required="" style="max-width: 550px" path="email"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3">
                            <label for="password" class="control-label">Password</label>
                        </div>
                        <div class="col-sm-8">
                            <input type="password" class="form-control input-sm" id="password" name="password"
                                   placeholder="Password" required="" style="max-width: 550px">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3">
                            <label for="password2" class="control-label">Repeat password</label>
                        </div>
                        <div class="col-sm-8">
                            <input type="password" class="form-control input-sm" id="password2" name="password2"
                                   placeholder="Repeat password" required="" onkeyup="checkPass(); return false;"
                                   style="max-width: 550px">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox left" style="float:left">
                                <label class="checkbox">
                                    <input type="checkbox" required="">I have read and agree to the Terms and Conditions and Privacy Policy.</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-5">
                            <button id="submitButton" type="submit" class="btn btn-default btn-md">Sign Up</button>
                            <button type="reset" class="btn btn-default btn-md">Clear form</button>
                        </div>
                    </div>
                </form:form>
                <br>
                <br>
            </div>
        </div>
    </div>
</div>
<div class="section" id="AboutUsSection">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>About Us</h1>
                <p>We are a well-known e-learning based platform working all over the world
                    to help you develop your hobbies and passions. Just with few steps by loging
                    in you have an access to almost unlimited number of courses from different
                    categories and on different levels. Doesn't matter if you are new here
                    or looking for something proffesional-we have everything you need! Join
                    us and enjoy the work with the best teachers from entire globe without
                    leaving your room.&nbsp;
                    <br>
                </p>
            </div>
            <div class="col-md-6">
                <img src="http://api.ning.com/files/vZBStZ816j2JHx2uH-kfnBkra830sYFE0uFYvBZDeQzrVqJVfOxghUAUXUo9MK2WPKU8-0OvITo8Uz76NsssFIcBi*-3wq7E/elearning.jpg"
                     class="img-responsive">
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h1>How do we work?</h1>
                <p>We assosiate a group of teachers from different field of studies, who
                    start their courses at our portal. When you have an account you can search
                    for the course you are interested in and enroll. When the teacher accepts
                    you, you have an access to all the lessons and materials that are uploaded
                    for the course. While finishing the courses you gains more and more achievements
                    that you can see on your private profile.
                    <br>You can access to the portal from every point in the world: you &nbsp;can
                    be on vacations, in the train or just realxing in your home. The portal
                    is supported on every divice such as tablets, telephones or laptops. So
                    what are you waiting for? Sign up today and start learning with Lernado!</p>
            </div>
            <div class="col-md-6">
                <img src="http://www-static.se-mc.com/blogs.dir/0/files/2015/01/xperia-z4-tablet-get-it-all-done-video-overlay-e6bf561b637c1e7ba0d9f3568ef5a0af-940.jpg"
                     class="img-responsive">
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section" id="contact">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="http://www.gouspa.org/wp-content/uploads/2014/02/shutterstock_158327579-2.jpg"
                                     class="img-responsive">
                                <h2>Contact</h2>
                                <p>You can conntact us either by email or by phone. In case of any questions
                                    or problems, do not hesitate to write the message or give a call.
                                    <br>Our email: lernado@gmail.com
                                    <br>Our telephone number: +34 555 555 555
                                    <br>
                                    <br>
                                </p>
                            </div>
                            <div class="col-md-4">
                                <img src="http://cdn.interkursy.pl/templates/ik/images/front/2/left.jpg"
                                     class="img-responsive">
                                <h2>Our Courses</h2>
                                <p>Our courses as so various as people using our portal. They differ in categories
                                    and level of instrudtion. You can find here every course you would like
                                    to learn.</p>
                            </div>
                            <div class="col-md-4">
                                <img src="http://www.creativecertificates.com/wp-content/uploads/2014/03/certificate-of-achievement-template.jpg"
                                     class="img-responsive">
                                <h2>Certificates</h2>
                                <p contenteditable="true">All of courses run on our website &nbsp;are prepared by proffesional teachers,
                                    who have to provide the certificate of their skills and privilages. Before
                                    leting the course to be active, all of the certificates and verified and
                                    their reliability is confirmed.</p>
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