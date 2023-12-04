<%-- 
    Document   : order
    Created on : Dec 1, 2023, 7:05:18 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.Product"%>
<%@page import="com.chohay.chohay.models.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    Order order = (Order) request.getAttribute("order");
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Mã đơn hàng: <%=order.getId()%></title>
        <%@include file="../../views/resources/style.jsp" %>
    </head>

    <body style="color: var(--bs-primary-text-emphasis);background: var(--bs-gray-300);">
        <%@include file="../../views/layout/header.jsp" %>


        <div style="position: relative;margin: 0 auto;width: 100%;">
            <div style="position: relative;margin: 0 auto;width: 100%;background: var(--bs-body-bg);">
                <div style="width: 100%;height: auto;">
                    <div style="background-color: #fff;">
                        <div style="margin-top: 12px;padding: 16px;display: flex;"><span style="font-weight: bold;color: #22a10d;"><%=request.getAttribute("status")%></span></div>
                    </div>
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div style="display: flex;overflow: hidden;"></div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 100%;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 100%;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Mã đơn hàng: <%=order.getId()%></span></div>
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
            <div style="position: relative;margin: 0 auto;width: 100%;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 100%;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Địa chỉ nhận hàng</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;">
                            <label class="form-label form-label form-label" style="margin-bottom: 0px;font-weight: bold;margin-left: 10px;width: 90%;">Số điện thoại: <%=order.getReceiverPhone()%></label>
                            <label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 90%;">Tỉnh, thành phố: <%=order.getReceiverProvince()%>;</label>
                            <label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 90%;">Quận, huyện, thị xã: <%=order.getReceiverCity()%></label>
                            <label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 90%;">Phường, xã, thị trấn: <%=order.getReceiverDistrict()%>;</label>
                            <label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 90%;">Địa chỉ cụ thể: <%=order.getReceiverStreet()%>;</label>
                        </div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 100%;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 100%;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Phương thức giao hàng</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Tự thỏa thuận khi giao hàng</label></div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 100%;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 100%;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Phương thức thanh toán</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Thanh toán tiền mặt</label></div>
                    </div>
                </div>
                <div style="width: 100%;height: auto;">
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;"><span style="font-weight: bold;font-size: 17px;">Thông tin thanh toán</span></div>
                        </div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 40%;">Số tiền</label><label class="form-label form-label form-label form-label" style="color: #22a10d;font-weight: bold;margin-top: 0px;margin-left: 10px;"><%=product.getPriceToString()%>đ</label></div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;width: 40%;">Tổng thanh toán</label><label class="form-label form-label form-label form-label" style="color: #22a10d;font-weight: bold;margin-top: 0px;margin-left: 10px;"><%=product.getPriceToString()%>đ</label></div>
                        <div class="text-start" style="margin-bottom:16px;"><label class="form-label form-label form-label form-label" style="color: #55595c;font-weight: bold;margin-top: 0px;margin-left: 10px;">Ghi chú cho người bán</label>
                            <p style="width: 90%;margin-left: 15px;"> <%=order.getCustomerComment()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../../views/layout/footer.jsp" %>
        <%@include file="../../views/resources/script.jsp" %>
    </body>

</html>
