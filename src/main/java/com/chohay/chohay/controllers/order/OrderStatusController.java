/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.order;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author caomi
 */
@WebServlet(name = "OrderStatusController", urlPatterns = {"/order-status"})
public class OrderStatusController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("/views/order/order-status-processing.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = request.getParameter("status");
        if (status.equals("processing")) {
            RequestDispatcher rd = request.getRequestDispatcher("/views/order/order-status-processing.jsp");
            rd.forward(request, response);
        }else if(status.equals("delivering")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/order/order-status-delivering.jsp");
            rd.forward(request, response);
        }else if(status.equals("delivered")){
            RequestDispatcher rd = request.getRequestDispatcher("/views/order/order-status-delivered.jsp");
            rd.forward(request, response);
        }

    }

}
