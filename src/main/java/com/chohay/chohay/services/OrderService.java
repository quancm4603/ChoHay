/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

/**
 *
 * @author caomi
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chohay.chohay.models.Order;

public class OrderService {

    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/chohay";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    public OrderService() {
    }

    private Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Close the database connection
    public void closeConnection() {
        try {
            Connection connection = getConnection();
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Thêm đơn hàng mới vào database
    // Thêm đơn hàng mới vào database
    public int addOrder(Order order) throws SQLException {
        int generatedId = -1; // Giá trị mặc định trả về nếu không có ID được sinh ra
        String query = "INSERT INTO Orders (product_id, seller_id, customer_id, receiver_name, receiver_phone, receiver_email, receiver_province, receiver_city, receiver_district, receiver_street, status, customer_comment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, order.getProductId());
            preparedStatement.setInt(2, order.getSellerId());
            preparedStatement.setInt(3, order.getCustomerId());
            preparedStatement.setString(4, order.getReceiverName());
            preparedStatement.setString(5, order.getReceiverPhone());
            preparedStatement.setString(6, order.getReceiverEmail());
            preparedStatement.setString(7, order.getReceiverProvince());
            preparedStatement.setString(8, order.getReceiverCity());
            preparedStatement.setString(9, order.getReceiverDistrict());
            preparedStatement.setString(10, order.getReceiverStreet());
            preparedStatement.setInt(11, order.getStatus());
            preparedStatement.setString(12, order.getCustomerComment());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Thêm đơn hàng không thành công, không có hàng nào được tạo ra.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1); // Lấy ID được sinh ra
                } else {
                    throw new SQLException("Thêm đơn hàng không thành công, không có ID được tạo ra.");
                }
            }
        }
        return generatedId; // Trả về ID của đơn hàng vừa thêm vào
    }

    public Order getOrderById(int orderId) throws SQLException {
        Order order = null;
        String query = "SELECT * FROM Orders WHERE id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, orderId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    order = extractOrderFromResultSet(resultSet);
                }
            }
        }
        return order;
    }

    public List<Order> getOrdersByCustomerId(int customerId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE customer_id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Order order = extractOrderFromResultSet(resultSet);
                    orders.add(order);
                }
            }
        }
        return orders;
    }

    public List<Order> getOrdersBySellerId(int sellerId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE seller_id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, sellerId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Order order = extractOrderFromResultSet(resultSet);
                    orders.add(order);
                }
            }
        }
        return orders;
    }

    // Hàm trợ giúp để tạo đối tượng Order từ ResultSet
    private Order extractOrderFromResultSet(ResultSet resultSet) throws SQLException {
        Order order = new Order();
        order.setId(resultSet.getInt("id"));
        order.setProductId(resultSet.getInt("product_id"));
        order.setSellerId(resultSet.getInt("seller_id"));
        order.setCustomerId(resultSet.getInt("customer_id"));
        order.setReceiverName(resultSet.getString("receiver_name"));
        order.setReceiverPhone(resultSet.getString("receiver_phone"));
        order.setReceiverEmail(resultSet.getString("receiver_email"));
        order.setReceiverProvince(resultSet.getString("receiver_province"));
        order.setReceiverCity(resultSet.getString("receiver_city"));
        order.setReceiverDistrict(resultSet.getString("receiver_district"));
        order.setReceiverStreet(resultSet.getString("receiver_street"));
        order.setStatus(resultSet.getInt("status"));
        order.setCustomerComment(resultSet.getString("customer_comment"));
        return order;
    }

    public void setOrderStatus(int orderId, int newStatus) throws SQLException {
        String query = "UPDATE Orders SET status = ? WHERE id = ?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, newStatus);
            preparedStatement.setInt(2, orderId);

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Cập nhật trạng thái đơn hàng không thành công, không có đơn hàng nào được cập nhật.");
            }
        }
    }

    // Các phương thức xử lý đơn hàng khác (sửa, xóa, lấy thông tin đơn hàng, ...)
    // ...
}
