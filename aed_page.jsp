<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <title>Απινιδωτές</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="sidemenu.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>

    <div class="sidenav">
        <% if (session.getAttribute("userObj") != null) { %>
            <a href="main_menu.jsp">SAVE LIVES</a>
        <% } else { %>
            <a href="savelives_welcome.jsp">SAVE LIVES</a>
        <% } %>
        <a href="about_us.jsp">Σχετικά με εμάς</a>
        <a href="aed_page.jsp">Aπινιδωτές</a>
        <a href="learn.jsp">Μάθε από το σπίτι</a>
        <a href="trainedUserForm_step1.jsp"> Γίνε εθελοντής</a>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
        
        <% if (session.getAttribute("userObj") != null) { %>
            <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση </a>
        <% } %>

    </div>
    
    <div class="main">
        <div class="jumbotron">
            <h1 style="text-align: center;">Απινιδωτές</h1>
            <h2 style="text-align: center;">Χάρτης απινιδωτών στην Ελλάδα</h2>
        </div>
            
        <p class="round2" style="text-align: center;" style="margin: 10%;" style="font-size: xx-large;">Εκατοντάδες απινιδωτές [AEDs] περιμένουν να τους ανακαλύψεις. 
            Καταχώρησε έναν νέο απινιδωτή στον Εθνικό Χάρτη Απινιδωτών του KIDS SAVE LIVES,
             μάθε που βρίσκεται ο πλησιέστερος για να καταφέρεις να σώσεις μια ζωή, ή ζήτησε μας πολύτιμες συμβουλές αγοράς,
             χρήσης και τοποθέτησης απινιδωτή στον χώρο σου..</p>    
        
        <br>     
        <div class="container">
        <a href="https://kidssavelives.gr/aed/">
        <img src="images/aedmap.png" class="img-rounded text-center" alt="mapImage" style="width:1130px;"  >
        </a>
        </div>

        <hr>
        <h4 style="text-align: center;" style="color: rgb(184, 3, 3);">Πάτα πάνω στην εικόνα για να μεταφερθείς
             στην σελίδα του KIDS SAVE LIVES και να δεις τον χάρτη Απινιδωτών</h2>
    </div>


<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/carousel.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <%@ include file="footer.jsp" %>
</body>
</html>