<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="applicationerrors.jsp" %>
<%@ page import="save_lives_2021_2022.*,java.util.List, java.sql.Date, java.sql.Time, java.util.ArrayList;" %>

<%
    String emergencyAddress = (String)request.getParameter("emergency-address");
    String emergencyZip = request.getParameter("emergency-zip");
    String emergencyType = request.getParameter("optradio");
    String phone = request.getParameter("phone");

    //convert to display greek characters
    emergencyAddress = new String(emergencyAddress.getBytes("ISO-8859-1"), "UTF-8");

    //get types name, creates a skill object 
    int typeId = Integer.parseInt(emergencyType);
    SkillsDAO skd = new SkillsDAO();
    String typeName = skd.getSkillName(typeId);
    Skills type_of_emergency = new Skills(typeId, typeName);

    //gets exact time and Date
    long now = System.currentTimeMillis();
    Time emerTime = new Time(now);
    Date emerDate = new Date(now);

    //save the emergency in the db
    Emergency thisEmergency = new Emergency(type_of_emergency, emergencyAddress, emergencyZip, emerDate, emerTime);
    EmergencyDAO edao = new EmergencyDAO();
    edao.saveNewEmergency(thisEmergency);

%>


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
        <link href="css/photos.css" rel="stylesheet">
        <link href="css/modalButton.css" rel="stylesheet">
        
    </head>

    <body>
        
        <div class="container">
            <h1 class="text-center"> SAVE LIVES-ΚΡΙΣΙΜΟ ΠΕΡΙΣΤΑΤΙΚO</h1>
            <h2 class="text-center"> Παραμένετε ψύχραιμοι! Ερχεται βοήθεια!</h2>
            <br>
            <br>
            <br>

            <div class="row">
            <div class="col-md-6">  
            <div class="panel-group">
                <div class="panel panel-default">
                  <div class="panel-heading">ΠΛΗΡΟΦΟΡΙΕΣ ΠΕΡΙΣΤΑΤΙΚΟΥ</div>
                  <div class="panel-body">
                        <div class="List">
                            <li>Διέυθυνση Περιστατικού: <%=emergencyAddress %> </li>
                            <li>Τύπος Περιστατικού: <%=typeName %></li>
                            <li>Τηλέφωνο: <%=phone %></li>
                            <li>Ημερoμηνία: <%=emerDate %></li>
                            <li>Ώρα: <%=emerTime %></li>  
                        </div>
                    </div>
                    </div>
                </div>                
            </div>
            
            <div class="col-md-6">
                <div class="panel-group">
                    <div class="panel panel-danger">
                        <div class="panel-heading">Απινιδωτής</div>
                        <div class="panel-body">
                            <div class="List">
<%
                            if (typeId != 1){
%>
                            <li><b>Δεν απατείται χρήση απινιδωτή στο περιστατικό</b></li>
<%
                            }else{
%>
                            <li><b>Απατείται χρήση απινιδωτή στο περιστατικό</b></li>

<%                          
                            try {
                                AedDAO aeddao = new AedDAO();
                                Aed thisAed = aeddao.getAedByZip(emergencyZip);
%>
                            <li>Κοντινός Απινιδωτής: <%=thisAed.getAed_street() %> <%=thisAed.getAed_number() %>, <%=thisAed.getAed_area() %></li>                          
<%
                            }catch (Exception e){
%>
                                <li>Δεν βρεθηκε κοντινός απινιδωτης</li>
<%
                            } 
                        }                               
%>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- Trigger/Open The Modal -->
                <button id="myBtn" class="btn btn-large" style="color: red;">ΚΑΛΕΣΤΕ ΤΟ ΕΚΑΒ</button>

                <!-- The Modal -->
                <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content2">
                    <span class="close">&times;</span>
                    <p>Είτε βρεθεί κάποιος ανταποκριτής στην περιοχή σας, είτε όχι
                    <p><strong>ΣΑΣ ΠΑΡΑΚΑΛΟΥΜΕ ΚΑΛΕΣΤΕ ΤΟ ΕΚΑΒ ΤΟ ΣΥΝΤΟΜΟΤΕΡΟ ΔΥΝΑΤΟΝ!</strong></p>
                    <p>Οι ανταποκριτές μας είναι εκπαιδευμένοι στις πρώτες βοήθειες αλλά σε
                    κάποια περιστατικά ενδέχεται να πρέπει να μεταφερθούν οι 
                    ασθενέις σε νοσοκομείο για παραπάνω φροντίδα.</p>
                    <br>
                    <p>
                    <strong><p>ΕΚΑΒ: 166</p>
                            <p>ΕΥΡΩΠΑΙΚΟΣ ΑΡΙΘΜΟΣ ΕΚΤΑΚΤΗΣ ΑΝΑΓΚΗΣ: 112</p>
                            <p>ΕΦΗΜΕΡΕΥΟΝΤΑ ΔΗΜΟΣΙΑ ΝΟΣΟΚΟΜΕΙΑ: 1434</p>
                    </strong>
                    </p>
                    </p>
                </div>

                </div>

            </div>
            
        </div>           
        </div>
        <%    
            //send email to nearest trained user to help in this emergency 
            LocationDAO locdao = new LocationDAO();
            List<String> trainUsers = new ArrayList<String>();
            trainUsers = locdao.findNearestTrainedUser(emergencyZip, typeId);
            String subject = "ΕΠΕΙΓΟΝ ΠΕΡΙΣΤΑΤΙΚΟ";
            
            if (trainUsers != null){
                for (int i = 0; i < trainUsers.size(); i++){
                    String userEmail = trainUsers.get(i);
            
            
            
                    String content = "<h1><span style=\"color:red;\">ΕΠΕΙΓΟΝ ΠΕΡΙΣΤΑΤΙΚΟ: " + typeName + "</span></h1>" +
                                    "<h3>\nΣυμβάινει ΤΩΡΑ στη διεύθυνση: " + emergencyAddress + "</h3>" +
                                    "<h2>\nΠήγαινε άμεσα στο περιστατικό για βοήθεια. Ο συνάνθρωπος σου σε χρειάζεται!</h2>" +
                                    "<h3>\nΤο άτομο που ειδοποίησε έχει τηλέφωνο: <b>" + phone + "</b></h3>";
                                    
                    new SendEmail(userEmail, subject, content, "text/html; charset=utf-8");
                }

                if (trainUsers.size() > 0) {
        %>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-lg-12">
                        <div class="alert alert-danger " style="text-align: center;">
                            <strong>Note: </strong><%=(trainUsers.size() == 1 ? "ΒΡΕΘΗΚΕ 1 ΑΤΟΜΟ" : "ΒΡΕΘΗΚΑΝ " + trainUsers.size() + " ΑΤΟΜΑ") %> 
                                            ΣΤΗΝ ΚΟΝΤΙΝΗ ΠΕΡΙΟΧΗ. 
                                            <%=(trainUsers.size() == 1 ? "ΕΙΔΟΠΟΙΗΘΗΚΕ ΓΙΑ ΝΑ ΕΡΘΕΙ ΑΜΕΣΑ ΝΑ ΒΟΗΘΗΣΕΙ" : "ΕΙΔΟΠΟΙΗΘΗΚΑΝ ΓΙΑ ΝΑ ΕΡΘΟΥΝ ΑΜΕΣΑ ΝΑ ΒΟΗΘΗΣΟΥΝ") %>
                        </div>
                        </div>
                    </div>
        <%      }
        
            } else {
        %> 
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-lg-12">
                        <div class="alert alert-danger " style="text-align: center;">
                            <strong>Note: </strong>ΔΕΝ ΒΡΕΘΗΚΑΝ ΑΤΟΜΑ ΣΤΗΝ ΚΟΝΤΙΝΗ ΠΕΡΙΟΧΗ ΓΙΑ ΝΑ ΑΝΤΑΠΟΚΡΙΘΟΥΝ ΣΤΟ ΠΕΡΙΣΤΑΤΙΚΟ. ΚΑΛΕΣΤΕ ΑΜΕΣΩΣ ΤΟ ΕΚΑΒ ΣΤΟ 166 Ή ΣΤΟ 112
                        </div>
                        </div>
                    </div>
        <% }
        %>
    
        <div class="row">
        
          <div class="col-md-6 text-center">
            <h3 style="color: red">Οδηγίες Α' Βοηθειών εν μέσω πανδημίας</h3>
            <img src="images/emergency1.png" style="max-width:100%;max-width:400px;cursor:pointer" 
            onclick="onClick(this)" class="modal-hover-opacity">
            
              <h4>Πατήστε πάνω στην εικόνα</h4>
          </div>
          <div class="col-md-6 text-center">
              <h3 style="color:red">Οδηγίες Α' Βοηθειών</h3>
              
            <img src="images/emergency2.png" style="width:100%;max-width:400px;cursor:pointer" onclick="onClick(this)" class="modal-hover-opacity">
            <h4>Πατήστε πάνω στην εικόνα</h4>
          </div>
          
        </div>

          <div id="modal01" class="modal" onclick="this.style.display='none'">
            <span class="close">&times;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <div class="modal-content">
              <img id="img01" style="max-width:100%">
            </div>
          </div>
        


<script>

function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
}
</script>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");
    
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");
    
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    
    // When the user clicks the button, open the modal 
    btn.onclick = function() {
      modal.style.display = "block";
    }
    
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
</script>
        
     

        <br>
        <br>
        <br>
        <br>
        <%@ include file="footer.jsp" %>

    </body>
    </html>
    