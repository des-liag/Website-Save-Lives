<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="save_lives_2021_2022.* ,java.util.List, java.util.ArrayList;" %>


<%

String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String country = request.getParameter("country");
String region = request.getParameter("region");
String city = request.getParameter("city");
String address = request.getParameter("address");
String zip = request.getParameter("zip");
region = (String)region;

// convert to UTF-8 to support Greek characters
if (firstname != null) {
	firstname = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");
}

if (lastname != null) {
	lastname = new String(lastname.getBytes("ISO-8859-1"), "UTF-8");
}

if (region != null) {
	region = new String(region.getBytes("ISO-8859-1"), "UTF-8");
}

if (city != null) {
	city = new String(city.getBytes("ISO-8859-1"), "UTF-8");
}

if (address != null) {
	address = new String(address.getBytes("ISO-8859-1"), "UTF-8");
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
	// firstname
	if (firstname == null || firstname.length() < 4) {        		
		counter++;
	}
	
	// lastname
	if (lastname == null || lastname.length() < 4) {        		
		counter++;
	}

    //phone
    if (phone == null || phone.length() != 10 ) {
        counter++;
    }

	
	//Validating email address

	String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(email);
	
	if( !m.matches() ) {				
		counter++;
	}
	
    // region
	if (region.equals("")) {        
		counter++;
	}

    // city
	if (city == null || city.length() < 4) {        		
		counter++;
	}

    // address
	if (address == null) {        
		counter++;
	}

    // zip
	if (zip.equals("") || zip.length() != 5) {        		
		counter++;
	}
%>

<%

    if (counter == 0) { 

        request.setAttribute("rg", region);
        request.setAttribute("email", email);
        request.setAttribute("fn", firstname);
        request.setAttribute("ln", lastname);
        request.setAttribute("ph", phone);
    
%>
        <jsp:forward page="trainedUserForm_step2.jsp"/>
            

<% } else { %>

    <div class="page header" style="text-align: center;">
        <h1>Η φόρμα σας περιέχει λάθη - Παρακαλώ ελέγξτε τις επισημάνσεις που ακολουθούν</h1>
    </div> 

    <br>

    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-danger">
                <strong>

<%  
     //name
     if (firstname == null || firstname.length() < 4) {
           
%>
    <li><b>Το όνομα πρέπει να αποτελείται από τουλάχιστον 4 γράμματα</b></li>

<%
     }

     //lastname
     if (lastname == null || lastname.length() < 4) {        
        
%>
    <li><b>Το επώνυμο πρέπει να αποτελείται από τουλάχιστον 4 γράμματα</b> </li>

<% 
    }

    //phone
    if (phone == null || phone.length() != 10 ) {
%>  
    <li><b>Το τηλέφωνο επικοινωνίας πρέπει να έχει 10 ψηφία</b></li>
<%
    }

    //email
	if( !m.matches() ) {				
		
%>
    <li><b>Ελέγξτε την σύνταξη του email</b></li>
<%
	}
    // region
	if (region.equals("") || region == null) {        
%>
     <li><b>Παρακαλώ επιλέξτε έναν νομό</b></li>		
<%
	}

    // city
	if (city == null || city.length() < 4) {        		
%>
    <li><b>Παρακαλώ εισάγεται μια πόλη - Η πόλη πρέπει να αποτελείται απο τουλάχιστον 4 γράμματα</b></li>			
<%	
	}

    // address
	if (address == null || address.length() < 2) {        
%>
    <li><b>Παρακαλώ εισάγεται την διεύθυνσή σας</b></li>			
<%	
	}

    // zip
	if (zip.equals("") || zip.length() != 5) {        		
 %>
    <li><b>Παρακαλώ εισάγεται ΤΚ - Ο ΤΚ πρέπει να αποτελείται απο 5 αριθμούς </b></li>			
<%	
	}
%>
                </strong>
            </div>
        </div>
    </div>

<button onclick="location.href='trainedUserForm_step1.jsp'" class="btn btn-lg">
    <span class="glyphicon glyphicon-chevron-left"></span> Επιστρέψτε στην φόρμα</button>


<%     
    }
%>


        <%@ include file="footer.jsp" %>


</body>
</html>