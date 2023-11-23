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
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
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
            int price = Integer.parseInt(request.getParameter("price"));
            String phone = request.getParameter("phone");
            Part image = request.getPart("image");
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
                }

            }

            //Create new Product object
            Product product = new Product();
            product.setName(name);
            product.setUserId(userId);
            product.setPrice(price);
            product.setDescription(description);

            // xu ly image
            // path folder chua anh
            String folderSaveFile = "/images/products/" + userId;
            String pathUpload = request.getServletContext().getRealPath(folderSaveFile);
            // file name user upload
            String fileName = Paths.get(image.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(pathUpload))) {
                Files.createDirectories(Paths.get(pathUpload));
            }
            image.write(pathUpload + "/" + fileName);

            String imageSave = folderSaveFile + "/" + fileName;

            product.setImage(imageSave);

            //Lay parameter con lai
            product.setPhone(phone);

            //Tao adress moi
            Address address = new Address();
            address.setProvince(province);
            address.setCity(city);
            address.setDistrict(district);
            address.setStreet(street);

            AddressService addressService = new AddressService();
            int addressId = addressService.addAddress(address);
            product.setAddressId(addressId);
            product.setCategory(category);
            product.setDetails(details);
            
            //Add to product service
            ProductService productService = new ProductService();
            productService.addProduct(product);
            
            response.sendRedirect("./");
            
            
        } catch (SQLException ex) {
            Logger.getLogger(CreateProductController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("./create-product");
        }
        
        

    }

}
