/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.product;

import com.chohay.chohay.controllers.home.HomeController;
import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.ProductService;
import com.chohay.chohay.services.ProductServiceSingleton;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "DeleteProductController", urlPatterns = {"/delete-product"})
public class DeleteProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        //get serrvice
        ProductService productService = ProductServiceSingleton.getInstance();
        Product product = null;
        try {
            int id = Integer.parseInt(request.getParameter("productId"));
            product = productService.getProductById(id);
            if (product.getUserId() == user.getId() && product.getStatus() != -1) {
                productService.deleteProductById(id);
                response.sendRedirect("./product-manager");
            }

        } catch (SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("status", "Không thể xóa được tin đăng");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/product/product-manager.jsp");
            requestDispatcher.forward(request, response);
        }

        //close connection
        productService.closeConnection();

    }

}
