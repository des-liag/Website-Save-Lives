<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
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

            </div>
            </div>
        </nav>
        </div>
        </div>

        <div class="container">
            <div class="page-header">
                <h1>ΚΑΤΙ ΠΗΓΕ ΣΤΡΑΒΑ</h1>
            </div>
    
            <div class="row">
    
                <div class="col-xs-12">
    
                    <h2>Περιγραφή:</h2>
    
                    <% if(exception != null) { %>	                  	
                        <p><code><%=exception %></code></p>						
                    <% } %>		
    
                </div>
    
            </div>        
    
        </div>
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
          <%@ include file="footer.jsp" %>

    </body>
</html>