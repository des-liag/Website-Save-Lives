<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="applicationerrors.jsp" %>
<%@ page import="save_lives_2021_2022.*" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserDAO userdao = new UserDAO();

    try {
        User user = userdao.checkLoginParam(username, password);

        session.setAttribute("userObj", user);

        String site = new String("http://ism.dmst.aueb.gr/ismgroup48/savelives/main_menu.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
%>

<%
    } catch(Exception e) {
        request.setAttribute("message", e.getMessage());
%>
<jsp:forward page="savelives_welcome.jsp" />
<%
    }
%>
