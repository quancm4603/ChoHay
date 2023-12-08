/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.product;

import com.chohay.chohay.controllers.home.HomeController;
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
@WebServlet(name = "ProductManagerDeletedController", urlPatterns = {"/product-manager-deleted"})
public class ProductManagerDeletedController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("user");
        List<Product> products = null;
        List<Product> deletedProducts = null;
        //get serrvice
        ProductService productService = ProductServiceSingleton.getInstance();
        UserService userService = UserServiceSingleton.getInstance();
        AddressService addressService = AddressServiceSingleton.getInstance();

        try {
//            products = productService.getNumberOfProducts(8);
//                products = productService.getLatestProductsStartingFromN(0, 16);
//            products = productService.getCheapestProductsStartingFromN(0, 2);
            products = productService.getProductsByUserId(user.getId());
            deletedProducts = productService.getDeletedProductsByUserId(user.getId());
            if (products.size() > 0) {
                for (Product product : products) {
                    product.setUsername(userService.getFullNameById(product.getUserId()));
                    product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                }
            }
            if (deletedProducts.size() > 0) {
                for (Product product : deletedProducts) {
                    product.setUsername(userService.getFullNameById(product.getUserId()));
                    product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("products", products);
        request.setAttribute("deletedProducts", deletedProducts);

        //close connection
        productService.closeConnection();
        userService.closeConnection();
        addressService.closeConnection();
        
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/product/product-manager-deleted.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}