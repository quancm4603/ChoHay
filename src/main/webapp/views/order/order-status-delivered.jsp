<%-- 
    Document   : order-status
    Created on : Dec 1, 2023, 10:49:12 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    List<Order> deliveredOrder = (List<Order>) request.getAttribute("deliveredOrder");
    int processingOrderSize = (int) request.getAttribute("processingOrderSize");
    int deliveringOrderSize = (int) request.getAttribute("deliveringOrderSize");
    int deliveredOrderSize = (int) request.getAttribute("deliveredOrderSize");
%>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Đơn hàng đã giao</title>
        <%@include file="../../views/resources/style.jsp" %>
    </head>

    <body style="color: var(--bs-primary-text-emphasis);background: var(--bs-gray-300);">
        <%@include file="../../views/layout/header.jsp" %>

        <div style="position: relative;margin: 10px auto;width: 70%;">
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);">
                <div style="width: 100%;height: auto;">
                    <div style="background-color: #fff;">
                        <div style="margin-top: 12px;padding: 16px;display: flex;"><a href="#"><span style="font-weight: bold;">Cho hay</span></a><span style="margin-left: 5px;">&gt;</span><span style="margin-left: 5px;">Đơn mua</span></div>
                    </div>
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4; width: 100%">
                        <div style="background: #fff; border-bottom: 1px solid #f4f4f4; width: 100%; overflow: hidden;">
                            <div style="display: flex; overflow-x: auto; justify-content: space-between;">
                                <form action="./order-status" method="post" style="flex: 1; width: auto; text-align: start;">
                                    <input name="status" type="hidden" value="processing">
                                    <button class="btn btn-primary" type="submit" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%; padding: 1em; justify-content: center; background-color: transparent; color: var(--bs-btn-hover-bg);">
                                        <span style="font-weight: 700; font-size: 1em; color: var(--to6lhll-2);">đang xử lý ( <%=processingOrderSize%> )</span>
                                        <span style="background-color: #FF8800; height: 0.25em; width: 100%;"></span>
                                    </button>
                                </form>
                                <form action="./order-status" method="post" style="flex: 1; width: auto; text-align: center;">
                                    <input name="status" type="hidden" value="delivering">
                                    <button class="btn btn-primary" type="submit" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%; padding: 1em; justify-content: center; background-color: transparent; color: var(--bs-btn-hover-bg);">
                                        <span style="font-weight: 700; font-size: 1em; color: var(--to6lhll-2);">đang GIAO ( <%=deliveringOrderSize%> )</span>
                                    </button>
                                </form>
                                 <form action="./order-status" method="post" style="flex: 1; width: auto; text-align: end;">
                                    <input name="status" type="hidden" value="delivered">
                                    <button class="btn btn-primary" type="submit" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%; padding: 1em; justify-content: center; background-color: transparent; color: var(--bs-btn-hover-bg);">
                                        <span style="font-weight: 700; font-size: 1em; color: var(--to6lhll-2);">ĐÃ giao ( <%=deliveredOrderSize%> )</span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);margin-top: 10px;">
                <div style="width: 936px;height: auto;">

                    <%
                        for (Order order : deliveredOrder) {
                    %>

                    <!--order here-->
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div>
                            <div style="display: flex;padding: 0 0 12px;padding-top: 12px;padding-left: 20px;font-size: 18px;border-radius: 1px;border-top: 1px solid var(--bs-secondary-color) ;border-right: 1px solid var(--bs-secondary-color) ;border-bottom: 1px solid var(--bs-secondary-color) ;border-left: 1px solid var(--bs-secondary-color) ;">
                                <span style="font-weight: bold;font-size: 17px;"><%=order.getSellerName()%></span>
                                <a>
                                    <button class="btn btn-primary" type="button" style="padding: 4px 8px;font-size: 12px;text-transform: capitalize;outline: none;border-radius: 2px;border: 1px solid transparent;background-color: #f8f8f8;border-color: #090808;color: #0a0707;padding-top: 0;text-align: center;margin-left: 25px;">Xem shop</button>
                                </a>
                                <span style="font-weight: bold;font-size: 17px;line-height: 24px;color: #090808;text-align: right;text-transform: uppercase;white-space: nowrap;padding-left: 57%;">ĐANG XỬ LÝ</span>
                            </div>
                        </div>
                        <div style="display: flex;overflow: hidden;padding: 15px;">
                            <div style="width: 70%;">
                                <div>
                                    <div style="--t1fgqb9w-0: auto;overflow-x: var(--t1fgqb9w-0);flex: 1 1 auto;display: flex;position: relative;white-space: nowrap;/*--t1fgqb9w-0: auto;*/width: 100%;">
                                        <div style="padding: 7px;margin-right: 10px;">
                                            <picture><img src="<%=order.getProductImage()%>" style="width: 80px;height: 80px;flex-shrink: 0;border: 1px solid #e1e1e1;background: #e1e1e1;"></picture>
                                        </div>
                                        <div>
                                            <div style="height: 40%;"><span style="font-size: 20px;font-weight: bold;width: 100%;"><%=order.getProductName()%></span></div>
                                            <div style="height: 30%;"><span style="font-weight: bold;">x1</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div style="padding: 7px;padding-top: 20px;width: 100%;border-top: 1px none var(--bs-secondary-color) ;"><span style="font-weight: bold;">Thông tin người bán</span>
                                    <div style="height: 20%;"><span>Tên: <%=order.getSellerName()%></span></div>
                                    <div style="height: 50%;"><span>Số điện thoại: <%=order.getSellerPhone()%></span></div><span>Địa chỉ: <%=order.getSellerAddress()%></span>
                                </div>
                                <div style="padding: 7px;padding-top: 20px;width: 100%;border-top: 1px none var(--bs-secondary-color) ;"><span style="font-weight: bold;">Thông tin người nhận</span>
                                    <div style="height: 20%;"><span>Tên: <%=order.getReceiverName()%></span></div>
                                    <div style="height: 50%;"><span>Số điện thoại: <%=order.getReceiverPhone()%></span></div><span>Địa chỉ: <%=order.getAddressToString()%></span>
                                </div>
                            </div>
                            <div style="width: 25%;text-align: right;/*text-align: center;*/">
                                <div style="height: 30%;"></div><span style="font-weight: bold;padding-top: 10px;margin-top: 0;"><%=order.getPriceToString()%></span>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>

            </div>



        </div>
        <%@include file="../../views/layout/footer.jsp" %>
        <%@include file="../../views/resources/script.jsp" %>
    </body>

</html>