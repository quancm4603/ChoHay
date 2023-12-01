/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.product;

import com.chohay.chohay.models.Address;
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
@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            //Get ProductService
            ProductService productService = ProductServiceSingleton.getInstance();

            Product product = productService.getProductById(id);
            //Close connection
            productService.closeConnection();

            if (product != null) {
                request.setAttribute("product", product);
                //Get Address service
                AddressService addressService = AddressServiceSingleton.getInstance();
                Address address = addressService.getAddressById(product.getAddressId());
                //Close address connection
                addressService.closeConnection();
                
                //Get User service
                UserService userService = UserServiceSingleton.getInstance();
                User shop = userService.getUserDetailsById(product.getUserId());
                //Close user connection
                userService.closeConnection();
                
                request.setAttribute("shop", shop);
                request.setAttribute("address", address);
                
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/product/product.jsp");
                requestDispatcher.forward(request, response);
            }else{
                response.sendError(404);
            }

            
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
