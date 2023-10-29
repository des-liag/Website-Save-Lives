<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="applicationerrors.jsp" %>
<%@ page import="save_lives_2021_2022.*" %>

<% 
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String Rptpassword = request.getParameter("Rptpassword");
    String terms = request.getParameter("terms");

    if (name != null) {
        name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (surname != null) {
        surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
    }
%>
<%-- position 0 is the number of countErrors --%>
<%-- if position 1-7 is 1 means that the corresponding field has error --%>
<%
int[] array = check(name, surname, email, username, password, Rptpassword, terms);                 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<meta name="description" content="registration_form">
    <meta name="author" content="ismgroup48 2021-2022">

    <link rel="icon" href="images/heartlogo.jpg" />
    <title>Επιτυχία/Αποτυχία Εγγραφής</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
	<link href="css/register.css" rel="stylesheet">
</head>

<body>

<%@ include file="navigationMenu.jsp" %>


        </div>
        </div>
    </nav>
    </div>
</div>

<br>
<br>
<br>
<br>

    <!-- container -->
    <div class="container theme-showcase" role="contentinfo">
        <div class="jumbotron">
            <h1 style="text-align:center;"> Save Lives</h1>
        </div>
    </div>

        <% if (array[0] == 0) {
            try {
                User user = new User(name, surname, email, username, password);
                UserDAO userdao = new UserDAO();
                userdao.register(user);
        %>
            <!-- Page Title -->
            <div class="page-header" style="text-align: center;">
                <h1 style="color: red;">Η εγγραφή σας ολοκληρώθηκε επιτυχώς!</h1>
            </div>

            <div class= note>
                <% 
                String subject = "ΟΛΟΚΛΗΡΩΣΗ ΕΓΓΡΑΦΗΣ";
                String content = "<h1>Καλωσήρθατε στο <span style=\"color: red;\">Save Lives!</span></h1>" +
                                "<div><p>" +
                                        "Ενδιαφέρεσαι για πρώτες βοήθειες; Θέλεις να ενημερώνεσαι για τη δράση ανθρωπιστικών οργανισμών, " +
                                        "για online σεμινάρια, για εκπαιδευτικά βίντεο και πολλά άλλα;" +
                                        "<br>Τότε έχεις εγγραφεί στην κατάλληλη εφαρμογή!!" +
                                    "</p></div>" +
                                "<div><p><b>" +
                                        "Δες πώς μπορείς κι εσύ να συμβάλεις στο να σωθούν ακόμα περισσότερες ζωές! " +
                                        "<a href=\"http://ism.dmst.aueb.gr/ismgroup48/savelives/savelives_welcome.jsp\">Συνδέσου τώρα στην εφαρμογή!</a>" +
                                "</b></p></div>";
                new SendEmail(email, subject, content, "text/html; charset=utf-8");
                %>
                <p style="text-align: center;"><b>Σημείωση:</b> Σας έχει αποσταλεί email στη διεύθυνση: <a href="#" class="alert-link"> <%=email %></a></p>
            </div>

            <style>
                .note {text-align: left;
                    margin-bottom: 20px;
                    padding: 8px 12px;
                    background-color: #ddffdd;
                }
            </style>

            <ul>
                <li>
                    <b>Όνομα:</b> <%=name %>
                </li>
                <li>
                    <b>Επώνυμο:</b> <%=surname %>
                </li>
                <li>
                    <b>Email:</b> <%=email %>
                </li>
                <li>
                    <b>Όνομα χρήστη:</b> <%=username %>
                </li>
            </ul>
        <% 
            } catch(Exception e) {
                array[0] = -1;
                request.setAttribute("error_message", e.getMessage());
            }   
        %>


        <% } if (array[0] != 0) { %> 
             
            <!-- Page Title -->
            <div class="page-header" style="text-align: center;">
                <h1 style="color: red;">Η φόρμα εγγραφής περιέχει λάθη - Παρακαλώ ελέγξτε τις επισημάνσεις που ακολουθούν</h1>
            </div>

            <% if (array[0] == -1) {
                if (request.getAttribute("error_message") != null) {	
                    String error_message = (String)request.getAttribute("error_message");
                    error_message = new String(error_message.getBytes("ISO-8859-1"), "UTF-8");					
            %>
                    <div class="alert alert-danger" style="text-align: center;">
                        <%=error_message %>
                    </div>
            <%
                }
            } else {  %>             
                
                <div class= "errors">
                    <p>
                        <ul>
                            <% if (array[1] == 1) { %>
                                <li>
                                    Το όνομα πρέπει να αποτελείται από τουλάχιστον 4 χαρακτήρες
                                </li>
                            <% } %>
                            <% if (array[2] == 1) { %>
                                <li>
                                    Το επώνυμο πρέπει να αποτελείται από τουλάχιστον 4 χαρακτήρες
                                </li>
                            <% } %>
                            <% if (array[3] == 1) { %>
                                <li>
                                    Η διεύθυνσή ηλεκτρονικού ταχυδρομείου είναι λανθασμένη
                                </li>
                            <% } %>
                            <% if (array[4] == 1) { %>
                                <li>
                                    Το όνομα χρήστη πρέπει να αποτελείται από τουλάχιστον 5 χαρακτήρες
                                </li>
                            <% } %>
                            <% if (array[5] == 1) { %>
                                <li>
                                    Ο κωδικός πρέπει να αποτελείται από τουλάχιστον 6 χαρακτήρες
                                </li>
                            <% } %>
                            <% if (array[6] == 1) { %>
                                <li>
                                    Ο κωδικός δεν ταιριάζει
                                </li>
                            <% } %>
                            <% if (array[7] == 1) { %>
                                <li>
                                    Παρακαλείστε να συμφωνήσετε στους όρους και τις προϋποθέσεις χρήσης
                                </li>
                            <% } %>
                        </ul>
                    </p>
                </div>

                <style>
                    .errors {text-align: left;
                        margin-bottom: 20px;
                        padding: 8px 5px;
                        background-color: #ffdddd;
                        color: red;
                    }
                </style>
            <% } %>




            <a href="registration_form.jsp" class="btn btn-primary btn-lg active" role="button" style="background-color: #ffdddd;" > 
                <span style="color: black;">&#60;</span> <b style="color: rgb(5, 5, 5);">Επιστροφή στην φόρμα</b></a>


        <% } %>
    </div>

    <br>
    <br>
    <br>
    <%@ include file="footer.jsp" %>
</body>
</html>



<%!
public int[] check(String name, String surname, String email, String username, String password, String Rptpassword, String terms) {

    int array[] = new int[8];

    for (int i = 0; i < array.length; i++) {
        array[i] = 0;
    }

    int countErrors = 0;

    //name
    if (name == null || name.length() < 4) {
        countErrors++;
        array[1] = 1;
    }

    //surname
    if(surname == null || surname.length() < 4 ) {
        countErrors++;
        array[2] = 1;
    }

	//Validating email address
	String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
	java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
	java.util.regex.Matcher m = p.matcher(email);
    if( !m.matches() ) {				
        countErrors++;
        array[3] = 1;
	}

    //username
    if(username == null || username.length() < 5 ) {
        countErrors++;
        array[4] = 1;
    }
    

    if(password == null || password.length() < 6 ) {
        countErrors++;
        array[5] = 1;
    }

    if(!Rptpassword.equals(password)) {
        countErrors++;
        array[6] = 1;       
    }

    if (terms == null) {
        countErrors++;
        array[7] = 1; 
    }

    array[0] = countErrors;
    return array;
}
%>