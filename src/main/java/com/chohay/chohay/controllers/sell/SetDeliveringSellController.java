/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.chohay.chohay.controllers.sell;

import com.chohay.chohay.controllers.order.*;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.OrderService;
import com.chohay.chohay.services.OrderServiceSingleton;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author caomi
 */
@WebServlet(name="SetDeliveringSellController", urlPatterns={"/set-delivering-sell"})
public class SetDeliveringSellController extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        //Get service
        // Gọi OrderService để thêm đơn hàng vào cơ sở dữ liệu
        OrderService orderService = OrderServiceSingleton.getInstance();

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        try {
            if (userId == orderService.getOrderById(orderId).getSellerId()) {
                orderService.setOrderStatus(orderId, 1);
                session.setAttribute("sellStatus", "Xác nhận thành công, đơn hàng đã chuyển về mục ĐANG GIAO");
            }
        } catch (SQLException ex) {
            session.setAttribute("sellStatus", "Xác nhận thất bại");
            Logger.getLogger(CancelOrderController.class.getName()).log(Level.SEVERE, null, ex);
        }

        //close connection
        orderService.closeConnection();
        response.sendRedirect("./sell-status");
    }


}
