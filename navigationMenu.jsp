<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="navbar-wrapper" >
    <div class="container">

    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                </button>
                <% if (session.getAttribute("userObj") != null) { %>
                    <a class="navbar-brand" href="main_menu.jsp">Save Lives</a>
                <% } else { %>
                    <a class="navbar-brand" href="savelives_welcome.jsp">Save Lives</a> 
                <% } %>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                <li><a href="about_us.jsp">Σχετικά με εμάς</a></li>
                <li><a href="aed_page.jsp"> Απινιδωτές</a></li>
                <li><a href="learn.jsp"> Α' Βοήθειες</a></li>
                </ul>

            
