<%-- 
    Document   : register
    Created on : Nov 27, 2023, 1:12:12 PM
    Author     : caomi
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Đăng ký tài khoản Chợ Hay</title>
        <%@include file="../resources/style.jsp" %>
        <!--        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;500;600;700&amp;display=swap">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Averia+Serif+Libre&amp;display=swap">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.2/dist/lux/bootstrap.min.css">
                <link rel="stylesheet" href="assets/css/styles.min.css">-->
    </head>

    <body>
        <%@include file="../layout/header.jsp" %>
        <section class="position-relative py-4 py-xl-5">
            <div class="container">
                <div class="row mb-4 justify-content-center" style="padding-bottom: 0px;padding-top: 0px;">
                    <div class="col-md-8 col-xl-6 text-center" style="width: auto;">
                        <h2 class="headinglog">đăng ký vào chợ hay</h2>
                    </div>
                </div>
                <div class="row d-flex justify-content-center" style="padding-top: 0px;padding-bottom: 0px;color: rgb(85,89,92);">
                    <div class="col-12 col-sm-12 col-md-10 col-lg-7 col-xl-6 col-xxl-6">
                        <div class="card mb-5">
                            <div class="card-body d-flex flex-column align-items-center" style="box-shadow: 0px 0px 10px;">
                                <div style="padding: 10px;">
                                    <h2 class="logolog" style="color: rgb(0,0,0);font-weight: bold;">chohay</h2>
                                </div>
                                <form class="text-center form-register" method="post">
                                    <div class="mb-3" style="width:100%;">
                                        <h1 style="text-align:center;font-size:18px;color:rgb(88,88,88);letter-spacing:1px;margin-bottom:0px;font-weight:bold;"> đăng ký tài khoản</h1>
                                        <h1 style="text-align:center;font-size:18px;color:rgb(88,88,88);letter-spacing:1px;margin-bottom:0px;font-weight:bold;color: red;"> ${status}</h1>
                                    </div>
                                    <div class="text-start mb-3" style="width:100%;">
                                        <label class="form-label form-label form-label" style="margin-bottom:0px;font-weight:bold;">Tên người dùng *</label>
                                        <input name="username" class="form-control form-control form-control" type="text" id="username"  placeholder="Tên người dùng" required="" oninput="checkUsername()" style="width:100%;">
                                        <p id="usernameValidationMessage"></p>
                                    </div>
                                    <div class="text-start mb-3" style="width:100%;">
                                        <label class="form-label form-label form-label" style="margin-bottom:0px;font-weight:bold;">Họ và tên *</label>
                                        <input name="fullname" class="form-control form-control form-control" type="text" id="fullName"  placeholder="Họ và tên"  oninput="checkFullName()" required="" style="width:100%;">
                                        <p id="fullNameValidationMessage"></p>
                                    </div>
                                    <div class="text-start mb-3" style="width:100%;">
                                        <label class="form-label form-label form-label" style="margin-bottom:0px;font-weight:bold;">Email *</label>
                                        <input name="email" class="form-control form-control form-control" type="text" id="email"  placeholder="Email"  oninput="checkEmail()" required="" style="width:100%;">
                                        <p id="emailValidationMessage"></p>
                                    </div>
                                    <div class="text-start mb-3" style="width:100%;">
                                        <label class="form-label form-label form-label" style="margin-bottom:0px;font-weight:bold;">Số điện thoại *</label>
                                        <input name="phone" class="form-control form-control form-control" type="text" id="phone"  placeholder="Số điện thoại"  oninput="checkPhone()" required="" style="width:100%;">
                                        <p id="phoneValidationMessage"></p>
                                    </div>
                                    <div class="text-start mb-3" style="width:100%;">
                                        <label class="form-label form-label form-label form-label" style="margin-bottom:0px;font-weight:bold;">Mật khẩu *</label>
                                        <input name="password" class="form-control form-control form-control" type="password" id="password" placeholder="Mật khẩu" required="" style="width:100%;">
                                    </div>
                                    <div class="text-start mb-3" style="width:100%;">
                                        <label class="form-label form-label form-label form-label" style="margin-bottom:0px;font-weight:bold;">Nhập lại mật khẩu *</label>
                                        <input id="confirmPassword" class="form-control form-control form-control" type="password" placeholder="Nhập lại mật khẩu" required oninput="checkPassword()" style="width: 100%;" />
                                        <p id="passwordMatchMessage"></p>
                                    </div>
                                    <div class="text-start" style="margin-bottom:16px;">
                                        <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;">Tỉnh, thành phố *</label>
                                        <select name="province" required="" class="form-select form-select form-select form-select form-select mb-3" aria-label=".form-select-sm" id="city">
                                            <option value="" selected="">Chọn tỉnh thành</option>
                                        </select>
                                        <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;">Quận, huyện, thị xã *</label>
                                        <select name="city" required="" class="form-select form-select form-select form-select form-select mb-3" aria-label=".form-select-sm" id="district">
                                            <option value="" selected="">Chọn quận huyện</option>
                                        </select>
                                        <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;">Phường, xã, thị trấn *</label>
                                        <select name="district" required="" class="form-select form-select form-select form-select form-select" aria-label=".form-select-sm" id="ward">
                                            <option value="" selected="">Chọn phường xã</option>
                                        </select>
                                        <label class="form-label form-label form-label form-label" style="color:#55595c;font-weight:bold;margin-top:10px;">Địa chỉ cụ thể *</label>
                                        <input name="street" required="" class="form-control form-control form-control form-control" type="text" id="street" name="street" placeholder="Địa chỉ cụ thể" style="color:rgb(0,0,0);width:100%;"></div>
                                    <div class="mb-3" style="width:100%;"><button class="btn btn-primary d-block w-100" type="submit">đăng ký</button></div>
                                    <p class="text-center text-muted" style="text-align: left;color: #55595c;width: 100%;">Đã có tài khoản?&nbsp;<a href="./login" style="color: #1a1a1a94;font-weight: bold;">Đăng nhập ngay</a></p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../resources/script.jsp" %>
        <script>
            function checkPassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;
                var message = document.getElementById("passwordMatchMessage");

                if (password === confirmPassword) {
                    message.innerHTML = "Mật khẩu khớp nhau!";
                    message.style.color = "green";
                } else {
                    message.innerHTML = "Mật khẩu không khớp. Vui lòng nhập lại.";
                    message.style.color = "red";
                }
            }

            // Function to check username
            function checkUsername() {
                var username = document.getElementById("username").value;
                var usernameRegex = /^(?=.*[A-Za-z])[A-Za-z\d_]{3,20}$/;
                var message = document.getElementById("usernameValidationMessage");

                if (!username.match(usernameRegex)) {
                    message.innerHTML = "Tên người dùng không hợp lệ. Tên người dùng phải chứa ít nhất một chữ cái và có độ dài từ 3 đến 20 ký tự.";
                    message.style.color = "red";
                } else {
                    message.innerHTML = "";
                }
            }

// Function to check full name
            function checkFullName() {
                var fullName = document.getElementById("fullName").value;
                var fullNameRegex = /^[A-Za-z\sÀ-ỹ]{2,50}$/;
                var message = document.getElementById("fullNameValidationMessage");

                if (!fullName.match(fullNameRegex)) {
                    message.innerHTML = "Họ và tên không hợp lệ. Họ và tên chỉ chứa chữ cái và khoảng trắng và có độ dài từ 2 đến 50 ký tự.";
                    message.style.color = "red";
                } else {
                    message.innerHTML = "";
                }
            }

// Function to check email
            function checkEmail() {
                var email = document.getElementById("email").value;
                var emailRegex = /^[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$/;
                var message = document.getElementById("emailValidationMessage");

                if (!email.match(emailRegex)) {
                    message.innerHTML = "Email không hợp lệ. Vui lòng nhập đúng định dạng Email.";
                    message.style.color = "red";
                } else {
                    message.innerHTML = "";
                }
            }

// Function to check phone number
            function checkPhone() {
                var phone = document.getElementById("phone").value;
                var phoneRegex = /^0[0-9]{9,10}$/;
                var message = document.getElementById("phoneValidationMessage");

                if (!phone.match(phoneRegex)) {
                    message.innerHTML = "Số điện thoại không hợp lệ. Số điện thoại bắt đầu bằng số 0 và có độ dài từ 10 đến 11 số.";
                    message.style.color = "red";
                } else {
                    message.innerHTML = "";
                }
            }

            document.querySelector('.form-register').addEventListener('submit', function (event) {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirmPassword").value;

               
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
                if (!password.match(passwordRegex)) {
                    event.preventDefault(); // Ngăn chặn sự kiện mặc định của form (submit)
                    // Hiển thị thông báo hoặc xử lý mật khẩu không đúng định dạng ở đây (nếu cần)
                    alert("Mật khẩu không khớp hoặc không đúng định dạng. Mật khẩu phải chứa ít nhất một chữ hoa, một chữ thường, một số và có độ dài từ 8 đến 16 ký tự.");
                }

                if (password !== confirmPassword) {
                    event.preventDefault(); // Ngăn chặn sự kiện mặc định của form (submit)
                    // Hiển thị thông báo hoặc xử lý mật khẩu không khớp ở đây (nếu cần)
                    alert("Mật khẩu không khớp. Vui lòng nhập lại.");
                }
                // Nếu mật khẩu khớp, form sẽ tiếp tục submit
                // Hàm kiểm tra và hiển thị cảnh báo cho các trường input


                // Kiểm tra Địa chỉ cụ thể
                var street = document.getElementById("street").value;
                if (street === "") {
                    event.preventDefault();
                    alert("Vui lòng nhập Địa chỉ cụ thể.");
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
