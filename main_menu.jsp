<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="save_lives_2021_2022.*" %>



<%

    if (session.getAttribute("userObj") == null ) {
        NeedLogin nlog = new NeedLogin();

        try {
          nlog.needLogin();
        } catch(Exception e) {
          request.setAttribute("message", e.getMessage());
%>
      <jsp:forward page="savelives_welcome.jsp" />  

<%      }
    } 
%>
<% if(request.getAttribute("message") != null) {
  String message = (String)request.getAttribute("message");
  message = new String(message.getBytes("ISO-8859-1"), "UTF-8"); %>	
<br>
<br>
<br>
<div class="alert alert-danger text-center" role="alert"><%=message %></div>
<% } %>





<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="ismgroup48 2021-2022">

    <link rel="icon" href="images/heartlogo.jpg" />
    <title>SAVE LIVES - Κύριο μενού</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>


<%@ include file="navigationMenu.jsp" %>


            <ul class="nav navbar-nav navbar-right">
              <li><a href="trainedUserForm_step1.jsp"><span class="glyphicon glyphicon-user"></span> Εγγραφή Εθελοντή</a></li>
              <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση </a></li>
            </ul>

          </div>
        </div>
      </nav>

    </div>
</div>


<!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">

          <div class="item active">
            <div class="container">
                <div class="carousel-caption">
                  <p><h1>Γνωρίζεις πρώτες βοήθειες; Κάνε εγγραφή ως εθελοντής στην περιοχή σου και βοήθησε να σωθούν ζωές!</h1>
                  <a class="btn btn-lg btn-default" href="trainedUserForm_step1.jsp" role="button">Εγγραφή τώρα</a></p>                  
                </div>
              </div>
            </div>

          <div class="item">
            <img class="second-slide" src="images/seminaria1.jpeg" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>Μάθε Πρώτες βοήθειες</h1>
                <p>Βρες βίντεο και tutorials και μάθε απ'το σπίτι</p>
                <p><a class="btn btn-lg btn-default" href="learn.jsp" role="button">Μάθε Περισσότερα</a></p>
              </div>
            </div>
          </div>
          <div class="item">
            <img class="third-slide" src="images/seminaria2.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>Βρές σεμινάρια και εκδηλώσεις κοντά σου</h1>
                <p><a class="btn btn-lg btn-default" href="learn.jsp" role="button">Δες Περισσότερα</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
    </div>
<!-- /.carousel -->
<!-- emergency button -->
<hr class="featurette-divider">
<div class="container emergency" >

    <div class="col-sm-5">
      <h2 class="featurette-heading">
        <img class="img-circle" src="images/main_emergency.png" alt="Generic placeholder image" width="250px">
      </h2>
    </div>
    <div class="col-sm-7">
      <h2 class="featurette-heading">ΧΡΕΙΑΖΕΣΑΙ ΒΟΗΘΕΙΑ; </h2>
      <p class="lead">Βρίσκεσαι σε κάποιο επείγον περιστατικό; Συμπλήρωσε τα απαραίτητα στοιχεία 
        και διασώστες στην περιοχή σου θα ενημερωθούν άμεσα.</p>
        <a type="button" class="btn btn-danger" href="call_for_help.jsp"><strong>ΧΡΕΙΑΖΟΜΑΙ ΒΟΗΘΕΙΑ!</strong></a>

    </div>
    
</div>
<hr class="featurette-divider">
<!--news-->
<div class="container-fluid text-center" style="background-color: rgba(142, 152, 163, 0.678);">
  <h2>Τα νέα μας</h2><br>
  <h4>Ενημέρωσου για τις τελευταίες δράσεις μας και 
    διάβασε ιστορίες διάσωσης μέσω του Save Lives.
  </h4>
  <div class="row text-center">
    <div class="col-sm-4">
      <div class="thumbnail">
        <p><a href="#">
          <img src="images/news1.png" alt="news" width="300" height="200"></a>
        <p><strong>Σεμινάριο Α' βοηθειών</strong></p>
        Κλείσε θέση στο επόμενο σεμινάριο μας</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <a href="#">
        <img src="images/news2.jpg" alt="news" width="300" height="200"></a>
        <p><strong>Ελληνική Νομοθεσία για τις πρώτες βοήθειες</strong></p>
        <p>Ενημερώσου για τις νέες πιστοποιήσεις στις Α' βοήθειες</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <a href="#">
        <img src="images/news3.png" alt="news" width="300" height="200"></a>
        <p><strong>Ιστορίες περιστατικών</strong></p>
        <p>Διάβασε εμπειρίες των εθελοντών μας</p>
      </div>
    </div>
  </div>
</div>
<hr class="featurette-divider">

<!--icons-->
<div class="container-fluid text-center">
  <h2>ΠΕΡΙΗΓΗΣΟΥ ΚΑΙ ΜΑΘΕ </h2>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-user" style="font-size: xx-large;"></span>
      <h4>ΤΟ ΠΡΟΦΙΛ ΜΟΥ</h4>
      <p>Ενημέρωσε τα στοιχεία σου</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart" style="font-size: xx-large;"></span>
      <h4>ΓΙΝΕ ΕΘΕΛΟΝΤΗΣ</h4>
      <p>Είσαι πιστοποιημένος στις Α'βοήθειες και θέλεις να βοηθήσεις;
         Γίνε μέλος της ομάδας του Save Lives </p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-education" style="font-size: xx-large;"></span>
      <h4>ΠΙΣΤΟΠΟΙΗΣΟΥ ΚΑΙ ΕΣΥ!</h4>
      <p>Μάθε για σεμινάρια και δράσεις κοντά σου</p>
    </div>
  </div>
  <br><br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-flag" style="font-size: xx-large;"></span>
      <h4>AΠΙΝΙΔΩΤΕΣ</h4>
      <p>Δες τον χάρτη απινιδωτών στην Ελλάδα</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-plus" style="font-size: xx-large;"></span>
      <h4>ΜΑΘΕ ΚΑΙ ΕΝΗΜΕΡΩΣΟΥ ΑΠΟ ΤΟ ΣΠΙΤΙ</h4>
      <p>Δες υλικό και μάθε πώς μπορείς να βοηθήσεις 
        σε περιστατικά έκτακτης ανάγκης</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-bullhorn" style="font-size: xx-large;"></span>
      <h4>ΠΕΡΙΣΤΑΤΙΚΑ</h4>
      <p>Δες μετρήσεις και στατιστικά περιστατικών.</p>
    </div>
  </div>
</div>
<hr class="featurette-divider">

<!--contact us-->
<div class="container-fluid" style="background-color: rgba(142, 152, 163, 0.678);">
  <h2 class="text-center">ΕΠΙΚΟΙΝΩΝΙΑ</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Για παραπάνω πληροφορίες είμαστε στην διάθεση σας.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Αθήνα, ΑΤΤΙΚΉ</p>
      <p><span class="glyphicon glyphicon-envelope"></span> savelivesaueb@gmail.com</p>
    </div>
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Όνομα" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Σχόλεια" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>
    <%@ include file="footer.jsp" %>
    


<!-- Bootstrap core JavaScript
    ================================================== -->

    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/carousel.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>