/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.authen;

import com.chohay.chohay.models.Address;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.AddressServiceSingleton;
import com.chohay.chohay.services.UserService;
import com.chohay.chohay.services.UserServiceSingleton;
import java.io.IOException;
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
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("./");
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/authen/register.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Lấy từng tham số từ form và gán cho biến String tương ứng
            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String province = request.getParameter("province");
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String street = request.getParameter("street");

            // Tạo đối tượng User và gán giá trị từ form vào các thuộc tính của User
            User user = new User();
            user.setUsername(username);
            user.setFullName(fullname);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);
            user.setAvatar("");
            user.setRole(2);

            //Get Address Service
            AddressService addressService = AddressServiceSingleton.getInstance();

            Address address = new Address();
            address.setProvince(province);
            address.setCity(city);
            address.setDistrict(district);
            address.setStreet(street);

            //save address
            int addressId = addressService.addAddress(address);
            addressService.closeConnection();

            //set id address to user
            user.setAddressId(addressId);

            // Get userService
            UserService userService = UserServiceSingleton.getInstance();
            userService.addUser(user);

            //Close connection
            userService.closeConnection();

            response.sendRedirect("./");

        } catch (Exception e) {
            request.setAttribute("status", e.getMessage());
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/authen/register.jsp");
            requestDispatcher.forward(request, response);
        }

    }

}
