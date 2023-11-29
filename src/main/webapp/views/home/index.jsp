<%-- 
    Document   : index
    Created on : Nov 10, 2023, 7:16:42 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            <div class="container containerhome">
                <div class="row">
                    <div class="col" style="background: #ffffff;padding-right: 0px;padding-left: 0px;">
                        <p style="margin-bottom: 8px;font-size: 17px;color: rgb(0,0,0);font-weight: bold;margin-top: 8px;margin-left: 15px;">Khám phá danh mục</p>
                    </div>
                    <div class="col-12 col-xxl-12" style="padding-left: 0px;padding-right: 0px;">
                        <div class="list-group list-group-horizontal">
                            <button class="list-group-item list-group-item-action" style="width: 13%; padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="https://lh3.googleusercontent.com/pw/ADCreHdLQ2j4wxUEEVOttkin8d3uucDMssJTqQL3gRA2Mzg4k3ba9lfuV2yvMvOJs5uwWGKU3fLfQpIOtxOxVpQwDfdc9EupS4sqfDobVYkbvKIb1K1Xsc6gRJq6hTplHiN0gj7P9MAWR1gQesnD_EwJCJQ=w452-h452-s-no-gm" style="margin-top: 10px;"><span class="titlemucluc">Bất động sản</span></button>
                            <button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/dodientu.jpg" style="margin-top: 10px;"><span class="titlemucluc">Đồ điện tử</span></button>
                            <button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/thucung.jpg" style="margin-top: 10px;"><span class="titlemucluc">Thú cưng</span></button>
                            <button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/xeco.jpg" style="margin-top: 10px;"><span class="titlemucluc">Xe cộ</span></button>
                            <button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/do-gia-dung-1.jpg" style="margin-top: 10px;"><span class="titlemucluc" style="margin-bottom: 8px;">Đồ da dụng, nội thất, cây cảnh</span></button>
                            <button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/giaitri.jpg" style="margin-top: 10px;"><span class="titlemucluc">Giải trí, thể thao, sở thích</span></button>
                            <button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/mevabe.jpg" style="margin-top: 10px;"><span class="titlemucluc">Mẹ và bé</span></button>
                        </div>
                    </div>
                    <div class="col-12 col-xxl-12" style="padding: 0px;">
                        <div class="list-group list-group-horizontal"><button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/dichvu.png" style="margin-top: 10px;"><span class="titlemucluc">Dịch vụ, du lịch</span></button><button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/vieclam.jpg" style="margin-top: 10px;"><span class="titlemucluc">Việc làm</span></button><button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/doan.jpg" style="margin-top: 10px;"><span class="titlemucluc">Đồ ăn, thực phẩm và các loại khác</span></button><button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/tulanh.jpg" style="margin-top: 10px;"><span class="titlemucluc">Tủ lạnh, máy lạnh, máy giặt</span></button><button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/thoitrang.jpg" style="margin-top: 10px;"><span class="titlemucluc" style="margin-bottom: 8px;">Thời trang, đồ dùng cá nhân</span></button><button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/dodungvanphong.png" style="margin-top: 10px;"><span class="titlemucluc">Đồ dùng văn phòng, công nồng nghiệp</span></button><button class="list-group-item list-group-item-action" style="padding: 0px;transition: 200ms;border-width: 0px;"><img class="img-fluid" src="assets/img/chotang.jpg" style="margin-top: 10px;"><span class="titlemucluc">Cho tặng miễn phí</span></button></div>
                    </div>
                </div>
            </div>
            <div class="container containerhome">
                <div class="row" style="padding: 7px;padding-bottom: 0px;">
                    <div class="col" style="background: #ffffff;padding: 0px;">
                        <p style="margin-bottom: 8px;font-size: 17px;color: rgb(0,0,0);font-weight: bold;margin-top: 8px;margin-left: 15px;">Tin đăng dành cho bạn</p>
                    </div>
                </div>
                <div class="row" style="padding-top: 0px;padding-bottom: 7px;padding-right: 7px;padding-left: 7px;">
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6 col-lg-3 col-xl-3 col-xxl-3 formhome" style="background:#ffffff;padding:12px;transition:200ms;">
                        <div class="titlehome">
                            <div class="adthumnail"><img class="imghome" src="assets/img/poodle.jpg"></div>
                            <div><a class="texthome" href="dog.html">Poodel trắng tinh khôi</a>
                                <div><span class="pricehome">3.000.000 đ</span></div>
                            </div>
                            <div class="AdBody_footer__78mtV"><a rel="noopener noreferrer" target="_blank"><img class="commonStyle_image__2y3kd commonStyle_round__3k7wj" height="16" width="16" src="https://static.chotot.com/storage/chotot-icons/svg/user.svg" alt="Tony Tèo"></a>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div>
                                <div class="AdBody_adItemPostedTime__Oj7pr"><span class="AdBody_text__vR5s0">12 giờ trước</span></div>
                                <div class="commonStyle_deviderWrapper__3FHXZ" style="margin-right:5px;"></div><span class="AdBody_adItemPostedTime__Oj7pr AdBody_location__ujScT"><span class="AdBody_text__vR5s0">Đồng Nai</span></span>
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