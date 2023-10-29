<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="applicationerrors.jsp" %>
<%@ page import="save_lives_2021_2022.*" %>

<%
session.invalidate();
response.sendRedirect("savelives_welcome.jsp");
%>