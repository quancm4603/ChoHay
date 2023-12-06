/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.user;

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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author caomi
 */

@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User shop = null;
        int userId = -1; // Mặc định là -1 hoặc giá trị không hợp lệ nếu không có user

        if (session != null && session.getAttribute("user") != null) {
            shop = (User) session.getAttribute("user");
            userId = shop.getId();
        }

        if (userId != -1) {

            //get connection
            ProductService productService = ProductServiceSingleton.getInstance();
            UserService userService = UserServiceSingleton.getInstance();
            AddressService addressService = AddressServiceSingleton.getInstance();

            try {
                shop = userService.getUserDetailsById(userId);
                if (shop != null) {

                    shop.setAddress(addressService.getAddressById(shop.getAddressId()).getAddress());
                    List<Product> shopProducts = null;
                    List<Product> soldProducts = null;
                    shopProducts = productService.getProductsByUserId(userId);
                    if (shopProducts.size() > 0) {
                        for (Product product : shopProducts) {
                            product.setUsername(userService.getFullNameById(product.getUserId()));
                            product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                        }
                    }

                    soldProducts = productService.getSoldProductByUserId(userId);
                    if (soldProducts.size() > 0) {
                        for (Product product : soldProducts) {
                            product.setUsername(userService.getFullNameById(product.getUserId()));
                            product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                        }
                    }

                    request.setAttribute("shopProducts", shopProducts);
                    request.setAttribute("soldProducts", soldProducts);
                    request.setAttribute("shop", shop);

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/user/user.jsp");
                    requestDispatcher.forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/shop/shop-not-found.jsp");
                requestDispatcher.forward(request, response);
            }

            //close connection
            productService.closeConnection();
            userService.closeConnection();
            addressService.closeConnection();
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/shop/shop-not-found.jsp");
            requestDispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
