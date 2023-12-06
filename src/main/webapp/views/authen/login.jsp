<%-- Document : login Created on : Nov 15, 2023, 4:35:50 PM Author : caomi --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Đăng nhập vào Chợ Hay</title>
        <%@include file="../resources/style.jsp" %>
    </head>

    <body>
        <%@include file="../layout/header.jsp" %>
        <section class="position-relative py-4 py-xl-5" style="height: auto;">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h2 style="font-weight: bold;font-size: 26px;">Đăng nhập</h2>
                    <p class="w-lg-50">Vui lòng đăng nhập trước khi đăng tin.</p>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-12 col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-5 offset-0 offset-xl-0">
                    <div class="card mb-5">
                        <div class="card-body d-flex flex-column align-items-center" style="box-shadow: 0px 0px 10px;">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"></path>
                                </svg></div>
                            <form class="text-center form-register" method="post">
                                <div class="mb-3" style="width: 100%;">
                                    <input name="username" class="form-control" type="text" placeholder="Email hoặc Tên đăng nhập" required="" style="width: 100%;">
                                </div>
                                <div class="text-start mb-3" style="width:100%;">
                                    <input name="password" class="form-control form-control form-control" type="password" id="password" placeholder="Mật khẩu" required="" style="width:100%;">
                                </div>
                                <input name="remember" id="remember" type="checkbox" style="margin-top: 5px;"/>
                                <label class="form-label form-label" for="remember" style="margin-top:5px;margin-left:3px;">Ghi nhớ đăng nhập</label>
                                <div class="mb-3" style="width: 100%;"><button class="btn btn-primary d-block w-100" type="submit">đăng nhập</button></div>
                                <p class="text-muted ctk-login" style="text-align: left;color: #55595c;width: 100%;">Chưa có tài khoản?&nbsp;<a style="color: rgba(26,26,26,0.58);font-weight: bold;" href="./register">Đăng ký tài khoản mới</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../resources/script.jsp" %>
    </body>

</html>