<%-- 
    Document   : create-product
    Created on : Nov 19, 2023, 3:13:32 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en" data-bss-forced-theme="light">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Tạo tin</title>
        <%@include file="../resources/style.jsp" %>
    </head>

    <body style="background:rgb(242,242,242);color:#55595c;">
        <%@include file="../layout/header.jsp" %>

        <div style="width:100%;height:100%;">
            <div class="container-fluid" style="width: 100%;max-width: 60%;padding: 0;padding-top: 15px;padding-bottom: 15px;height: 100%;">
                <form method="post" enctype="multipart/form-data" style="width:100%;height:100%;" accept-charset="UTF-8">
                    <div class="card shadow mb-3" style="width: 100%;height: 100%;margin: 0;">
                        <div class="card-header py-3" style="width: 100%;height: 100%;padding: 0;">
                            <p class="fs-4 fw-bolder text-start text-primary m-0 fw-bold">Tạo sản phẩm</p>
                        </div>
                        <div class="card-body" style="width: 100%;height: 100%;min-height: 0px;padding: 0;margin: 0;">
                            <div class="row" style="width: 100%;margin: 2px;padding: 0;">
                                <div class="col-sm-12 col-md-8 col-lg-8 col-xxl-7" style="transform:scale(1);width:100%;height:100%;">
                                    <div class="mb-3" style="width: 100%;">
                                        <label class="form-label form-label" for="service_name"><strong>Danh mục tin đăng *</strong></label>
                                        <select name="category" class="form-select form-select" required="" style="color:rgb(0,0,0);">
                                            <option value="ApartmentDetails">Căn hộ</option>
                                            <option value="PhoneDetails">Điên thoại</option>
                                            <option value="DogDetails">Chó</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%;margin: 2px;padding: 0;">
                                <div class="col-sm-12 col-md-8 col-lg-8 col-xxl-8" style="transform:scale(1);">
                                    <div class="mb-3" style="width: 100%;">
                                        <label class="form-label form-label" for="service_name"><strong>Tên sản phẩm *</strong></label>
                                        <input class="form-control form-control" name="name" type="text" id="service_name" placeholder="Tên sản phẩm" required="" style="border-color:rgb(0,0,0);color:rgb(0,0,0);">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-4 col-lg-4">
                                    <div class="mb-3" style="width: 100%;">
                                        <label class="form-label form-label" for="service_price"><strong>Giá tiền *</strong></label>
                                        <input name="price" class="form-control" type="number" required="" placeholder="VND">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%;margin: 2px;padding: 0;">
                                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6" style="transform:scale(1);">
                                    <div class="mb-3" style="width: 100%;">
                                        <label class="form-label form-label" for="service_name" style="color:#55595c;"><strong>Số điện thoại *</strong></label>
                                        <input name="phone" class="form-control form-control" type="tel" id="service_name-1" placeholder="Số điện thoại" required="" style="border-color:rgb(0,0,0);color:rgb(0,0,0);">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6 col-xxl-6">
                                    <div class="mb-3" style="width: 100%;">
                                        <label class="form-label form-label form-label" for="image"><strong>Hình ảnh *</strong></label>
                                        <input name="image" class="form-control form-control" type="file" id="image" placeholder="Hình ảnh" required="">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%;margin: 2px;padding: 0;">
                                <div class="col">
                                    <div style="width: 100%;">
                                        <label class="form-label form-label" style="color:#55595c;font-weight:bold;">Tỉnh, thành phố *</label>
                                        <select name="province" class="form-select form-select-sm form-select form-select mb-3" aria-label=".form-select-sm" id="city">
                                            <option value="" selected="">Chọn tỉnh thành</option>
                                        </select>
                                        <label class="form-label form-label" style="color:#55595c;font-weight:bold;">Quận, huyện, thị xã *</label>
                                        <select name="city" class="form-select form-select-sm form-select form-select mb-3" aria-label=".form-select-sm" id="district">
                                            <option value="" selected="">Chọn quận huyện</option>
                                        </select>
                                        <label class="form-label form-label" style="color:#55595c;font-weight:bold;">Phường, xã, thị trấn *</label>
                                        <select name="district" class="form-select form-select-sm form-select form-select" aria-label=".form-select-sm" id="ward">
                                            <option value="" selected="">Chọn phường xã</option>
                                        </select>
                                        <label class="form-label form-label" style="color:#55595c;font-weight:bold;margin-top:10px;">Địa chỉ cụ thể *</label>
                                        <input name="street" class="form-control form-control" type="text" name="street" placeholder="Địa chỉ cụ thể" style="color:rgb(0,0,0);"></div>
                                </div>
                            </div>
                            <div class="row justify-content-around" style="width: 100%;margin: 2px;padding: 0;">
                                <div class="col-sm-12 col-md-8 col-lg-6 col-xxl-8" style="transform: scale(1);width: 100%;">
                                    <div class="mb-3" style="width: 100%;">
                                        <label class="form-label form-label" for="service_name"><br><strong>Mô tả sản phẩm&nbsp;*</strong></label>
                                        <textarea name="description" class="form-control form-control" id="service_description-1" name="description" placeholder="Mô tả sản phẩm" required="" rows="4" style="color: rgb(0,0,0);width: 100%;"></textarea></div>
                                </div>
                            </div>
                            <!--new Row here-->

                        </div>
                    </div>
                    <div class="text-end mb-3"><button class="btn btn-primary" type="submit">đăng tin</button><a class="btn btn-danger" role="button" href="index.html">huỷ</a></div>
                </form>
            </div>
        </div>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../resources/script.jsp" %>
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
                    console.log(x.Name);
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