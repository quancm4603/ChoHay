/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.chohay.chohay.controllers.authen;

import com.chohay.chohay.models.User;
import com.chohay.chohay.services.UserService;
import com.chohay.chohay.services.UserServiceSingleton;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author caomi
 */
@WebServlet(name="LoginController", urlPatterns={"/login", "/dang-nhap"})
public class LoginController extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("./");
        }else{
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/authen/login.jsp");
            requestDispatcher.forward(request, response);
        }
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            //Get login params
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            //Valitade
            UserService userService = UserServiceSingleton.getInstance();
            if (userService.validateUser(username, password)) {
                HttpSession session = request.getSession();
                User user = userService.getUserByUserNameOrEmail(username);
                session.setAttribute("user", user);
                
                String remember = request.getParameter("remember");
                if (remember != null) {
                    Cookie usernameCookie = new Cookie("username", username);
                    usernameCookie.setMaxAge(60*24*3);
                    Cookie passwordCookie = new Cookie("password", password);
                    passwordCookie.setMaxAge(60*24*3);
                    response.addCookie(usernameCookie);
                    response.addCookie(passwordCookie);
                    
                }
                
                response.sendRedirect("./");
            }else{
                response.sendRedirect("./login");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
    }


}
