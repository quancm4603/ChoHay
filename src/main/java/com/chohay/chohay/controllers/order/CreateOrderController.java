/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.chohay.chohay.controllers.order;

import com.chohay.chohay.models.Order;
import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.AddressServiceSingleton;
import com.chohay.chohay.services.OrderService;
import com.chohay.chohay.services.OrderServiceSingleton;
import com.chohay.chohay.services.ProductService;
import com.chohay.chohay.services.ProductServiceSingleton;
import com.chohay.chohay.services.UserService;
import com.chohay.chohay.services.UserServiceSingleton;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet(name = "CreateOrderController", urlPatterns = {"/create-order"})
public class CreateOrderController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        Product product = null;

        // Lấy id từ request parameter
        String productIdParam = request.getParameter("id");

        // Kiểm tra nếu id không rỗng và là một số nguyên
        if (productIdParam != null && !productIdParam.isEmpty()) {
            try {
                int productId = Integer.parseInt(productIdParam);

                // Gọi ProductService để lấy thông tin Product từ id
                ProductService productService = ProductServiceSingleton.getInstance();
                UserService userService = UserServiceSingleton.getInstance();
                AddressService addressService = AddressServiceSingleton.getInstance();
                
                product = productService.getProductById(productId);

                // Nếu product tồn tại, đặt nó vào attribute và chuyển tiếp cho trang JSP
                if (product != null) {
                    product.setUsername(userService.getFullNameById(product.getUserId()));
                    product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                    request.setAttribute("product", product);
                } else {
                    // Xử lý khi không tìm thấy product
                    // Ví dụ: Hiển thị thông báo lỗi
                    request.setAttribute("errorMessage", "Không tìm thấy sản phẩm với ID: " + productId);
                }

                //close connection
                productService.closeConnection();
                userService.closeConnection();
                addressService.closeConnection();
                
            } catch (NumberFormatException | SQLException ex) {
                ex.printStackTrace();
                // Xử lý khi có lỗi xảy ra trong quá trình xử lý id
                // Ví dụ: Hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý ID sản phẩm.");
            }
        } else {
            // Xử lý khi không có id được cung cấp
            // Ví dụ: Hiển thị thông báo lỗi
            request.setAttribute("errorMessage", "Không có ID sản phẩm được cung cấp.");
        }
        if (product != null && product.getUserId() != userId) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/order/create-order.jsp");
            requestDispatcher.forward(request, response);
        } else {
            response.sendRedirect("./");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ request parameter
        String phone = request.getParameter("phone");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String street = request.getParameter("street");
        String comment = request.getParameter("comment");

        // Lấy các thông tin khác cần thiết tương tự
        try {
            // Chuyển đổi dữ liệu từ String sang các kiểu tương ứng
            int productId = Integer.parseInt(request.getParameter("id"));
            int sellerId = Integer.parseInt(request.getParameter("sellerId"));
            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("user");
            int customerId = user.getId();
            String customerName = user.getFullName();
            String customerEmail = user.getEmail();

            // Chuyển đổi các thông tin khác cần thiết tương tự
            // Tạo đối tượng Order từ thông tin nhận được
            Order order = new Order();
            order.setProductId(productId);
            order.setSellerId(sellerId);
            order.setCustomerId(customerId);
            order.setReceiverPhone(phone);
            order.setReceiverProvince(province);
            order.setReceiverCity(city);
            order.setReceiverDistrict(district);
            order.setReceiverStreet(street);
            order.setCustomerComment(comment);
            order.setReceiverName(customerName);
            order.setReceiverEmail(customerEmail);
            order.setStatus(0);

            // Gọi OrderService để thêm đơn hàng vào cơ sở dữ liệu
            OrderService orderService = OrderServiceSingleton.getInstance();
            ProductService productService = ProductServiceSingleton.getInstance();
            UserService userService = UserServiceSingleton.getInstance();
            AddressService addressService = AddressServiceSingleton.getInstance();
            
            Product product = productService.getProductById(productId);

            // Nếu product tồn tại, đặt nó vào attribute và chuyển tiếp cho trang JSP
            if (product != null) {
                product.setUsername(userService.getFullNameById(product.getUserId()));
                product.setAddress(addressService.getAddressById(product.getAddressId()).getAddress());
                request.setAttribute("product", product);
            } else {
                // Xử lý khi không tìm thấy product
                // Ví dụ: Hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Không tìm thấy sản phẩm với ID: " + productId);
            }
            
            int generatedOrderId = orderService.addOrder(order);

            //close connection
            productService.closeConnection();
            userService.closeConnection();
            addressService.closeConnection();
            orderService.closeConnection();

            // Kiểm tra xem đơn hàng đã được tạo thành công hay không
            if (generatedOrderId != -1) {
                // Nếu thành công, thực hiện các hành động tiếp theo (ví dụ: chuyển hướng, hiển thị thông báo)
                // Ví dụ: Hiển thị thông báo thành công
                request.setAttribute("order", order);
                request.setAttribute("status", "Tạo đơn thành công");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/order/order.jsp");
                requestDispatcher.forward(request, response);
            } else {
                // Xử lý khi không tạo được đơn hàng
                // Ví dụ: Hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Không thể tạo đơn hàng. Vui lòng thử lại sau.");
                response.sendRedirect("./");
            }

            // Đóng kết nối sau khi hoàn tất thao tác
            orderService.closeConnection();
        } catch (NumberFormatException | SQLException ex) {
            ex.printStackTrace();
            // Xử lý khi có lỗi xảy ra trong quá trình xử lý dữ liệu
            // Ví dụ: Hiển thị thông báo lỗi
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý dữ liệu. Vui lòng thử lại sau.");
        }
        
    }
    
}
