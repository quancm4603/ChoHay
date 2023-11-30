<%-- 
    Document   : header
    Created on : Nov 10, 2023, 7:34:01 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<header style="width: 100vw;">
    <nav class="navbar navbar-expand-md bg-body">
        <div class="container-fluid">
            <a class="navbar-brand" href="./" style="width: 10%;font-weight: bold;font-size: 23px;text-align: center;">cho hay</a>
            <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav me-auto" style="padding-right: 0px;margin-right: 0px;width: 20%;min-width: 100px;">
                    <li class="nav-item dropdown">
                        <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#" style="width: auto;">Danh mục</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Căn hộ</a>
                            <a class="dropdown-item" href="#">Điện thoại</a>
                            <a class="dropdown-item" href="#">Chó</a>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav" style="width: 50%;">
                    <li class="nav-item" style="width: 100%;">
                        <form method="get" action="./search" class="input-group me-auto mb-3" style="margin: 0px;width: 100%;height: 30px;">
                            <input name="keyword" class="form-control form-control" required="" type="text" placeholder="Tìm kiếm sản phẩm trên Chợ Hay" aria-label="Search" aria-describedby="button-addon2" style="height: 35px;color: rgb(0,0,0);border-width: 1px;border-color: rgba(0,0,0,0.35);width: 60%;">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon-1" style="height: 35px;padding: 4px 24px;border-style: solid;backdrop-filter: opacity(1);width: 30%;">Tìm kiếm</button>
                        </form>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto" style="width: 30%;margin-left: -7.4219px;height: 100%;">
                    <%
                        if (session != null && session.getAttribute("user") != null) {
                    %>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="btn btn-outline-primary" role="button" href="./create-product" style="padding-top: 10px;padding-bottom: 10px;width: 143px;/*margin-bottom: 0px;*//*margin-top: 0px;*/">đăng tin</a></li>
                        <li class="nav-item"><a class="btn btn-primary" role="button" href="./logout" style="width: 143px;">đăng xuất</a></li>
                    </ul>
                    <%
                    } else {
                    %>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="btn btn-outline-primary" role="button" href="./create-product" style="padding-top: 10px;padding-bottom: 10px;width: 143px;/*margin-bottom: 0px;*//*margin-top: 0px;*/">đăng tin</a></li>
                        <li class="nav-item"><a class="btn btn-primary" role="button" href="./login" style="width: 143px;">đăng nhập</a></li>
                    </ul>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>
</header>