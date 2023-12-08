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
    List<Product> products = (List<Product>) request.getAttribute("products");
    // Lấy thông tin về trang hiện tại và số sản phẩm trên mỗi trang từ request
    int currentPage = (int) request.getAttribute("currentPage");
    int productsPerPage = (int) request.getAttribute("productsPerPage");

    // Số lượng sản phẩm đã hiển thị
    int displayedProducts = products != null ? products.size() : 0;
    String title = "Kết quả tìm kiếm cho ";
    title += request.getParameter("keyword") != null ? "Kết quả tìm kiếm cho từ khóa: " + request.getParameter("keyword") : "";
    title += request.getParameter("category") != null ? "Danh mục: " + request.getParameter("category") : "";
%>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title><%=title%></title>
        <%@include file="../resources/style.jsp" %>
    </head>

    <body style=" background-color: #f2f2f2;">
        <%@include file="../layout/header.jsp" %>
        <!--bodyhere-->
        <!-- Thanh lựa chọn danh mục -->

        <!-- Kết thúc thanh lựa chọn danh mục -->

        <div style="margin-top: 10px;margin-bottom: 10px;">



            <!--category bar-->
            <!--category bar end-->

            <div class="container containerhome">
                <div style="margin-top: 10px;margin-bottom: 10px;">
                    <!-- Thanh lựa chọn danh mục -->
                    <div class="container category-bar">
                        <div class="row">
                            <div class="col">
                                <label for="categorySelect">Chọn danh mục:</label>
                                <div class="category-buttons">
                                    <a href="?<%=request.getParameter("keyword") != null ? "&keyword=" + request.getParameter("keyword") : ""%><%=request.getParameter("page") != null ? "&page=" + request.getParameter("page") : ""%>" class="btn btn-outline-secondary">Tất cả</a>
                                    <a href="?category=Apartment<%=request.getParameter("keyword") != null ? "&keyword=" + request.getParameter("keyword") : ""%><%=request.getParameter("page") != null ? "&page=" + request.getParameter("page") : ""%>" class="btn btn-outline-secondary">Apartment</a>
                                    <a href="?category=Phone<%=request.getParameter("keyword") != null ? "&keyword=" + request.getParameter("keyword") : ""%><%=request.getParameter("page") != null ? "&page=" + request.getParameter("page") : ""%>" class="btn btn-outline-secondary">Phone</a>
                                    <a href="?category=Dog<%=request.getParameter("keyword") != null ? "&keyword=" + request.getParameter("keyword") : ""%><%=request.getParameter("page") != null ? "&page=" + request.getParameter("page") : ""%>" class="btn btn-outline-secondary">Dog</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Kết thúc thanh lựa chọn danh mục -->

                    <!--category bar end-->
                    <!-- ... -->
                </div>


                <div class="row" style="padding: 7px;padding-bottom: 0px;">
                    <div class="col" style="background: #ffffff;padding: 0px;">
                        <p style="margin-bottom: 8px;font-size: 17px;color: rgb(0,0,0);font-weight: bold;margin-top: 8px;margin-left: 15px;"><%=title%></p>
                    </div>
                </div>
                <div class="row" style="padding-top: 0px;padding-bottom: 7px;padding-right: 7px;padding-left: 7px;">
                    <%                        if (products != null) {
                            for (Product product : products) {
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

                <!-- Phân trang -->
                <div class="row" style="padding-top: 7px; padding-bottom: 7px;">
                    <div class="col text-center">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <%-- Nút trang trước --%>
                                <% if (currentPage > 1) {%>
                                <li class="page-item">
                                    <a class="page-link" href="?page=<%= currentPage - 1%><%=request.getParameter("keyword") != null ? "&keyword" + request.getParameter("keyword") : ""%><%=request.getParameter("category") != null ? "&category" + request.getParameter("category") : ""%>" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <% } %>

                                <%-- Hiển thị số trang và link --%>
                                <%
                                    int totalPages = (int) Math.ceil((double) displayedProducts / productsPerPage);
                                    for (int i = 1; i <= totalPages; i++) {
                                %>
                                <li class="page-item <%= currentPage == i ? "active" : ""%>">
                                    <a class="page-link" href="?page=<%= i%><%=request.getParameter("keyword") != null ? "&keyword=" + request.getParameter("keyword") : ""%><%=request.getParameter("category") != null ? "&category=" + request.getParameter("category") : ""%>"><%= i%></a>
                                </li>
                                <% } %>

                                <%-- Nút trang tiếp theo --%>
                                <% if (currentPage < totalPages) {%>
                                <li class="page-item">
                                    <a class="page-link" href="?page=<%= currentPage + 1%> <%=request.getParameter("keyword") != null ? "&keyword" + request.getParameter("keyword") : ""%><%=request.getParameter("category") != null ? "&category" + request.getParameter("category") : ""%>" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                                <% }%>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <!--bodyhere end-->
        <%@include file="../layout/footer.jsp" %>
        <%@include file="../resources/script.jsp" %>

    </body>

</html>
