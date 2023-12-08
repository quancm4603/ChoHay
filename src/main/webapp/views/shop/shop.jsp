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
    User shop = (User) request.getAttribute("shopProfile");
    List<Product> shopProducts = (List<Product>) request.getAttribute("shopProducts");
    List<Product> soldProducts = (List<Product>) request.getAttribute("soldProducts");
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Trang cá nhân của <%=shop.getFullName()%></title>
        <%@include file="../resources/style.jsp" %>
    </head>


    <body style=" background-color: #f2f2f2;">

        <%@include file="../layout/header.jsp" %>
        <!--bodyhere-->


        <div style="margin-top: 10px;margin-bottom: 10px;">
            <div class="container containerhome">
                <div class="row" style="margin: 0px;padding: 0px;">
                    <div class="col" style="padding: 0px;">
                        <ul class="list-inline duongdan">
                            <li class="list-inline-item"><a href="./" style="color: #306bd9;font-size: 14px;">Chợ hay</a><span style="letter-spacing: -7px;">ㅤ&gt;ㅤ</span></li>
                            <li class="list-inline-item"><span style="font-size: 14px;">Trang cá nhân của <%=shop.getFullName()%></span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container justify-content-center justify-content-xxl-center containerhome">
                <div class="row" style="width: 100%;margin: 0px;padding: 0px;">
                    <div class="col-12 col-lg-4 col-xl-4 col-xxl-4" style="background: #ffffff;padding-top: 12px;padding-bottom: 12px;margin-right: 0px;margin-left: 0px;">
                        <div style="background: #ffffff;position: relative;">
                            <div>
                                <img style="object-fit:cover;margin:0px;margin-left:0px;margin-right:0px;height:125px;width:100%;" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/385538324_1390932391824938_2390860457593034056_n.jpg?_nc_cat=111&amp;ccb=1-7&amp;_nc_sid=510075&amp;_nc_ohc=k4-9NZC-k4YAX-wAh2p&amp;_nc_ad=z-m&amp;_nc_cid=0&amp;_nc_ht=scontent.xx&amp;oh=03_AdT9Dvjiz9zsw0kzGoOvDZFoeYLoJe485o2YX5-5ylHjWw&amp;oe=6597A63A" width="288" height="125">
                            </div>
                            <div style="position: absolute;right: 0;left: 16px;bottom: -48px;"><img style="width: 96px;height: 96px;object-fit: cover;border-radius: 50%;" src="<%=shop.getAvatar()%>"></div>
                        </div>
                        <div style="margin-top: 60px;">
                            <h2 class="text-capitalize" style="font-size:18px;margin-bottom:0px;margin-top:5px;font-weight:bold;"><%=shop.getFullName()%></h2><span style="font-size:14px;color:rgb(0,0,0);">Chưa có đánh giá</span>
                            <div class="d-flex d-xl-flex align-items-center align-items-xl-center" style="margin-top:3px;margin-bottom:3px;"><i class="material-icons" style="font-size:20px;">phone_iphone</i><span style="margin-left:0px;font-size:14px;color:rgb(0,0,0);">&nbsp;<%=shop.getPhone()%></span></div>
                            <div class="d-flex d-xl-flex align-items-center align-items-xl-center" style="margin-bottom:3px;"><i class="material-icons" style="font-size:20px;">location_on</i><span style="font-size:14px;color:rgb(0,0,0);">&nbsp;Địa chỉ:&nbsp;</span><span style="font-size:14px;color:rgb(0,0,0);"><%=shop.getAddress()%></span></div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-8" style="padding: 12px;background: #ffffff;margin-left: 0px;">
                        <div class="align-items-xxl-center">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-1">Đang hiển thị&nbsp;<span>(<%=shopProducts.size()%>)</span></a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-2">Đã bán&nbsp;<span>(<%=soldProducts.size()%>)</span></a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab-1">
                                    <div class="row">
                                        <%                        if (shopProducts != null) {
                                                for (Product product : shopProducts) {
                                                    if (product.getStatus() == 0) {
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
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab-2">
                                    <div class="row">
                                        <%                        if (soldProducts != null) {
                                                for (Product product : soldProducts) {
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
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--bodyhere end-->
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../resources/script.jsp" %>

    </body>

</html>
