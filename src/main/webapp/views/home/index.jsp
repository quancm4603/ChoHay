<%-- 
    Document   : index
    Created on : Nov 10, 2023, 7:16:42 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>ChoHay</title>
        <%@include file="../resources/style.jsp" %>
    </head>

    <body>
        <%@include file="../layout/header.jsp" %>
        <!--bodyhere-->

        <div style="margin-top: 10px;margin-bottom: 10px;">
            <!--category bar-->
            <%@include file="category.jsp" %>
            <!--category bar end-->

            <div class="container containerhome">
                <div class="row" style="padding: 7px;padding-bottom: 0px;">
                    <div class="col" style="background: #ffffff;padding: 0px;">
                        <p style="margin-bottom: 8px;font-size: 17px;color: rgb(0,0,0);font-weight: bold;margin-top: 8px;margin-left: 15px;">Tin đăng dành cho bạn</p>
                    </div>
                </div>
                <div class="row" style="padding-top: 0px;padding-bottom: 7px;padding-right: 7px;padding-left: 7px;">
                    <%                        if (products != null) {
                            for (Product product : products) {
                    %>           

                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail">
                                <!-- Thêm class 'imghome' cho việc quản lý hình ảnh -->
                                <img class="imghome" src="<%=product.getImage()%>" style="width: 100%;  height: 200px; object-fit: cover;">
                                <!-- Đặt chiều rộng cố định là 100% của container -->
                            </div>
                            <div>
                                <a class="texthome" href="./product?id=<%=product.getId()%>" style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; max-width: 100%;"><%=product.getName()%></a>
                                <div><span class="pricehome"><%=product.getPriceToString()%> đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV">
                                <a rel="noopener noreferrer" target="_blank">
                                    <img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="<%=product.getUsername()%>">
                                </a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0"><%=product.getTimeDifference()%></span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0"><%=product.getAddress()%></span></span>
                            </div>
                        </div>
                    </div>


                    <%
                            }
                        }
                    %>

                </div>
            </div>
        </div>

        <!--bodyhere end-->
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../resources/script.jsp" %>

    </body>

</html>
