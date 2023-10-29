<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="save_lives_2021_2022.* ,java.util.*;" %>
<%@ page errorPage="applicationerrors.jsp" %>


<%
    String ar [] = request.getParameterValues("areas");
    String skls [] = request.getParameterValues("skills");
    String email = request.getParameter("email");
    String region = request.getParameter("region");
    String firstname = request.getParameter("fn");
    String lastname = request.getParameter("ln");
    String phone = request.getParameter("ph");
    User user = (User)session.getAttribute("userObj");
    String username = user.getUsername();
    String password = user.getPassword();
    region = (String)region;


    if (region != null) {
        region = new String(region.getBytes("ISO-8859-1"), "UTF-8");
    }

    int counter = 0;

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
        <link href="css/jumbotron.css" rel="stylesheet">
        
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

    <br>
    <br>

    <div class="container theme-showcase" role="contentinfo">
        <div class="jumbotron">
            <h1 style="text-align:center;"> Save Lives</h1>
        </div>
    </div>

<%
    //skills
    if (skls == null) {        
		counter++;
	}

    //areas
    if (ar == null) {        
		counter++;
	}

%>

<%

    if (counter == 0) { 

            List<String> areas = Arrays.asList(ar); 

                for (int i = 0; i < areas.size(); i++) {
                    String specific_area = (String)areas.get(i);
                    
                    if (specific_area != null) {
                        specific_area = new String(specific_area.getBytes("ISO-8859-1"), "UTF-8");
                    }
                    
                    areas.set(i, specific_area);
                }

            SkillsDAO sk = new SkillsDAO(); 
            
            List<Integer> selected_ids = new ArrayList<Integer>(); // skill id list
        
            int[] ids = new int[skls.length];
        
            for (int i = 0; i < ids.length; i++) { 
                ids[i] = Integer.parseInt(skls[i]);
                selected_ids.add(ids[i]);
            } 
        
            List<Skills> skills =  new ArrayList<Skills>();
        
            for (int i = 0; i < ids.length; i++) { 
                String skill_name = sk.getSkillName(ids[i]);
                skills.add( new Skills( selected_ids.get(i), skill_name));
                
            }

            TrainedUser tu = new TrainedUser(firstname, lastname, email, username, password, phone, region, areas, skills);

            TrainedUserDAO tud = new TrainedUserDAO();

            tud.registerAsTrainedUser(tu); 

%>

            <div class="col-sm-8 col-sm-offset-4">
                <h1>Η εγραφή σας ολοκληρώθηκε</h1>
            </div>

            <div class="page-header col-sm-8 col-sm-offset-3">
                <h2>Ευχαριστούμε που βοηθάτε και εσείς να <strong><b style="color: red;">ΣΩΘΟΥΝ ΖΩΕΣ</b></strong> </h2>
            </div>

            <div class="row">
                <div class="col-lg-12">
                <div class="alert alert-warning " style="text-align: center;">
                    <strong>Note:</strong> Τα στοιχεία της εγγραφή σας έχουν αποσταλλεί, μαζί με περαιτέρω οδηγίες, στο email που δηλώσατε: <%=email %>
                </div>
                </div>
            </div>

            <% 
                String subject = "ΟΛΟΚΛΗΡΩΣΗ ΕΓΓΡΑΦΗΣ ΕΚΠΑΙΔΕΥΜΕΝΟΥ";
                String content = "<h1><span style=\"color:black;\">Καλησπέρα " + firstname + "! Είσαι πλέον μέλος της κοινότητας του <span style=\"color: red;\">Save Lives!</span></h1></span>" +
                                "<div><p style=\"color: black;\">" +
                                "Ενημερωθήκαμε πως γνωρίζεις: " +
                                "<ul>";
                                
                                for (Skills skill : skills) {
                                    content += "<li>" + skill.getSkill_name() + "</li>";
                                }

                                content += "</ul>" +
                                    "<br>Από εδώ και πέρα, σε περιπτώσεις αντίστοιχων περιστατικών στην κοντινή σου περιοχή," +
                                        "θα λαμβάνεις <span style=\"color: blue;\">email</span> με ένα λινκ και θα καλείσαι να ανταποκριθείς, ώστε <b>να βοηθήσεις άμεσα κάποιον συνάνθρωπο σου που το χρειάζεται. </b>" +
                                    "<a href= \"http://ism.dmst.aueb.gr/ismgroup48/savelives/about_us.jsp\">Μάθε περισσότερα σχετικά με εμάς</a>" +
                                "</p></div>";
                new SendEmail(email, subject, content, "text/html; charset=utf-8");
            %>

<% } else { %>

    <div class="page header" style="text-align: center;">
        <h1>Η φόρμα σας περιέχει λάθη - Παρακαλώ ελέγξτε τις επισημάνσεις που ακολουθούν</h1>
    </div> 

    <br>

    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-danger">
                <strong>

<%	 //areas
    if (ar == null ) {        
%>
    <li><b>Παρακαλώ επιλέξτε τουλάχιστον μια από τις προτεινώμενες περιοχές</b></li>
	
<%	   
	} 
    //skills
    if (skls == null) {        
%>
    <li><b>Παρακαλώ επιλέξτε τουλάχιστον μια από τις προτεινώμενες γνώσεις α' βοηθειών</b></li>			
<%	   
	}
%>
                </strong>
            </div>
        </div>
    </div>

    <button onclick="location.href='trainedUserForm_step2.jsp?paramreg=<%=region %>&paramem=<%=email %>&paramph=<%=phone %> '" class="btn btn-lg">
        <span class="glyphicon glyphicon-chevron-left"></span> Επιστρέψτε στην φόρμα</button>

<%     
    }
%>
        <%@ include file="footer.jsp" %>


</body>
</html>