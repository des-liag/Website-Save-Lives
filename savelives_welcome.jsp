<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if (session.getAttribute("userObj") != null ) {
%>
  <jsp:forward page="main_menu.jsp" />  
<% 
  }
%> 

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
    <title>SAVE LIVES</title>
    
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
</body>


<%@ include file="navigationMenu.jsp" %>


            <ul class="nav navbar-nav navbar-right">
                <li>
                    <div class="dropdown show">
                        <a class="btn btn-secondary btn-lg" href="registration_form.jsp" role="button" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-user"></span> Εγγραφή</a>
                <li>
                    <div class="dropdown show">
                        <a class="btn btn-secondary btn-lg" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="glyphicon glyphicon-log-in"></span> Σύνδεση
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

                            <form name="form" action="login_controller.jsp" method="POST" class="px-4 py-3" id="form">
                                <div class="form-group">
                                    <label for="exampleDropdownFormEmail1">Όνομα χρήστη</label>
                                    <input type="name" name="username" class="form-control" id="exampleDropdownFormEmail1" placeholder="Όνομα χρήστη">
                                </div>
                                <div class="form-group">
                                    <label for="exampleDropdownFormPassword1">Κωδικός πρόσβασης</label>
                                    <input type="password" name="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Κωδικός πρόσβασης">
                                </div>
                                <div class="text-center">
                                  <button type="submit" class="btn btn-default">Σύνδεση</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </li>

            </ul>
          </div>
        </div>
      </nav>

    </div>
</div>

<% if(request.getAttribute("message") != null) {
      String message = (String)request.getAttribute("message");
      message = new String(message.getBytes("ISO-8859-1"), "UTF-8"); %>	
  <br>
  <br>
  <br>
  <div class="alert alert-danger text-center" role="alert"><%=message %></div>
<% } %>


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
                <p><h1>Γίνε κι εσύ μέλος της κοινότητας μας, για να ενημερωθείς, να μάθεις και να βοηθήσεις!</h1>
                <a class="btn btn-lg btn-default" href="registration_form.jsp" role="button">Εγγραφή τώρα</a></p>
                <p>Είσαι ήδη μέλος; Συνδέσου τώρα!</p>
                
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
                <h1>Βρες σεμινάρια και εκδηλώσεις κοντά σου</h1>
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
<div class="container emergency">

    

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">ΖΗΤΑ ΒΟΗΘΕΙΑ <span class="text-muted">ΑΜΕΣΑ</span></h2>
          <p class="lead">Βρίσκεσαι σε κάποιο επείγον περιστατικό όπου κάποιος άνθρωπος χρειάζεται βοήθεια; (τροχαίο, καρδιακή ανακοπή κ.α); 
          Ζήτα βοήθεια και κάποιος από τους εκπαιδευμένους συνανθρώπους σου στην κοντινή περιοχή θα ανταποκριθεί άμεσα.</p>
        </div>
        <div class="col-md-5">
          <h2 class="featurette-heading">
          <a type="button" class="btn btn-xl btn-outline-danger" href="call_for_help.jsp"><strong>ΧΡΕΙΑΖΟΜΑΙ ΒΟΗΘΕΙΑ!</strong><p>(Πάτα εδώ)</p></a>
          </h2>
        </div>
      </div>

    <hr class="featurette-divider">

    <div class="row">
        <div class="col-lg-6">
          <img class="img-circle" src="images/aedphoto.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>Απινιδωτές</h2>
          <p>Μάθε για την χρήση των απινιδωτών καθώς και πού μπορείς να τους βρεις σε όλη την Ελλάδα<p>
          <p><a class="btn btn-default" href="aed_page.jsp" role="button">Μάθε Περισσότερα &raquo;</a></p>
        </div>
        <div class="col-lg-6">
          <img class="img-circle" src="images/volunteerphoto.png" alt="Generic placeholder image" width="140" height="140">
          <h2>Θέλεις να βρεις τρόπους να βοηθήσεις;</h2>
          <p>Κάνε εγγραφή στην εφαρμογή για να δηλώσεις το ενδιαφέρον σου. Αν είσαι ήδη μέλος, συνδέσου και κάνε εγγραφή ως εθελοντής στην περιοχή σου!</p>
          <p><a class="btn btn-default" href="registration_form.jsp" role="button">Κάνε εγγραφή &raquo;</a></p>
        </div>
        
    </div>
    
    <%@ include file="footer.jsp" %>
    
</div>

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