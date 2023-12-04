<%-- 
    Document   : Dog
    Created on : Dec 1, 2023, 1:04:18 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.details.DogDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    DogDetails dogDetails = (DogDetails) product.getDetails();
%>
<div class="col">
    <div style="padding: 10px 0;font-weight: bold;"><span style="font-size: 20px;">* Giống: <%=dogDetails.getBreed()%></span></div>
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Kích cỡ: <%=dogDetails.ageToString()%></span></div>
    <div style="padding: 10px 0;"></div>
</div>
<div class="col">
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Độ tuổi: <%=dogDetails.sizeToString()%></span></div>
    <div style="padding: 10px 0;font-size: 20px;"></div>
    <div style="padding: 10px 0;"></div>
</div>