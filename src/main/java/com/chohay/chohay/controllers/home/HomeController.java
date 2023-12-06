/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.home;

import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.AddressServiceSingleton;
import com.chohay.chohay.services.ProductService;
import com.chohay.chohay.services.ProductServiceSingleton;
import com.chohay.chohay.services.UserService;
import com.chohay.chohay.services.UserServiceSingleton;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "HomeController", urlPatterns = {"/", "/home"})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = null;
        int userId = -1; // Mặc định là -1 hoặc giá trị không hợp lệ nếu không có user

        if (session != null && session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            userId = user.getId();
        }
        List<Product> products = null;
        //get serrvice
        ProductService productService = ProductServiceSingleton.getInstance();
        UserService userService = UserServiceSingleton.getInstance();
        AddressService addressService = AddressServiceSingleton.getInstance();

        try {
            products = productService.getLatestProductsStartingFromN(0, 16, userId);
            if (products.size() > 0) {
                for (Product product : products) {
                    product.setUsername(userService.getFullNameById(product.getUserId()));
                    product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("products", products);

        //close connection
        productService.closeConnection();
        userService.closeConnection();
        addressService.closeConnection();

        RequestDispatcher rd = request.getRequestDispatcher("/views/home/index.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
