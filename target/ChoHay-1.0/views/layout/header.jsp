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
                        <div class="input-group me-auto mb-3" style="margin: 0px;width: 100%;height: 30px;"><input class="form-control form-control" type="text" placeholder="Tìm kiếm sản phẩm trên Chợ Hay" aria-label="Search" aria-describedby="button-addon2" style="height: 35px;color: rgb(0,0,0);border-width: 1px;border-color: rgba(0,0,0,0.35);width: 60%;"><button class="btn btn-outline-secondary" type="button" id="button-addon-1" style="height: 35px;padding: 4px 24px;border-style: solid;backdrop-filter: opacity(1);width: 30%;">Tìm kiếm</button></div>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto" style="width: 30%;margin-left: -7.4219px;height: 100%;">
                    <%
                        if (session != null && session.getAttribute("user") != null) {
                    %>
                    <li class="nav-item" style="width: 45%;height: 100%;margin-right: 0px;">
                        <a class="btn btn-dark text-center" role="button" style="padding: 0;padding-top: 10px;padding-bottom: 10px;border-width: 1px;height: 100%;width: 100%;margin: 0px;font-size: 14px;line-height: 20px;letter-spacing: 1px;" href="./create-product">Đăng tin</a>
                    </li>
                    <li class="nav-item" style="width: 45%;height: 100%;">
                        <a class="btn btn-dark text-center" role="button" style="padding: 0;padding-top: 10px;padding-bottom: 10px;border-width: 1px;height: 100%;width: 100%;margin: 0px;font-size: 14px;line-height: 20px;letter-spacing: 1px;" href="./logout">Đăng xuất</a>
                    </li>
                    <%
                    } else {
                    %>
                    <li class="nav-item" style="width: 45%;height: 100%;margin-right: 0px;">
                        <a class="btn btn-dark text-center" role="button" style="padding: 0;padding-top: 10px;padding-bottom: 10px;border-width: 1px;height: 100%;width: 100%;margin: 0px;font-size: 14px;line-height: 20px;letter-spacing: 1px;" href="./create-product">Đăng tin</a>
                    </li>
                    <li class="nav-item" style="width: 45%;height: 100%;">
                        <a class="btn btn-dark text-center" role="button" style="padding: 0;padding-top: 10px;padding-bottom: 10px;border-width: 1px;height: 100%;width: 100%;margin: 0px;font-size: 14px;line-height: 20px;letter-spacing: 1px;" href="./login">Đăng nhập</a>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>
</header>