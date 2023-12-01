<%-- 
    Document   : create-order
    Created on : Dec 1, 2023, 5:14:27 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    Product product = (Product)request.getAttribute("product");
    
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Đặt hàng</title>
        <%@include file="../../views/resources/style.jsp" %>
    </head>

    <body style="color: var(--bs-primary-text-emphasis);background: var(--bs-gray-300);">
        <%@include file="../../views/layout/header.jsp" %>

        <form method="post" style="position: relative;margin: 0 auto;width: 936px;">
            <input name="sellerId" type="hidden" value="<%=product.getUserId()%>">
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);">
                <div style="width: 936px;height: auto;">
                    <div style="background-color: #fff;">
                        <div style="margin-top: 12px;padding: 16px;display: flex;"><a href="#"><span style="font-weight: bold;">Tạo đơn</span></a></div>
                    </div>
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div style="display: flex;overflow: hidden;"></div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 936px;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Sản phẩm</span></div>
                        </div>
                        <div style="display: flex;overflow: hidden;padding: 15px;">
                            <div style="width: 70%;">
                                <div>
                                    <div style="--t1fgqb9w-0: auto;overflow-x: var(--t1fgqb9w-0);flex: 1 1 auto;display: flex;position: relative;white-space: nowrap;/*--t1fgqb9w-0: auto;*/width: 100%;">
                                        <div style="padding: 7px;margin-right: 10px;">
                                            <picture><img src="<%=product.getImage()%>" style="width: 80px;height: 80px;flex-shrink: 0;border: 1px solid #e1e1e1;background: #e1e1e1;"></picture>
                                        </div>
                                        <div>
                                            <div style="height: 40%;"><span style="font-size: 20px;font-weight: bold;width: 100%;"><%=product.getName()%></span></div>
                                        </div>
                                    </div>
                                </div>
                                <div style="padding: 7px;padding-top: 20px;width: 100%;border-top: 1px none var(--bs-secondary-color) ;"><span style="font-weight: bold;">Chi tiết sản phẩm</span>
                                    <div style="height: 20%;"><span>Tên người bán: <%=product.getUsername()%></span></div>
                                    <div style="height: 50%;"><span>Số điện thoại: <%=product.getPhone()%></span></div><span>Địa chỉ: <%=product.getAddress()%></span>
                                </div>
                            </div>
                            <div style="width: 25%;text-align: right;/*text-align: center;*/">
                                <div style="height: 30%;"></div><span style="font-weight: bold;padding-top: 10px;margin-top: 0;"><%=product.getPriceToString()%></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 936px;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Địa chỉ nhận hàng</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label" style="margin-bottom: 0px;font-weight: bold;margin-left: 10px;">Số điện thoại *</label><input type="text" id="phone" class="form-control form-control" pattern="0[0-9]{9,10}" placeholder="Số điện thoại" required="" style="width: 90%;margin-left: 15px;" name="phone"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Tỉnh, thành phố *</label><select aria-label=".form-select-sm" class="form-select form-select form-select form-select mb-3" id="city" style="margin-left: 15px;width: 90%;" name="province">
                                <option value="" selected="">Chọn tỉnh thành</option>
                            </select><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Quận, huyện, thị xã *</label><select aria-label=".form-select-sm" class="form-select form-select form-select form-select mb-3" id="district" style="margin-left: 15px;width: 90%;" name="city">
                                <option value="" selected="">Chọn quận huyện</option>
                            </select><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Phường, xã, thị trấn *</label><select aria-label=".form-select-sm" class="form-select form-select form-select form-select" id="ward" style="margin-left: 15px;width: 90%;" name="district">
                                <option value="" selected="">Chọn phường xã</option>
                            </select><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Địa chỉ cụ thể *</label><input type="text" id="street" class="form-control form-control form-control" name="street" placeholder="Địa chỉ cụ thể" style="color: rgb(0,0,0);width: 90%;margin-left: 15px;"></div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 936px;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Phương thức giao hàng</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Tự thỏa thuận khi giao hàng</label></div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 936px;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Phương thức thanh toán</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Thanh toán tiền mặt</label></div>
                    </div>
                </div>
                <div style="width: 936px;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Thông tin thanh toán</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 40%;">Số tiền</label><label class="form-label form-label form-label form-label" style="color: #22a10d;font-weight: bold;margin-top: 0px;margin-left: 10px;"><%=product.getPriceToString()%>đ</label></div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 40%;">Tổng thanh toán</label><label class="form-label form-label form-label form-label" style="color: #22a10d;font-weight: bold;margin-top: 0px;margin-left: 10px;"><%=product.getPriceToString()%>đ</label></div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Ghi chú cho người bán</label><input type="text" id="street-1" class="form-control form-control form-control" name="comment" placeholder="Ghi chú cho người bán" style="color: rgb(0,0,0);width: 90%;margin-left: 15px;"></div>
                    </div>
                </div>
            </div>
                        
            <div class="text-end mb-3"><button class="btn btn-primary" type="submit" style="margin: 0px;">Đặt hàng</button><a class="btn btn-danger" role="button" href="index.html">huỷ</a></div>
        </form>

        <%@include file="../../views/layout/footer.jsp" %>
        <%@include file="../../views/resources/script.jsp" %>
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