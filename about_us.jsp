<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="applicationerrors.jsp"%>

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
    <title>SAVE LIVES - Σχετικά με εμάς</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    
    
    <link rel="stylesheet" href="sidemenu.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>

<style>
    #row1 {
        width:100%;
        margin-top:30px;
        border: 3px solid red;
        border-radius:14px;
        height:auto;
    }
</style>
<body>

    <div class="sidenav">
        <% if (session.getAttribute("userObj") != null) { %>
            <a href="main_menu.jsp">SAVE LIVES</a>
        <% } else { %>
            <a href="savelives_welcome.jsp">SAVE LIVES</a>
        <% } %>
        <a class="active" href="about_us.jsp">Σχετικά με εμάς</a>
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
            <h1 style="text-align: center;">SAVE LIVES</h1>
            <h2 style="text-align: center;">Λίγα λόγια για εμάς..</h2>
        </div>
        
        <div class="container">
            <div class="row" id="row1" style="text-align: center;">
                <h3>Το Save Lives έχει σκοπό να δημιουργήσει μια κοινότητα εκπαιδευμένων ατόμων στις Α' βοήθειες, όπου όλοι μαζί θα προσφέρουμε  
                    εθελοντικά τη βοήθεια μας σε επείγοντα περιστατικά, συμβάλλοντας στο να σωθούν ζωές συνανθρώπων μας. Όραμα μας είναι αυτή η κοινότητα
                    να μεγαλώνει ολοένα και περισσότερο ώστε να μην μείνει κανένας άνθρωπος αβοήθητος. Γι αυτό, η εφαρμογή απευθύνεται και σε όσους μέχρι
                    τώρα δεν έχουν εκπαιδευτεί στις Α' βοήθειες αλλά ενδιαφέρονται να μάθουν και να προσφέρουν με κάθε τρόπο. Μία πλοήγηση στην ιστοσελίδα
                    μας θα σας πείσει και θα σας καθοδηγήσει εύκολα και γρήγορα!
                </h3>
            </div>   
        </div>


        <div class="container">
            <div class="row" id="row1" style="text-align: center;">
                <h3>Σε οποιοδήποτε περιστατικό πλέον δεν θα είσαι μόνος/η σου! Κάλεσε βοήθεια μέσω της εφαρμογής και άμεσα θα ανταποκριθούν κοντινοί
                    εκπαιδευμένοι πολίτες στο περιστατικό. Ακόμη η εφαρμογή θα σου δώσει οδηγίες για το τι πρέπει να κάνεις σε μία τέτοια επείγουσα κατάσταση. 

                </h3>
            </div>   
        </div>



        <div class="container">
            <div class="row" id="row1" style="text-align: center;">
                <h2>Μην χάσεις την ευκαιρία. Γίνε η αλλαγή που ονειρεύεσαι να δεις στον κόσμο!
                </h2>
            </div>   
        </div>

        
     </div>

    <%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/carousel.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>