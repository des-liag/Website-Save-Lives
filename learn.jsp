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
    <title>Μάθε από το σπίτι</title>
    
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="sidemenu.css">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <style>
        .video {
            position: relative;
            padding-bottom: 56.25%;
        }
        .video-layout {
            max-width: 500px;
            border: 1px solid white;
        }
        .video iframe {
            position: absolute;
            width: 100%;
            height: 100%;
        }
        #vid-left {
            margin-left: 25px;
            float: left;
        }
        #vid-mid {
        
        }
        #vid-right {
            float: right;
        }
    </style>
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
            <h1 style="text-align: center;">A' Βοήθειες</h1>
            <h2 style="text-align: center;">Μάθε τα βασικά στις πρώτες βοήθειες απο το σπίτι σου!</h2>
        </div>
        <p class="round2" style="text-align: center;" style="margin: 10%;" style="font-size: xx-large;">Παρακάτω μπορείτε να βρείτε βιντεάκια που σας δείχνουν μόλις σε λίγα λεπτά πώς να αντιμετωπίσετε καταστάσεις έκτακτης ανάγκης.</p>
        
        <br>
        <div class="container">
            <div class="video-layout">
            <div class="video">
                <div id="vid-left">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/WJibNRMgfP4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div id="vid-right">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/M1Nm37HvnWM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
            </div>
        </div>
        
        <br>
        <div class="container">
            <div class="video-layout">
                <div class="video">
                <div id="vid-left">
                <iframe width="500" height="300" src="https://www.youtube.com/embed/78SVRsARnw0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div id="vid-right">
                <iframe width="500" height="300" src="https://www.youtube.com/embed/PbX_kt_CLXA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
            </div>
        </div>

        <br>
        <div class="container">
            <div class="video-layout">
            <div class="video">
                <div id="vid-left">
                <iframe width="500" height="300" src="https://www.youtube.com/embed/vHsCfaHXMEE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div id="vid-right">
                <iframe width="500" height="300" src="https://www.youtube.com/embed/dll6cUTVf2s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
            </div>
        </div>

        <hr>
        <p class="round2" style="text-align: center;" style="margin: 10%;" style="font-size: xx-large;">Θέλετε να πιστοποιηθείτε στις Πρώτες Βοήθειες; Παρακάτω θα βρείτε οργανισμούς που προσφέρουν μαθήματα και σεμινάρια για να μάθετε κι εσείς να ΣΩΖΕΤΕ ΖΩΕΣ!</p>
        <div class="listbox">
            <ul>
                <li>
                    <a href="https://kidssavelives.gr/"><h3>KIDS SAVE LIVES - ΤΑ ΠΑΙΔΙΑ ΣΩΖΟΥΝ ΖΩΕΣ</h3></a>
                </li>
                <li>
                    <a href="https://www.samarites.gr/?section=1323&language=el_gr"><h3> Ελληνικός Ερυθρός Σταυρός </h3></a>
                </li>
                <li>
                    <a href="https://www.hrt.org.gr/seminario-proton-voitheion.el.aspx"><h3> Ελληνική Ομάδα Διάσωσης </h3></a>
                </li>
                <li>
                    <a href="https://rescuetraining.gr/training-qualification/"><h3> Rescue Training International </h3></a>
                </li>
                <li>
                    <a href="http://www.how-to-save-a-life.gr/el/%CF%84%CE%B9%CE%BC%CE%AD%CF%82-%CF%80%CF%81%CE%BF%CE%B3%CF%81%CE%B1%CE%BC%CE%BC%CE%AC%CF%84%CF%89%CE%BD-%CF%80%CF%81%CF%8E%CF%84%CF%89%CE%BD-%CE%B2%CE%BF%CE%B7%CE%B8%CE%B5%CE%B9%CF%8E%CE%BD.aspx"><h3> First Aid Greece </h3></a>
                </li>
                <li>
                    <a href="https://firsthelp.gr/"><h3> First Help </h3></a>
                </li>
            </ul>
        </div>

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