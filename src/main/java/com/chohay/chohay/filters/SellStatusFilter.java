/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.filters;

import com.chohay.chohay.models.Order;
import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.AddressServiceSingleton;
import com.chohay.chohay.services.OrderService;
import com.chohay.chohay.services.OrderServiceSingleton;
import com.chohay.chohay.services.ProductService;
import com.chohay.chohay.services.ProductServiceSingleton;
import com.chohay.chohay.services.UserService;
import com.chohay.chohay.services.UserServiceSingleton;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author caomi
 */
@WebFilter(urlPatterns = {"/sell-status"})
public class SellStatusFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        //Get service
        // Gọi OrderService để thêm đơn hàng vào cơ sở dữ liệu
        OrderService orderService = OrderServiceSingleton.getInstance();
        ProductService productService = ProductServiceSingleton.getInstance();
        UserService userService = UserServiceSingleton.getInstance();
        AddressService addressService = AddressServiceSingleton.getInstance();

        try {
            List<Order> orders = orderService.getOrdersBySellerId(userId);
            List<Order> processingOrder = new ArrayList<>();
            List<Order> deliveringOrder = new ArrayList<>();
            List<Order> deliveredOrder = new ArrayList<>();
            if (orders.size() > 0) {
                for (Order order : orders) {
                    // add more details to order
                    order.setSellerName(userService.getFullNameById(order.getSellerId()));
                    order.setSellerAddress(addressService.getAddressById(userService.getUserById(order.getSellerId()).getAddressId()).getAddress());
                    order.setSellerPhone(userService.getUserById(order.getSellerId()).getPhone());
                    Product product = productService.getProductById(order.getProductId());
                    order.setProductName(product.getName());
                    order.setProductImage(product.getImage());
                    order.setPrice(product.getPrice());

                    // ordering order
                    if (order.getStatus() == 0) {
                        processingOrder.add(order);
                    }
                    if (order.getStatus() == 1) {
                        deliveringOrder.add(order);
                    }
                    if (order.getStatus() == 2) {
                        deliveredOrder.add(order);
                    }
                }
            }

            httpRequest.setAttribute("processingOrder", processingOrder);
            httpRequest.setAttribute("deliveringOrder", deliveringOrder);
            httpRequest.setAttribute("deliveredOrder", deliveredOrder);
            httpRequest.setAttribute("processingOrderSize", processingOrder.size());
            httpRequest.setAttribute("deliveringOrderSize", deliveringOrder.size());
            httpRequest.setAttribute("deliveredOrderSize", deliveredOrder.size());

        } catch (SQLException ex) {
            Logger.getLogger(SellStatusFilter.class.getName()).log(Level.SEVERE, null, ex);
        }

        //close connection
        productService.closeConnection();
        userService.closeConnection();
        addressService.closeConnection();
        orderService.closeConnection();

        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {
    }
}
