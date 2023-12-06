/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.home;

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
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    private static final int PRODUCTS_PER_PAGE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = null;
        int userId = -1; // Mặc định là -1 hoặc giá trị không hợp lệ nếu không có user

        if (session != null && session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
            userId = user.getId();
        }
        request.setCharacterEncoding("UTF-8");
        String keyword = request.getParameter("keyword");
        String category = request.getParameter("category");
        String pageStr = request.getParameter("page");
        int page = 1; // Trang mặc định là 1
        if (pageStr != null) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                // Xử lý nếu page không phải là số
                // Có thể điều hướng hoặc gửi thông báo lỗi về client
                // Ví dụ: response.sendRedirect("error.jsp");
            }
        }
        List<Product> products = null;
        // Lấy service
        ProductService productService = ProductServiceSingleton.getInstance();
        UserService userService = UserServiceSingleton.getInstance();
        AddressService addressService = AddressServiceSingleton.getInstance();
        try {
            // Tính toán chỉ số bắt đầu của sản phẩm trên trang
            int startIndex = (page - 1) * PRODUCTS_PER_PAGE;
            if (keyword != null && category != null) {
                // Nếu cả keyword và category đều được cung cấp
                products = productService.getProductsByKeywordAndCategoryWithPagination(keyword, category, startIndex, PRODUCTS_PER_PAGE, userId);
            } else if (keyword != null) {
                // Nếu chỉ có keyword được cung cấp
                products = productService.getProductsByKeywordWithPagination(keyword, startIndex, PRODUCTS_PER_PAGE, userId);
            } else if (category != null) {
                // Nếu chỉ có category được cung cấp
                products = productService.getProductsByCategoryWithPagination(category, startIndex, PRODUCTS_PER_PAGE, userId);
            }

            if (products.size() > 0) {
                for (Product product : products) {
                    product.setUsername(userService.getFullNameById(product.getUserId()));
                    product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Đóng kết nối
        productService.closeConnection();
        userService.closeConnection();
        addressService.closeConnection();
        // Cung cấp dữ liệu sản phẩm và thông tin phân trang cho request
        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("productsPerPage", PRODUCTS_PER_PAGE);
        RequestDispatcher rd = request.getRequestDispatcher("/views/home/search.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
