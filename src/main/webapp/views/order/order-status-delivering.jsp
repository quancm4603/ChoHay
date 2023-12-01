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
    List<Order> deliveringOrder = (List<Order>) request.getAttribute("deliveringOrder");
%>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Đơn hàng đang giao</title>
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
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div style="display: flex;overflow: hidden;">
                            <div style="--t1fgqb9w-0: auto;overflow-x: var(--t1fgqb9w-0);flex: 1 1 auto;display: flex;position: relative;white-space: nowrap;/*--t1fgqb9w-0: auto;*/">
                                <form action="./order-status" method="post">
                                    <input name="status" type="hidden" value="processing">
                                    <button class="btn btn-primary" type="submit" style="--display: inline-flex;line-height: 1;flex-direction: row-reverse;padding: 14px;display: var(--display);justify-content: center;background-color: transparent;position: relative;line-height: 1;flex-direction: row-reverse;padding: 14px;color: var(--bs-btn-hover-bg);">
                                        <span style="min-height: unset;min-width: unset;margin-left: 4px;display: inline-flex;align-items: center;flex-direction: column;justify-content: center;height: 100%;font-weight: 700;font-size: .95rem;color: var(--to6lhll-2);">đang xử lý </span>
                                    </button>
                                </form>
                                <form action="./order-status" method="post">
                                    <input name="status" type="hidden" value="delivering">
                                    <button class="btn btn-primary" type="submit" style="--display: inline-flex;line-height: 1;flex-direction: row-reverse;padding: 14px;display: var(--display);justify-content: center;background-color: transparent;position: relative;line-height: 1;flex-direction: row-reverse;padding: 14px;color: var(--bs-btn-hover-bg);margin-left: 280px;margin-right: 260px;">
                                        <span style="min-height: unset;min-width: unset;margin-left: 4px;display: inline-flex;align-items: center;flex-direction: column;justify-content: center;height: 100%;font-weight: 700;font-size: .95rem;color: var(--to6lhll-2);">đang GIAO ( <%=deliveringOrder.size()%> )</span>
                                        <span style="min-height: unset;min-width: unset;margin-left: 4px;--twdt1ol-0: #FF8800;background-color: var(--twdt1ol-0);bottom: 0;height: 4px;position: absolute;width: 100%;"></span>
                                    </button>
                                </form>
                                <form action="./order-status" method="post">
                                    <input name="status" type="hidden" value="delivered">
                                    <button class="btn btn-primary" type="submit" style="--display: inline-flex;line-height: 1;flex-direction: row-reverse;padding: 14px;display: var(--display);justify-content: center;background-color: transparent;position: relative;line-height: 1;flex-direction: row-reverse;padding: 14px;color: var(--bs-btn-hover-bg);">
                                        <span style="min-height: unset;min-width: unset;margin-left: 4px;display: inline-flex;align-items: center;flex-direction: column;justify-content: center;height: 100%;font-weight: 700;font-size: .95rem;color: var(--to6lhll-2);">ĐÃ giao</span>
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
                        for (Order order : deliveringOrder) {
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


                    <div style="padding-top: 5px;">
                        <div style="text-align: end;">
                            <form action="./cancel-order" method="post">
                                <input name="orderId" type="hidden" value="<%=order.getId()%>">
                                <button class="btn btn-primary" type="submit">HỦY ĐƠN</button>
                            </form>
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