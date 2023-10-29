<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="description" content="registration_form">
    <meta name="author" content="ismgroup48 2021-2022">

    <link rel="icon" href="images/heartlogo.jpg" />
    <title>Εγγραφή</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="css/colors.css" rel="stylesheet">
    <link href="css/navigationbar.css" rel="stylesheet">
    <link href="css/background.css" rel="stylesheet">

    <style>
        #container1 {
            display:flex;
            flex-direction:row;
            justify-content:center;
            align-items:center;
        }
        .form-control{
            border:none;
            border-bottom:3px solid rgb(207, 0, 0);
            background:white
            color:white;
            border-radius:0px;
        }
        #row1 {
            width:60%;
            margin-top:100px;
            border: 3px solid red;
            border-radius:14px;
            height:auto;
        }
    </style>
</head>

<body>

<%@ include file="navigationMenu.jsp" %>

            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="registration_form.jsp"><span class="glyphicon glyphicon-user"></span> Εγγραφή</a></li>
            </ul>
        </div>
        </div>
    </nav>
    </div>
</div>


<div id="container1">

    <div class="row" id="row1">
    <form action="registration_controller.jsp" method="POST" class="col-xs-12 col-sm-12 col-md-12">
        <h2>ΕΓΓΡΑΦΗ ΣΤΟ SAVE LIVES</h2>
        <h4>Γίνε κι εσύ μέλος της ομάδας μας και βοήθησε να σωθούν ζωές!</h4>
        <hr>
        <div class="form-group">
            <div class="input-group col-md-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input type="text" class="form-control" id="name" placeholder="Συμπληρώστε το όνομα σας *" name="name" required>
            </div>
        </div>
            
        <div class="form-group">
            <div class="input-group col-md-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input type="text" class="form-control" id="surname" placeholder="Συμπληρώστε το επώνυμο σας *" name="surname" required>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group col-md-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                <input type="email" class="form-control" id="email" placeholder="Συμπληρώστε το email σας *" name="email" required>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group col-md-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input type="text" class="form-control" id="username" placeholder="Συμπληρώστε το όνομα χρήστη *" name="username" required>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group col-md-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input type="password" class="form-control" id="pwd" placeholder="Συμπληρώστε τον κωδικό πρόσβασης *" name="password" required>
            </div>
        </div>

        <div class="form-group">
            <div class="input-group col-md-12">
                <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
                <input type="password" class="form-control" id="pwd" placeholder="Επαναλάβετε τον κωδικό πρόσβασης *" name="Rptpassword" required>
            </div>
        </div>

        <div class="checkbox">
            <label><input type="checkbox" name="terms"> <span> *Συμφωνώ με τους όρους και τις προϋποθέσεις χρήσης.</span></label>
        </div>
            <button type="submit" class="btn btn-success">Υποβολή <i class="glyphicon glyphicon-send"></i></button>
    </form>
    </div>
</div>
<br>
<br>
        <%@ include file="footer.jsp" %>


    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>