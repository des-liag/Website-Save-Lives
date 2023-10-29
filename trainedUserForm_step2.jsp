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

    <%      }
    } 

    String paramreg = request.getParameter("paramreg");
    String paramem = request.getParameter("paramem");
    String paramph = request.getParameter("paramph");
    paramreg = (String) paramreg;
    
    

    if (paramreg != null) {
        paramreg = new String(paramreg.getBytes("ISO-8859-1"), "UTF-8");
    }

    String region = (String)request.getAttribute("rg");
    if (paramreg == null) {
        region = (String)request.getAttribute("rg");
    } else {
        region = paramreg;
    }

    String email = (String)request.getAttribute("email");
    if (paramem == null) {
        email = (String)request.getAttribute("email");
    } else {
        email = paramem;
    }

    String phone = (String)request.getAttribute("ph");
    if (paramph == null) {
        phone = (String)request.getAttribute("ph");
    } else {
        phone = paramph;
    }


    SkillsDAO sk = new SkillsDAO(); 
    List<Skills> skills = sk.getAllSkills();
    LocationDAO location = new LocationDAO(); 
    
    List<String> areas = location.findArea(region); 
    String firstname = (String)request.getAttribute("fn");
    String lastname = (String)request.getAttribute("ln");
    User user = (User)session.getAttribute("userObj");
    String username = user.getUsername();
    String password = user.getPassword();
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
            <form action="step2_controller.jsp" method="POST" class="form-horizontal">
                <input type="hidden" id="em" name="email" value="<%=email%>">
                <input type="hidden" id="fn" name="fn" value="<%=firstname%>">
                <input type="hidden" id="ln" name="ln" value="<%=lastname%>">
                <input type="hidden" id="ph" name="ph" value="<%=phone%>">
                <input type="hidden" id="rg" name="region" value="<%=region%>">

                <h2 style="text-align: center;">Συμπληρώστε την φόρμα εγγραφής ως εκπαιδευμένος στις Α' βοήθειες</h2>
                <div class="col-sm-8 col-sm-offset-2 ">
                    <p style="font-size:larger;" >
                       Για να μπορούμε να ανταποκριθούμε με ακρίβεια στα περιστατικά χρειάζεται να δηλώσετε σε αυτο το βήμα
                       τις περιοχές που μπορείτε να εξυπηρετήσετε και τις γνώσεις Α΄ βοηθειών που διαθέτετε.

                    </p>
                    <h3 style="text-align: center;">Βήμα 2ο: Περιοχές εξυπηρέτησης και Γνώσεις Α΄ βοηθειών </h3>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">Περιοχές που μπορείτε να ανταποκριθείτε </label>
                        <div class="col-sm-9 ">
                            <div class="checkbox">
                                
                                <!-- επιλεγω τις περιοχες απο την ΒΔ και τα εμφανίζω, σύμφωνα με τον νομό που επίλεξε ο χρήστης  -->

                                <% for (int i = 0; i < areas.size(); i++) { %>
                                    <div class="col-sm-10">
                                        <label>
                                            <input type="checkbox" name="areas" value="<%=areas.get(i) %>">
                                                <%=areas.get(i) %> 
                                        </label>
                                    </div>
                                <%	} %>
                            </div>
                        </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-3">Γνώσεις που διαθέτετε στις Α' βοήθειες</label>
                        <div class="col-sm-9 ">
                            <div class="checkbox">

                                <!-- επιλεγω τα skills απο την ΒΔ και τα εμφανίζω -->

                                <% for (Skills skl: skills) { %>
                                    <div class="col-sm-10">
                                        <label>
                                            <input type="checkbox" name="skills" value="<%=skl.getSkill_id() %>">
                                                <%=skl.getSkill_name() %> 
                                        </label>
                                    </div>
                                <%	} %>
                            </div>
                        </div>
                </div>

                <div class="row">
                    <div class="col-sm-4"><span class="pull-left">
                        <button type="reset" class="btn btn-danger" style="margin-left: 305px;"><span class="glyphicon glyphicon-remove"></span> Ακύρωση </button>
                    </div></span>

                    <span class="pull-right">
                        <button type="submit" class="btn btn-success" style="margin-right: 620px;"><span class="glyphicon glyphicon-ok"></span> Υποβολή </button>
                    </span>
                </div>

                <br>
                <div class="col-xsm-4 col-sm-offset-2">
                    <p class="form-group">Πατώντας <b>Υποβολή</b> δηλώνετε οτι συμφωνείτε με τους<a href="#"> Όρους Χρήσης </a>της εφαρμογής.</p>
                </div>

            </form> 
            <!-- /form -->
        </div> 
        <!-- ./container -->



<%@ include file="footer.jsp" %>

</body>
</html>