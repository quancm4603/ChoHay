<%-- 
    Document   : order-status
    Created on : Dec 1, 2023, 10:49:12 PM
    Author     : caomi
--%>

<%@page import="com.chohay.chohay.models.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    List<Product> products = (List<Product>)request.getAttribute("products");
%>

<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Quản lý tin đăng</title>
        <%@include file="../../views/resources/style.jsp" %>
    </head>

    <body style="color: var(--bs-primary-text-emphasis);background: var(--bs-gray-300);">
        <%@include file="../../views/layout/header.jsp" %>
        <h1><%=request.getAttribute("status") != null ? request.getAttribute("status") : ""%></h1>

        <div style="position: relative;margin: 10px auto;width: 70%;">
            <div style="position: relative;margin: 0 auto;width: 936px;background: var(--bs-body-bg);">
                <div style="width: 100%;height: auto;">
                    <div style="background-color: #fff;">
                        <div style="margin-top: 12px;padding: 16px;display: flex;"><a href="#"><span style="font-weight: bold;">Cho hay</span></a><span style="margin-left: 5px;">&gt;</span><span style="margin-left: 5px;">Quản lí tin đăng</span></div>
                    </div>
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div style="display: flex;overflow: hidden;">
                            <div style="--t1fgqb9w-0: auto;overflow-x: var(--t1fgqb9w-0);flex: 1 1 auto;display: flex;position: relative;white-space: nowrap;/*--t1fgqb9w-0: auto;*/">
                                <form action="./product-manager" method="get">
                                    <input name="status" type="hidden" value="processing">
                                    <button class="btn btn-primary" type="submit" style="--display: inline-flex;line-height: 1;flex-direction: row-reverse;padding: 14px;display: var(--display);justify-content: center;background-color: transparent;position: relative;line-height: 1;flex-direction: row-reverse;padding: 14px;color: var(--bs-btn-hover-bg);">
                                        <span style="min-height: unset;min-width: unset;margin-left: 4px;display: inline-flex;align-items: center;flex-direction: column;justify-content: center;height: 100%;font-weight: 700;font-size: .95rem;color: var(--to6lhll-2);">Tất cả tin đăng ( <%=products.size()%> )</span>
                                        <span style="min-height: unset;min-width: unset;margin-left: 4px;--twdt1ol-0: #FF8800;background-color: var(--twdt1ol-0);bottom: 0;height: 4px;position: absolute;width: 100%;"></span>
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
                        for (Product product : products) {
                    %>

                    <!--order here-->
                    <div style="background: #fff;border-bottom: 1px solid #f4f4f4;">
                        <div style="display: flex;overflow: hidden;padding: 15px;">
                            <div style="width: 70%;">
                                <div>
                                    <div style="--t1fgqb9w-0: auto;overflow-x: var(--t1fgqb9w-0);flex: 1 1 auto;display: flex;position: relative;white-space: nowrap;/*--t1fgqb9w-0: auto;*/width: 100%;">
                                        <div style="padding: 7px;margin-right: 10px;">
                                            <picture><img src="<%=product.getImage()%>" style="width: 80px;height: 80px;flex-shrink: 0;border: 1px solid #e1e1e1;background: #e1e1e1;"></picture>
                                        </div>
                                        <div>
                                            <div style="height: 40%;"><span style="font-size: 20px;font-weight: bold;width: 100%;"><%=product.getName()%></span></div>
                                            <div style="height: 30%;"><span style="font-weight: bold;">x1</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div style="padding: 7px;padding-top: 20px;width: 100%;border-top: 1px none var(--bs-secondary-color) ;"><span style="font-weight: bold;">Thông tin người bán</span>
                                    <div style="height: 20%;"><span>Tên: <%=product.getUsername()%></span></div>
                                    <div style="height: 50%;"><span>Số điện thoại: <%=product.getPhone()%></span></div><span>Địa chỉ: <%=product.getAddress()%></span>
                                </div>
                            </div>
                            <div style="width: 25%;text-align: right;/*text-align: center;*/">
                                <div style="height: 30%;"></div><span style="font-weight: bold;padding-top: 10px;margin-top: 0;"><%=product.getPriceToString()%></span>
                            </div>
                        </div>
                    </div>


                    <div style="padding-top: 5px;">
                        <div style="text-align: end;">
                            <form action="./delete-product" method="post">
                                <input name="productId" type="hidden" value="<%=product.getId()%>">
                                <button class="btn btn-primary" type="submit">XÓA TIN</button>
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