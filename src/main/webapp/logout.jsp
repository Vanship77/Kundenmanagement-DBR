<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%
    request.getSession().invalidate(); // Invalidar la sesión
    response.sendRedirect("login.html"); // Redirigir al login
%>