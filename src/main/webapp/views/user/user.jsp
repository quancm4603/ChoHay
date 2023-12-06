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
    User shop = (User) request.getAttribute("shop");
    List<Product> shopProducts = (List<Product>) request.getAttribute("shopProducts");
    List<Product> soldProducts = (List<Product>) request.getAttribute("soldProducts");
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Xem trang cá nhân</title>
        <%@include file="../resources/style.jsp" %>
    </head>


    <body>

        <%@include file="../layout/header.jsp" %>
        <!--bodyhere-->


        <div style="margin-top: 10px;margin-bottom: 10px;">
            <div class="container containerhome">
                <div class="row" style="margin: 0px;padding: 0px;">
                    <div class="col" style="padding: 0px;">
                        <ul class="list-inline duongdan">
                            <li class="list-inline-item"><a href="./" style="color: #306bd9;font-size: 14px;">Chợ
                                    hay</a><span style="letter-spacing: -7px;">ㅤ&gt;ㅤ</span></li>
                            <li class="list-inline-item"><span style="font-size: 14px;"><%=shop.getFullName()%></span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container justify-content-center justify-content-xxl-center containerhome">
                <div class="row" style="width: 100%;margin: 0px;padding: 0px;">
                    <div class="col-12 col-lg-4 col-xl-4 col-xxl-4"
                         style="background: #ffffff;padding-top: 12px;padding-bottom: 12px;margin-right: 0px;margin-left: 0px;">
                        <div style="background: #ffffff;position: relative;">
                            <div>
                                <img style="object-fit:cover;margin:0px;margin-left:0px;margin-right:0px;height:125px;width:100%;"
                                     src="https://scontent.xx.fbcdn.net/v/t1.15752-9/385538324_1390932391824938_2390860457593034056_n.jpg?_nc_cat=111&amp;ccb=1-7&amp;_nc_sid=510075&amp;_nc_ohc=k4-9NZC-k4YAX-wAh2p&amp;_nc_ad=z-m&amp;_nc_cid=0&amp;_nc_ht=scontent.xx&amp;oh=03_AdT9Dvjiz9zsw0kzGoOvDZFoeYLoJe485o2YX5-5ylHjWw&amp;oe=6597A63A"
                                     width="288" height="125">
                            </div>
                            <div style="position: absolute;right: 0;left: 16px;bottom: -48px;"><img
                                    style="width: 96px;height: 96px;object-fit: cover;border-radius: 50%;"
                                    src="<%=shop.getAvatar()%>">
                                <form action="./change-avatar" method="post" enctype="multipart/form-data">
                                    <input name="avatar" type="file" hidden="" accept="image/*" id="avatar">
                                    <label class="form-label" for="avatar" style="position: absolute;left: 68px;bottom: 0;background: white;border-radius: 50%;padding: 4px;display: flex;align-items: center;justify-content: center;margin-bottom: 0;box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.05);cursor: pointer;"><i
                                            class="material-icons">camera_alt</i>
                                    </label>
                                    <button type="submit" id="submitButton" class="btn btn-primary position-relative" style="display: none;">Dùng ảnh này</button>
                                </form>
                            </div>
                        </div>
                        <div style="margin-top: 60px;">
                            <h2 class="text-capitalize"
                                style="font-size:18px;margin-bottom:0px;margin-top:5px;font-weight:bold;"><%=shop.getFullName()%></h2><span style="font-size:14px;color:rgb(0,0,0);">Chưa có đánh giá</span>
                            <div class="d-flex d-xl-flex align-items-center align-items-xl-center"
                                 style="margin-top:3px;margin-bottom:3px;"><i class="material-icons"
                                                                         style="font-size:20px;">phone_iphone</i><span
                                                                         style="margin-left:0px;font-size:14px;color:rgb(0,0,0);">&nbsp;<%=shop.getPhone()%></span></div>
                            <div class="d-flex d-xl-flex align-items-center align-items-xl-center" style="margin-bottom:3px;">
                                <i class="material-icons" style="font-size:20px;">location_on</i>
                                <span style="font-size:14px;color:rgb(0,0,0);">&nbsp;Địa chỉ:&nbsp;</span>
                                <span style="font-size:14px;color:rgb(0,0,0);"><%=shop.getAddress()%></span>
                            </div>
                        </div>
                        <div>
                            <a class="btn btn-primary text-capitalize border rounded-0" data-bs-toggle="collapse" aria-expanded="false" aria-controls="collapse-1" href="#collapse-1" role="button"
                               style="line-height: 12px;width: 100%;margin-top: 5px;">thay đổi địa chỉ</a>
                            <form action="./change-address" method="post" class="collapse" id="collapse-1" accept-charset="UTF-8">
                                <div class="text-start" style="margin-bottom: 5px;margin-top: 10px;">
                                    <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;">Tỉnh, thành phố *</label>
                                    <select name="province" class="form-select-sm form-select form-select form-select form-select mb-3" aria-label=".form-select-sm" id="city">
                                        <option value="" selected="">Chọn tỉnh thành</option>
                                    </select>
                                    <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;">Quận, huyện, thị xã *</label>
                                    <select name="city" class="form-select-sm form-select form-select form-select form-select mb-3" aria-label=".form-select-sm" id="district">
                                        <option value="" selected="">Chọn quận huyện</option>
                                    </select>
                                    <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;">Phường, xã, thị trấn *</label>
                                    <select name="district" class="form-select-sm form-select form-select form-select form-select" aria-label=".form-select-sm" id="ward">
                                        <option value="" selected="">Chọn phường xã</option>
                                    </select>
                                    <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;margin-top:10px;">Địa chỉ cụ thể *</label>
                                    <input name="street" class="form-control-sm form-control form-control form-control" type="text" id="street" name="street" placeholder="Địa chỉ cụ thể"
                                           style="color:rgb(0,0,0);width:100%;">
                                    <button class="btn btn-primary text-capitalize border rounded-0" type="submit" style="width: 100%;line-height: 12px;margin-top: 5px;">lưu địa chỉ</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-8" style="padding: 12px;background: #ffffff;margin-left: 0px;">
                        <div class="align-items-xxl-center">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab"
                                                                            data-bs-toggle="tab" href="#tab-1">Đang hiển thị&nbsp;<span>(<%=shopProducts.size()%>)</span></a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab"
                                                                            href="#tab-2">Đã bán&nbsp;<span>(<%=soldProducts.size()%>)</span></a></li>
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

        <script>
            // Lấy thẻ input và nút submit
            const fileInput = document.getElementById('avatar');
            const submitButton = document.getElementById('submitButton');

            // Thêm sự kiện onchange cho input file
            fileInput.addEventListener('change', function () {
                // Kiểm tra nếu đã chọn một file
                if (fileInput.files.length > 0) {
                    // Hiển thị nút submit
                    submitButton.style.display = 'block';
                }
            });
        </script>
        <script>
            //Get data from api
            var citis = document.getElementById("city");
            var districts = document.getElementById("district");
            var wards = document.getElementById("ward");
            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json"
            };
            var promise = axios(Parameter);
            promise.then(function (result) {
                renderCity(result.data);
            });

            //Try create new array to store City.id 
            var city = [];
            var nCity = 0;
            //Render City
            function renderCity(data) {
                for (const x of data) {
                    city[nCity++] = x.Id;
                    citis.options[citis.options.length] = new Option(x.Name, x.Name); // Đổi từ x.Id thành x.Name
                }
                citis.onchange = function () {
                    district.length = 1;
                    ward.length = 1;
                    if (this.value != "") {
                        const result = data.filter(n => n.Name === this.value); // Đổi từ n.Id thành n.Name

                        for (const k of result[0].Districts) {
                            district.options[district.options.length] = new Option(k.Name, k.Name); // Đổi từ k.Id thành k.Name
                        }
                    }
                };
                district.onchange = function () {
                    ward.length = 1;
                    const dataCity = data.filter((n) => n.Name === citis.value); // Đổi từ n.Id thành n.Name
                    if (this.value != "") {
                        const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards; // Đổi từ n.Id thành n.Name

                        for (const w of dataWards) {
                            wards.options[wards.options.length] = new Option(w.Name, w.Name); // Đổi từ w.Id thành w.Name
                        }
                    }
                };
            }
        </script>
    </body>

</html>
