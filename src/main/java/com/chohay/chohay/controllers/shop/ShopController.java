/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.shop;

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

/**
 *
 * @author caomi
 */
@WebServlet(name = "ShopController", urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int shopId = Integer.parseInt(request.getParameter("id"));

        //get connection
        ProductService productService = ProductServiceSingleton.getInstance();
        UserService userService = UserServiceSingleton.getInstance();
        AddressService addressService = AddressServiceSingleton.getInstance();

        User shopProfile;
        try {
            shopProfile = userService.getUserDetailsById(shopId);
            if (shopProfile != null) {

                shopProfile.setAddress(addressService.getAddressById(shopProfile.getAddressId()).getAddress());
                List<Product> shopProducts = null;
                List<Product> soldProducts = null;
                shopProducts = productService.getProductsByUserId(shopId);
                if (shopProducts.size() > 0) {
                    for (Product product : shopProducts) {
                        product.setUsername(userService.getFullNameById(product.getUserId()));
                        product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                    }
                }

                soldProducts = productService.getSoldProductByUserId(shopId);
                if (soldProducts.size() > 0) {
                    for (Product product : soldProducts) {
                        product.setUsername(userService.getFullNameById(product.getUserId()));
                        product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                    }
                }

                request.setAttribute("shopProducts", shopProducts);
                request.setAttribute("soldProducts", soldProducts);
                request.setAttribute("shopProfile", shopProfile);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/shop/shop.jsp");
                requestDispatcher.forward(request, response);
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/shop/shop-not-found.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShopController.class.getName()).log(Level.SEVERE, null, ex);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/shop/shop-not-found.jsp");
            requestDispatcher.forward(request, response);
        }

        //close connection
        productService.closeConnection();
        userService.closeConnection();
        addressService.closeConnection();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
