<%-- 
    Document   : header
    Created on : Nov 10, 2023, 7:34:01 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-md bg-body">
    <div class="container-fluid"><a class="navbar-brand" href="#">Chohay</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav me-auto" style="padding-right: 0px;margin-right: 0px;width: 261.967px;min-width: 100px;">
                <li class="nav-item"></li>
                <li class="nav-item"></li>
                <li class="nav-item"></li>
                <li class="nav-item dropdown" data-aos=""><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">Danh Mục</a>
                    <div class="dropdown-menu dropdown-menu-start"><a class="dropdown-item" href="#">Bất động sản</a><a class="dropdown-item" href="#">Xe cộ</a><a class="dropdown-item" href="#">Đồ điện tử</a></div>
                </li>
                <li class="nav-item"></li>
            </ul>
            <div>
                <form action="./search" method="get">
                <input type="text" placeholder="Tìm kiếm sản phẩm...">
                <input class="btn btn-secondary" type="submit">
                </form>
            </div>
            <a class="btn btn-primary ms-auto" role="button" href="./create-product">Đăng tin</a>
            <a class="btn btn-primary ms-auto" role="button" href="./login" style="margin-right: 32px;">Đăng nhập</a>
        </div>
    </div>
</nav>