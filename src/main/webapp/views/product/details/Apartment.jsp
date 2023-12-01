<%-- 
    Document   : Apartment
    Created on : Dec 1, 2023, 12:46:44 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.details.ApartmentDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    ApartmentDetails apartmentDetails = (ApartmentDetails) product.getDetails();
%>
<div class="col">
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">*&nbsp;Loại hình căn hộ: <%=apartmentDetails.getType()%></span></div>
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Số phòng ngủ: <%=apartmentDetails.getBedroom()%> phòng</span></div>
    <div style="padding: 10px 0;font-size: 20px;"><span style="font-weight: bold;">* Số phòng vệ sinh: <%=apartmentDetails.getBathroom()%> phòng</span></div>
    <div style="padding: 10px 0;"></div>
</div>
<div class="col">
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Diện tích: <%=apartmentDetails.getArea()%> m²</span></div>
    <div style="padding: 10px 0;font-size: 20px;"><span style="font-weight: bold;">* Nội thất: <%=apartmentDetails.getFuniture()%></span></div>
    <div style="padding: 10px 0;font-size: 20px;"><span style="font-weight: bold;">* Pháp lý: <%=apartmentDetails.getLegalDocuments()%></span></div>
    <div style="padding: 10px 0;"></div>
</div>