<%-- 
    Document   : header
    Created on : Nov 10, 2023, 7:34:01 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<header style="width: 100%">
    <nav class="navbar navbar-expand-lg bg-light d-xxl-flex justify-content-xxl-center align-items-xxl-center" style="padding-top: 15px;padding-bottom: 15px;">
        <div class="container-fluid"><a class="navbar-brand d-xxl-flex justify-content-xxl-center align-items-xxl-center" href="./" style="font-weight: bold;font-size: 24px;">chohay</a><button data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">Danh mục</a>
                        <div class="dropdown-menu"><a class="dropdown-item" href="./search?category=Apartment">Căn hộ</a><a class="dropdown-item" href="./search?category=Phone">Điện thoại</a><a class="dropdown-item" href="./search?category=Dog">Chó</a></div>
                    </li>
                </ul>
                <form class="d-flex mx-auto" method="get" action="./search" role="search" style="width: 100%;"><input class="form-control me-2" type="search" aria-label="Search" name="keyword" placeholder="Tìm kiếm sản phẩm trên Chợ Hay" style="padding:5px 24px;"><button class="btn btn-outline-primary d-xxl-flex justify-content-xxl-center align-items-xxl-center" type="submit" id="button-addon-1" style="padding-top:4px;padding-bottom:4px;border-width:1px;padding-right:16px;padding-left:16px;"><svg class="bi bi-search" xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewbox="0 0 16 16" style="font-size:24px;"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path></svg></button></form>
                <ul class="navbar-nav d-lg-flex ms-auto justify-content-lg-center align-items-lg-center mb-2 mb-lg-0">
                    <li class="nav-item d-xl-flex justify-content-xl-center align-items-xl-center bag" style="padding: 3px;">
                        <div class="nav-item dropdown d-lg-flex d-xxl-flex justify-content-lg-center align-items-lg-center justify-content-xxl-center align-items-xxl-center" style="margin-right: 0px;width: 100%;height: 100%;"><a class="d-xl-flex justify-content-xl-center align-items-xl-center" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="icon ion-bag d-lg-flex d-xl-flex d-xxl-flex justify-content-lg-center align-items-lg-center justify-content-xl-center align-items-xl-center justify-content-xxl-center align-items-xxl-center bi-bag"></i></a>
                            <div class="dropdown-menu"><a class="dropdown-item" href="./order-status">Đơn mua</a><a class="dropdown-item" href="./sell-status">Đơn bán</a></div>
                        </div>
                    </li>
                    <li class="nav-item d-flex justify-content-xxl-center align-items-xxl-center quanlytin" style="width: 100%;height: 100%;padding: 5px;"><a class="nav-link d-lg-flex d-xxl-flex justify-content-lg-center align-items-lg-center justify-content-xxl-center align-items-xxl-center" href="./product-manager" style="padding: 0px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-layout-text-window-reverse icoquanly">
                                <path d="M13 6.5a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm0 3a.5.5 0 0 0-.5-.5h-5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5zm-.5 2.5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1h5z"></path>
                                <path d="M14 0a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12zM2 1a1 1 0 0 0-1 1v1h14V2a1 1 0 0 0-1-1H2zM1 4v10a1 1 0 0 0 1 1h2V4H1zm4 0v11h9a1 1 0 0 0 1-1V4H5z"></path>
                            </svg><span class="text-capitalize spanquanly" style="line-height: 15px;">quản lý tin</span></a></li>
                    
                    <%
                        if (session != null && session.getAttribute("user") != null) {
                            User user = ((User)session.getAttribute("user"));
                    %>
                    <li class="nav-item d-flex justify-content-xxl-center align-items-xxl-center quanlytin" style="width: 100%;height: 100%;padding: 5px;">
                        <a class="nav-link d-lg-flex d-xxl-flex justify-content-lg-center align-items-lg-center justify-content-xxl-center align-items-xxl-center" href="./user" style="padding: 0px;"><img class="rounded-circle" style="width: 24px;height: 24px;" src="<%=user.getAvatar()%>"><span class="text-capitalize spanquanly" style="line-height: 15px;overflow: hidden;width: 16vh;text-overflow: ellipsis;"><%=user.getFullName()%></span></a>
                    </li>
                        <li class="nav-item d-lg-flex d-xxl-flex justify-content-lg-center align-items-lg-center align-items-xxl-center"><a class="btn btn-outline-primary" role="button" href="./create-product" style="padding-top: 10px;padding-bottom: 10px;width: 143px;/*margin-bottom: 0px;*//*margin-top: 0px;*/">đăng tin</a></li>
                        <li class="nav-item d-lg-flex d-xxl-flex justify-content-lg-center align-items-lg-center align-items-xxl-center"><a class="btn btn-primary" role="button" href="./logout" style="width: 143px;">đăng xuất</a></li>
                    <%
                    } else {
                    %>
                        <li class="nav-item d-lg-flex d-xxl-flex justify-content-lg-center align-items-lg-center align-items-xxl-center"><a class="btn btn-outline-primary" role="button" href="./create-product" style="padding-top: 10px;padding-bottom: 10px;width: 143px;/*margin-bottom: 0px;*//*margin-top: 0px;*/">đăng tin</a></li>
                        <li class="nav-item d-lg-flex d-xxl-flex justify-content-lg-center align-items-lg-center align-items-xxl-center"><a class="btn btn-primary" role="button" href="./login" style="width: 143px;">đăng nhập</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>
</header>
