<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="save_lives_2021_2022.* ,java.util.List;" %>
<%@ page errorPage="applicationerrors.jsp"%>

<%
    if (session.getAttribute("userObj") == null ) {
        NeedLogin nlog = new NeedLogin();

        try {
            nlog.needLogin();
        } catch(Exception e) {
            request.setAttribute("message", e.getMessage());
    %>
        <jsp:forward page="savelives_welcome.jsp" />  

    <%  }
    } 

    User user = (User)session.getAttribute("userObj");
    String uname = user.getUsername();
    int id = user.getUserId(uname);
    TrainedUserDAO tud = new TrainedUserDAO();

    try {
      tud.ifExistsTrainedUser(id);
    } catch(Exception e) {
      request.setAttribute("message", e.getMessage());
%>
<jsp:forward page="main_menu.jsp" />   

<%  }
    
    String passw = user.getPassword(); 
    String name = user.getName();
    String surname = user.getSurname();
    String email = user.getEmail(); 
    LocationDAO location = new LocationDAO(); 
    List<String> regions = location.getAllRegions();
    
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
    <title>Εγγραφή ως εκπαιδευμένος</title>
   
    <!-- Bootstrap -->

    <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script>

    <!-- Custom styles for this template -->
    <link href="css/colors.css" rel="stylesheet">
    <link href="css/navigationbar.css" rel="stylesheet">
    <link href="css/background.css" rel="stylesheet">
    
</head>

    <body>


        <%@ include file="navigationMenu.jsp" %>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="trainedUserForm_step1.jsp"><span class="glyphicon glyphicon-user"></span> Εγγραφή Εθελοντή</a></li>
                        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση </a></li>
                    </ul>
                </div>
                </div>
            </nav>
            </div>
        </div>
       

        <div class="container">
            <form action="step1_controller.jsp" method="POST" class="form-horizontal">
                <h2 style="text-align: center;">Συμπληρώστε την φόρμα εγγραφής ως εκπαιδευμένος στις Α' βοήθειες</h2>
                <div class="col-sm-8 col-sm-offset-2 ">
                    <p style="font-size:larger;" >
                        Υποβάλλoντας αυτή την φόρμα γίνεστε ενεργό μέλος της κοινότητάς μας 
                        και θα μπορείτε να ανταποκριθείτε σε έκτακτα περιστατικά που απαιτούν
                        πρώτες βοήθειες, κι έτσι να <strong><b style="color: red;">ΣΩΣΕΤΕ ΖΩΕΣ</b></strong> 

                    </p>
                    <h3 style="text-align: center;">Βήμα 1ο: Προσωπικά στοιχεία</h3>
                </div>

                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Όνομα</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" id="firstName" value="<%=name%>" name="firstname" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">Επώνυμο</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" id="lastName" value="<%=surname%>" name="lastname" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="phone" class="col-sm-3 control-label">Τηλέφωνο Επικοινωνίας</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input type="text" id="phone" placeholder="Συμπληρώστε τον αριθμο του κινητού σας" name="phone" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input type="text" id="email" value="<%=email%>" name="email" class="form-control">
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Ημερομηνία Γέννησης</label>
                    <div class="col-md-6">
                        <input type="date" id="birthDate" name="birthDate" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="country" class="col-sm-3 control-label">Χώρα</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                            <select id="country" name="country" class="form-control">
                                <option>Ελλάδα</option>
                            </select>
                        </div>
                    </div>
                </div> 

                <div class="form-group">
                    <label for="region" class="col-sm-3 control-label">Νομός</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                            <select id="region" name="region" class="form-control">
                                <option value="">--- Παρακαλώ επιλέξτε τον νομό που μπορείτε να προσφέρετε ---</option>

                                <!-- επιλεγω τους νομους απο την ΒΔ -->
                                
                                <% for (int i = 0; i < regions.size(); i++) { %>
                                    <option value="<%=regions.get(i) %>"><%=regions.get(i) %></option>
                                <%	} %>

                            </select>
                        </div>
                    </div>
                </div> 

                <div class="form-group">
                    <label for="city" class="col-sm-3 control-label">Πόλη</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <input type="text" id="city" placeholder="Συμπληρώστε την πόλη που διαμένετε" name="city" class="form-control">
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="address" class="col-sm-3 control-label">Διεύθυνση</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <input type="text" id="address" placeholder="Συμπληρώστε την διεύθυνσή σας" name="address" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="zip" class="col-sm-3 control-label">Ταχυδρομικός Κώδικας</label>
                    <div class="col-sm-9">
                        <div class="input-group col-md-8">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
                            <input type="text" id="zip" placeholder="Συμπληρώστε τον ΤΚ της περιοχής σας" name="zip" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-4"><span class="pull-left">
                        <button type="reset" class="btn btn-danger" style="margin-left: 295px;"> Εκκαθάριση <i class="glyphicon glyphicon-remove"></i></button>      
                    </div></span>

                    <span class="pull-right">
                        <button type="submit" class="btn btn-success" style="margin-right: 620px;"> Επόμενο <i class="glyphicon glyphicon-arrow-right"></i></button>
                    </span>
                </div>
            </form>   
            <!-- /.form-group -->

        <%@ include file="footer.jsp" %>

    </body>
</html>