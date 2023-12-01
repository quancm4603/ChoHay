<%-- 
    Document   : Phone
    Created on : Dec 1, 2023, 12:46:56 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.details.PhoneDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    PhoneDetails phoneDetails = (PhoneDetails) product.getDetails();
%>
<div class="col">
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Tình trạng: <%=phoneDetails.getStatus()%></span></div>
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Màu sắc: <%=phoneDetails.getColor()%></span></div>
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Chính sách bảo hành: <%=phoneDetails.getGuarantee()%></span></div>
</div>
<div class="col">
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Hãng: <%=phoneDetails.getBrand()%></span></div>
    <div style="padding: 10px 0;font-size: 20px;"><span style="font-weight: bold;">* Dung lượng: <%=phoneDetails.getMemory()%></span></div>
    <div style="padding: 10px 0;"><span style="font-size: 20px;font-weight: bold;">* Xuất xứ: <%=phoneDetails.getOriginal()%></span></div>
</div>