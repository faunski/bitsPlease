<%-- 
    Document   : userDash
    Created on : Feb 26, 2017, 5:14:20 PM
    Author     : Jere
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Project Bits | About</title>

        <meta charset="utf-8" />
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <script src="vendor/jquery/jquery.js"></script>

        <!-- Theme JavaScript -->
        <script src="js/grayscale.min.js"></script>

        <link rel="stylesheet"
              href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Dosis' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Aldrich' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <script src="javascript/script.js"></script>
        <!-- Theme CSS -->
        <link href="css/grayscale.min.css" rel="stylesheet">


        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    </head>
    <body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">


        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="index.jsp">
                    <i class="fa fa-terminal"></i> <span class="light">Bits</span> Please
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-center navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <c:if test="${empty loggedInUser}">
                        <li><a href='signup.jsp'>Sign Up</a></li>
                        </c:if>
                    <li><a href='dashboard.jsp'>Dashboard</a></li>
                    <li><a href='userDash.jsp'>User dashboard</a></li>
                    <li><a href='messages.jsp'>Messages</a></li>
                </ul>
                <c:if test="${not empty loggedInUser}">
                    <form class='navbar-form navbar-right' method='post' action='login' >
                        <p id='loggedIn'>Welcome ${loggedInUser}</p>
                        <input class='form-control btn btn-info note-input' type='submit' value='Log Out' name='submit'>
                    </form>
                </c:if>
                <c:if test="${empty loggedInUser}">
                    <form class='navbar-form navbar-right' style='padding-right: 2em;' method='post' action='login' >
                        <div class='form-group'>
                            <input class='form-control note-input' placeholder='Email' type='email' name='email' />
                        </div>
                        <div class='form-group'>
                            <input class='form-control note-input' placeholder='Password' type='password' name='pass' />
                        </div>
                        <input class='form-control btn btn-info note-input' type='submit' value='Log In' name='submit'>
                    </form>
                </c:if>
            </div>
            <!-- /.navbar-collapse -->
            <!-- /.container -->
        </nav>

         <div class='container' id='main'>
                <h1 class="page-header">Edit Profile</h1>
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="text-center">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/d/d2/Donald_Trump_August_19,_2015_(cropped).jpg" style="width:50%;height:50%;" class="avatar img-circle img-thumbnail" alt="avatar">
                            <h6>Upload a different photo...</h6>
                            <input type="file" class="text-center center-block well well-sm">
                        </div>
                    </div>
                    <!-- edit form column -->
                    <div class="col-md-8 col-sm-6 col-xs-12 personal-info" style="padding-right: 2em;">
                        <div class="alert alert-info alert-dismissable">
                            <a class="panel-close close" data-dismiss="alert">×</a> 
                            <i class="fa fa-coffee"></i>
                            This is an <strong>.alert</strong>. Use this to show important messages to the user.
                        </div>
                        <h3>Personal info</h3>
                        <form class="form-horizontal center-block" role="form">
                            <div class="form-group">
                                <label class="col-lg-3 control-label">First name:</label>
                                <div class="col-lg-8">
                                    <input class="form-control" value="Donald" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Last name:</label>
                                <div class="col-lg-8">
                                    <input class="form-control" value="Trump" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Position:</label>
                                <div class="col-lg-8">
                                    <input class="form-control" value="Presirdent" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Email:</label>
                                <div class="col-lg-8">
                                    <input class="form-control" value="trumpsta69@gov.com" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" value="11111122333" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Confirm password:</label>
                                <div class="col-md-8">
                                    <input class="form-control" value="11111122333" type="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-8">
                                    <input class="btn btn-primary" value="Save Changes" type="button">
                                    <span></span>
                                    <input class="btn btn-default" value="Cancel" type="reset">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>




        </div>








    </body>
</html>