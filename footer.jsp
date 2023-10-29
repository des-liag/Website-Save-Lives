<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<br>
<br>
<hr>
<footer class="container-fluid text-center">
    <div class="container">
        <% if (!request.getRequestURI().contains("controller") & !request.getRequestURI().contains("applicationerrors")) { %>
            <a href="<%=request.getRequestURI()%>" title="To Top">
                <span class="glyphicon glyphicon-chevron-up" style="color: black;"></span>
            </a>
        <% } %>

        <div class="row">
            <div class="col-xs-12">
                <p class="text-center">&copy; Copyright 2021 by ismgroup48</p>
            </div>
        </div>
    </div>
</footer>