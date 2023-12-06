/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.chohay.chohay.controllers.user;

import com.chohay.chohay.models.Address;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.AddressServiceSingleton;
import com.chohay.chohay.services.FirebaseService;
import com.chohay.chohay.services.FirebaseServiceSingleton;
import com.chohay.chohay.services.UserService;
import com.chohay.chohay.services.UserServiceSingleton;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name="ChangeAddressController", urlPatterns={"/change-address"})
public class ChangeAddressController extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //Get UserID
        HttpSession session = request.getSession(false);
        int userId = ((User) session.getAttribute("user")).getId();
        
        request.setCharacterEncoding("UTF-8");
        
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String street = request.getParameter("street");
        
        if(province != null && city != null && district != null && street != null){
            //get service
            UserService userService = UserServiceSingleton.getInstance();
            AddressService addressService = AddressServiceSingleton.getInstance();
            
            try {
                Address address = addressService.getAddressById(userService.getUserDetailsById(userId).getAddressId());
                address.setProvince(province);
                address.setCity(city);
                address.setDistrict(district);
                address.setStreet(street);
                
                addressService.updateAddress(address);
            } catch (SQLException ex) {
                Logger.getLogger(ChangeAddressController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //close connection
            userService.closeConnection();
            addressService.closeConnection();
        }
        response.sendRedirect("./user");
        
    }


}
