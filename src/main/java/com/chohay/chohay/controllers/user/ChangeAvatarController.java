/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.chohay.chohay.controllers.user;

import com.chohay.chohay.models.User;
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
import net.coobird.thumbnailator.Thumbnails;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.file.Paths;

/**
 *
 * @author caomi
 */
@MultipartConfig()
@WebServlet(name="ChangeAvatarController", urlPatterns={"/change-avatar"})
public class ChangeAvatarController extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //Get UserID
        HttpSession session = request.getSession(false);
        User user = ((User) session.getAttribute("user"));
        int userId = user.getId();
        Part image = request.getPart("avatar");
        if(image != null){
            //get service
            UserService userService = UserServiceSingleton.getInstance();
            FirebaseService firebaseService = FirebaseServiceSingleton.getInstance();
            
            // Nén hình ảnh trước khi tải lên
            InputStream inputStream = image.getInputStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            Thumbnails.of(inputStream)
                .size(200, 200) // Kích thước nén (ở đây là 200x200)
                .outputFormat("jpg") // Định dạng ảnh sau khi nén
                .toOutputStream(outputStream);
            
            // Tải ảnh nén lên Firebase
            String fileName = "avatar/" + userId + "/" + Paths.get(image.getSubmittedFileName()).getFileName().toString();
            String newAvatar = firebaseService.uploadImageFromInputStream(
                new ByteArrayInputStream(outputStream.toByteArray()), fileName, image.getContentType());
            
            try {
                userService.editUserAvatarById(userId, newAvatar);
                user.setAvatar(newAvatar);
                session.setAttribute("user", user);
            } catch (SQLException ex) {
                Logger.getLogger(ChangeAvatarController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            //close connection
            userService.closeConnection();
        }
        response.sendRedirect("./user");
        
    }


}
