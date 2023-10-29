<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="author" content="ismgroup48 2021-2022">

        <link rel="icon" href="images/heartlogo.jpg" />
        <title>Έκτακτη Ανάγκη-SOS</title>
       
        <!-- Bootstrap -->

        <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-1.11.1.min.js"></script>

        <!-- Custom styles for this template -->
        <link href="css/colors.css" rel="stylesheet">
        <link href="css/background.css" rel="stylesheet">
        

        <!-- Google Maps -->
        <script src="https://polyfill.io/v3/polyfill.min.js?features=default" charset="UTF-8"></script>
        <link rel="stylesheet" type="text/css" href="css/gmapstyle.css" />
        <script src="js/gmap.js" charset="UTF-8"></script>
        
    </head>

    <body>

        <div class="container">
            <h1 class="text-center"> SAVE LIVES-ΚΡΙΣΙΜΟ ΠΕΡΙΣΤΑΤΙΚΟ</h1>
           
            <div class="row">
                    <form class="form" name="myForm" action="emergency_page.jsp" onsubmit="return validateForm()" method="POST" required>
   	
                        <div class="form-group">
                            <label for="emergencyLocation">Τοποθεσία Περιστατικού</label>
                            
                            <div class="alert alert-danger">
                                <strong>Παρακαλούμε πληκτρολογήστε την τοποθεσία του περιστατικού και πατήστε "Find Me" ή 
                                    εντοπίστε την τοποθεσία και πατήστε την πάνω στον χάρτη</strong>
                            </div>
                            
                            <div id="map" style="width: auto; height: 400px;"></div>
                            <br>
                            <div class="panel panel-danger">
                                <div class="panel-heading">Παρακαλούμε βεβαιωθείτε ότι η παρακάτω τοποθεσία είναι η σωστή πριν συνεχίσετε </div>
                                <div class="panel-body" id="address-output" value=""></div>   
                            </div>
                            <input id="emergency-address" type="hidden" name="emergency-address" value="" readonly >
                            <input type="hidden" id="emergency-zip" style="display:none;" name="emergency-zip" value="">
                        </div>

                        <div class="form-group">
                            <label for="typeOfIncident" >Είδος Περιστατικού</label>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optradio" id="typeOfIncident" value="1">Καρδιακή ανακοπή
                                    </label>
                                </div>
                        
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optradio" id="typeOfIncident" value="2">Τραύμα-Αιμοραγία
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optradio" id="typeOfIncident" value="3">Πνιγμός-Πνιγμονή
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optradio" id="typeOfIncident" value="4">Κάκωση-Κάταγμα
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optradio" id="typeOfIncident" value="5">Έγκαυμα
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optradio" id="typeOfIncident" value="6">Αλλεργική Αντίδραση
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optradio" id="typeOfIncident" value="7">Επιληψία
                                    </label>
                                </div>
                        </div>

                        <div class="form-group">
                            <label for="phone">Τηλέφωνο Επικοινωνίας</label>
                            <div class="input-group col-md-6">
	                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
	                            <input type="phone" id="phone" name="phone" placeholder="Συμπληρώστε τον αριθμο του κινητού σας" class="form-control">
	                        </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-12 col-sm-offset-4">
                                <button class="btn btn-xl btn-outline-danger" type="submit"><strong>ΚΑΛΕΣΤΕ ΓΙΑ ΒΟΗΘΕΙΑ</strong></a>
                            </div>
                        </div>
                        <hr>
                    </form>

                <div class="col-sm-6">
                    <h2>Είμαστε δίπλα σας!</h2>
                            <p>
                                <ul style="font-size:larger;">
                                    <li>Παρακαλώ συμπληρώστε με προσοχή τα στοιχεία του περιστατικού.</li>
                                    <li>Χρειαζόμαστε το κινητό σας τηλέφωνο σε περίπτωση που θέλει ο διασώστης να επικοινωνήσει μαζί σας για παραπάνω πληροφορίες.</li>
                                    <li>Πατήστε το κουμπί <strong>Καλέστε για βοήθεια</strong> αφού ελέγξετε τις πληροφορίες.</li>
                                    <li>Μείνετε ψύχραιμος και ακολουθήστε τις χρήσιμες οδηγίες που ακολουθούν.</li>
                                </ul>
                            </p>     
                </div>
            </div>
        </div>

        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAshQH2J9LeGGDhmGuwkeWNpxrEB__D21I&callback=initMap&v=weekly" charset="UTF-8"
            async
        ></script>

        <%@ include file="footer.jsp" %>
        <script src="./js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <!--checks if all the necessary fields are filled before submitting-->
        <script>
        function validateForm() {
            var x = document.forms["myForm"]["optradio"].value;
            var y = document.forms["myForm"]["phone"].value; 
            var w = document.forms["myForm"]["emergency-address"].value;
            var numberdigits = 10;
            if (w == "") {
                alert("Παρακαλούμε εισάγετε την τοποθεσία του περιστατικού");
                return false;
            }
            if (x == "") {
              alert("Παρακαλούμε επιλέξτε τύπο περιστατικού");
              return false;
            }
            if (y == "") {
              alert("Παρακαλούμε συμπληρώστε το τηλέφωνο επικοινωνίας για να συνεχίσετε");
              return false;
            } 
            if ((y.toString().length) != numberdigits){
                alert("Ο αριθμός τηλεφώνου σας πρέπει να είναι 10 ψηφίος");
                return false;
            }   
          }
        </script>



    </body>

</html>