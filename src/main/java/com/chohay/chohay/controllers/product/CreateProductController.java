/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.product;

import com.chohay.chohay.models.Address;
import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.User;
import com.chohay.chohay.models.details.ApartmentDetails;
import com.chohay.chohay.models.details.Details;
import com.chohay.chohay.models.details.DogDetails;
import com.chohay.chohay.models.details.PhoneDetails;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.AddressServiceSingleton;
import com.chohay.chohay.services.FirebaseService;
import com.chohay.chohay.services.FirebaseServiceSingleton;
import com.chohay.chohay.services.ProductService;
import com.chohay.chohay.services.ProductServiceSingleton;
import java.io.IOException;
import java.sql.SQLException;
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
@MultipartConfig()
@WebServlet(name = "CreateProductController", urlPatterns = {"/create-product", "/dang-tin"})
public class CreateProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/product/create_product.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            //Get UserID
            HttpSession session = request.getSession(false);
            int userId = ((User) session.getAttribute("user")).getId();

            String name = request.getParameter("name");
            String category = request.getParameter("category");
            long price = Long.parseLong(request.getParameter("price"));
            String phone = request.getParameter("phone");
            
            String province = request.getParameter("province");
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String street = request.getParameter("street");
            String description = request.getParameter("description");
            Details details = null;
            
            //Get Details parameters
            if (category != null) {
                if (category.equals("Apartment")) {
                    details = new ApartmentDetails(
                            request.getParameter("type"),
                            Integer.parseInt(request.getParameter("bedroom")),
                            Integer.parseInt(request.getParameter("bathroom")),
                            request.getParameter("legalDocuments"),
                            request.getParameter("funiture"),
                            Double.parseDouble(request.getParameter("area"))
                    );
                }else if (category.equals("Phone")){
                    //Phone details
                    details = new PhoneDetails(
                            request.getParameter("status"),
                            request.getParameter("brand"),
                            request.getParameter("color"),
                            Integer.parseInt(request.getParameter("memory")),
                            request.getParameter("guarantee"),
                            request.getParameter("original")
                    );
                    
                }else if (category.equals("Dog")){
                    //Dog details
                    details = new DogDetails(
                            request.getParameter("breed"),
                            Integer.parseInt(request.getParameter("age")),
                            Integer.parseInt(request.getParameter("size"))
                    );
                    
                    
                }

            }

            //Create new Product object
            Product product = new Product();
            product.setName(name);
            product.setUserId(userId);
            product.setPrice(price);
            product.setDescription(description);

            // xu ly image
            

            // Nhận part là hình ảnh từ request
            Part filePart = request.getPart("image");
            FirebaseService firebaseService = FirebaseServiceSingleton.getInstance();
            
            String image = firebaseService.uploadImageFromPart(filePart, "product/" + userId + "/");

            //set image link
            product.setImage(image);

            //Lay parameter con lai
            product.setPhone(phone);

            //Tao adress moi
            Address address = new Address();
            address.setProvince(province);
            address.setCity(city);
            address.setDistrict(district);
            address.setStreet(street);

            AddressService addressService = AddressServiceSingleton.getInstance();
            int addressId = addressService.addAddress(address);
            product.setAddressId(addressId);
            product.setCategory(category);
            product.setDetails(details);
            
            //Add to product service
            ProductService productService = ProductServiceSingleton.getInstance();
            productService.addProduct(product);
            
            addressService.closeConnection();
            productService.closeConnection();
            
            response.sendRedirect("./");
            
            
        } catch (SQLException ex) {
            Logger.getLogger(CreateProductController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("./create-product");
        }
        
        

    }

}
