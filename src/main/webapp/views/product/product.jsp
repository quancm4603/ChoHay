<%-- 
    Document   : product
    Created on : Nov 27, 2023, 3:00:35 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.details.PhoneDetails"%>
<%@page import="com.chohay.chohay.models.User"%>
<%@page import="com.chohay.chohay.models.Address"%>
<%@page import="com.chohay.chohay.models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    Product product = (Product) request.getAttribute("product");
    Address address = (Address) request.getAttribute("address");
    User shop = (User) request.getAttribute("shop");
    String subCategory1 = null;
    subCategory1 = product.getCategory().equals("Apartment") ? "Bất động sản"
            : (product.getCategory().equals("Phone") ? "Đồ điện tử"
            : (product.getCategory().equals("Dog") ? "Thú cưng" : null));

    String subCategory2 = null;
    subCategory2 = product.getCategory().equals("Apartment") ? "Căn hộ"
            : (product.getCategory().equals("Phone") ? "Điện thoại"
            : (product.getCategory().equals("Dog") ? "Chó" : null));

%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title><%=product.getName()%></title>
        <%@include file="../../views/resources/style.jsp" %>
    </head>

    <body>
        <%@include file="../../views/layout/header.jsp" %>


        <div class="container" style="background: #ffffff;padding-top: 0px;margin-top: 15px;margin-bottom: 15px;">
            <div>
                <div class="col-sm-12" style="margin: 30px;"><a href="#" style="font-weight: bold;text-decoration: none;">
                        <span>Cho hay</span></a>
                    <span style="font-weight: bold;margin: 5px;">
                        <span style="font-weight: normal !important; color: rgb(32, 33, 36);">»</span>
                    </span>
                    <!--layout DONE-->
                    <a href="#" style="text-decoration: none;font-weight: bold;">
                        <span><%=subCategory1%></span>
                    </a>
                    <span style="font-weight: bold;margin: 5px;">
                        <span style="font-weight: normal !important; color: rgb(32, 33, 36);">»</span>
                    </span><a href="#" style="font-weight: bold;text-decoration: none;">
                        <span><%=subCategory2%></span></a>
                    <span style="font-weight: bold;margin: 5px;">
                        <span style="font-weight: normal !important; color: rgb(32, 33, 36);">»</span>
                    </span>
                    <!--layout-->
                    <span style="font-weight: bold;margin: 5px;"><%=product.getName()%></span>
                </div>
            </div>
            <div class="row" style="margin-left: 20px;margin-right: 0px;margin-top: 0px;padding-top: 20px;width: 100%;border: 2px solid var(--bs-orange) ;border-top-color: var(--bs-body-bg);border-right-color: var(--bs-body-bg);border-bottom-color: var(--bs-body-bg);border-left-color: var(--bs-body-bg);">
                <div class="col-md-8 col-xl-6 col-xxl-6" style="width: 65%;color: var(--bs-emphasis-color);min-width: 300px;">
                    <div style="width: 100%;flex-direction: column;">
                        <div style="position: relative;">
                            <div style="width: 100%;padding-bottom: 100%;position: relative;height: 397.1px;width: 100%;padding-bottom: 100%;position: relative;display: block;height: 0;padding-bottom: 90%;position: relative;overflow: hidden;">
                                <picture style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
                                    <img style="display: block; object-fit: contain; object-position: center; width: 100%; height: 100%; max-width: 100%;" src="<%=product.getImage()%>" alt="Product Image">
                                </picture>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h3 class="my-3" style="font-size: 30px;"><%=product.getName()%></h3>
                        <p style="font-weight: bold;color: rgb(0,0,0);font-size: 25px;">đ <%=product.getPriceToString()%></p>
                        <div style="margin: 50px 0 0 0;width: 100%;">
                            <h2 style="font-weight: bold;font-size: 25px;">Chi tiết sản phẩm</h2>
                            <p style="color: rgb(0,0,0);font-size: 18px;"><%=product.getDescription()%></p>
                        </div>
                    </div>
                    <div class="row">

                        <%
                            if(product.getCategory().equals("Phone")){
                        %>
                        <!--layout-->
                        <%@include file="details/Phone.jsp" %>
                        <%
                            } else if(product.getCategory().equals("Apartment")){
                        %>
                        <!--layout-->
                        <%@include file="details/Apartment.jsp" %>
                        
                        <%
                            } else if(product.getCategory().equals("Dog")){
                        %>
                        <!--layout-->
                        <%@include file="details/Dog.jsp" %>
                        
                        <%
                            } 
                        %>
                        
                    </div>
                    <div style="padding: 10px 0;text-align: center;font-size: 25px;">
                        <div style="text-align: left;"><span style="font-size: 20px;font-weight: bold;border-top-style: none;border-bottom-style: solid;">Địa chỉ&nbsp;</span></div>
                        <div style="text-align: left;"><span style="font-size: 20px;padding: 5px 0;font-weight: bold;border-top: 1px none var(--bs-orange);text-align: left;"><%=address.getProvince()%>, <%=address.getCity()%>, <%=address.getDistrict()%>, <%=address.getStreet()%> </span></div>
                    </div>
                </div>
                <!--shop details-->
                <div class="col" style="width: 35%;color: var(--bs-emphasis-color);background: var(--bs-body-bg);min-width: 200px;border: 1px none var(--bs-body-bg) ;border-left: 1px solid var(--bs-body-bg) ;">
                    <div>
                        <div class="row">
                            <div class="col-md-5 col-lg-6" style="padding: 5px 0 0 0;display: flex;width: 100%;height: 80.1px;">
                                <span style="box-sizing: border-box;display: block;width: 25%;height: initial;background: none;opacity: 1;border: 0px;margin: 0px;padding: 0px;max-width: 100%;">
                                    <img src="<%=shop.getAvatar()%>" style="border-radius: 50%;display: block;max-width: 100%;width: initial;height: initial;background: none;opacity: 1;border: 0px;padding: 0px;">
                                </span>
                                <div style="width: 100%;display: flex;"><span style="font-size: 19px;font-weight: bold;margin: 0px;"><%=shop.getFullName()%></span>
                                    <form action="./shop" method="post">
                                        <input name="shopId" value="<%=shop.getId()%>" type="hidden">
                                        <button class="btn btn-primary" type="submit" style="border-radius: 4px;background-color: #fff;color: #000;border: 1px solid silver;min-width: 96px!important;height: 24px!important;font-size: 15px!important;line-height: 12px;display: flex!important;justify-content: center;align-items: center;text-align: right;margin: 0 0 0 80px;">Xem trang</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding: 15px 0 0 0;">
                            <div class="col" style="width: 50%;">
                                <div style="text-align: center;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-star-fill" style="color: var(--bs-orange);">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                                    </svg><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-star-fill" style="color: var(--bs-orange);">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                                    </svg><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-star-fill" style="color: var(--bs-orange);">
                                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
                                    </svg><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-star-half" style="color: var(--bs-orange);">
                                    <path d="M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z"></path>
                                    </svg><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-star" style="color: var(--bs-orange);">
                                    <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"></path>
                                    </svg></div>
                                <div style="width: 100%;">
                                    <p style="text-align: center;">2 đánh giá</p>
                                </div>
                            </div>
                            <div class="col" style="width: 50%;border-left-style: solid;border-left-color: var(--bs-body-bg);">
                                <p style="font-size: 16px;text-align: center;font-weight: bold;">Phản hổi chat</p>
                                <p style="text-align: center;margin-bottom: 0px;">70%</p>
                            </div>
                        </div>
                        <div></div>
                    </div>
                    <div style="margin: 20px;">
                        <a href="./create-order?id=<%=product.getId()%>">
                        <button class="btn btn-primary" type="button" style="width: 100%;color: var(--bs-btn-active-color);background: #2e9f55;font-weight: bold;height: 70px;border-radius: 4px;">Mua ngay</button>
                        </a>
                        <button class="btn btn-primary" type="button" style="width: 100%;color: var(--bs-btn-active-color);background: #2e9f55;font-weight: bold;height: 70px;border-radius: 4px;margin: 10px 0;"><%=shop.getPhone()%></button>
                        <button class="btn btn-primary" type="button" style="width: 100%;background: var(--bs-btn-disabled-color);color: var(--bs-btn-border-color);font-weight: bold;height: 70px;border: 2px solid var(--bs-success);font-size: 80%;border-radius: 4px;margin: 10px 0;">Chat với người bán</button>
                    </div>
                </div>
                <!--end shop details-->
            </div>
        </div>
        <!--bodyhere-->
        <%@include file="../../views/layout/footer.jsp" %>
        <%@include file="../../views/resources/script.jsp" %>
    </body>

</html>