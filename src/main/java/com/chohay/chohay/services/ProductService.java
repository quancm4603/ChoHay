/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.details.Details;
import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author caomi
 */
public class ProductService {

    private Connection connection;

    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/chohay";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    public ProductService() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // Close the database connection
    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int addProduct(Product product) throws SQLException {
        int generatedId = -1; // Giá trị mặc định trả về nếu không có ID được sinh ra
        String query = "INSERT INTO Products (user_id, name, price, description, image, phone, address_id, category, details) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, product.getUserId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setLong(3, product.getPrice());
            preparedStatement.setString(4, product.getDescription());
            preparedStatement.setString(5, product.getImage());
            preparedStatement.setString(6, product.getPhone());
            preparedStatement.setInt(7, product.getAddressId());
            preparedStatement.setString(8, product.getCategory());
            preparedStatement.setString(9, product.getDetails().toJson());
            
            int affectedRows = preparedStatement.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Thêm địa chỉ không thành công, không có hàng nào được tạo ra.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1); // Lấy ID được sinh ra
                } else {
                    throw new SQLException("Thêm địa chỉ không thành công, không có ID được tạo ra.");
                }
            }
        }
        return generatedId; // Trả về ID của địa chỉ vừa thêm vào

    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Product product = extractProductFromResultSet(resultSet);
                products.add(product);
            }
        }
        return products;
    }

    // Phương thức hỗ trợ để chuyển dữ liệu từ ResultSet thành đối tượng User
    private Product extractProductFromResultSet(ResultSet resultSet) throws SQLException {
        Product product = new Product();
        product.setId(resultSet.getInt("id"));
        product.setUserId(resultSet.getInt("user_id"));
        product.setName(resultSet.getString("name"));
        product.setPrice(resultSet.getLong("price"));
        product.setDescription(resultSet.getString("description"));
        product.setImage(resultSet.getString("image"));
        product.setPhone(resultSet.getString("phone"));
        product.setAddressId(resultSet.getInt("address_id"));
        product.setCategory(resultSet.getString("category"));
        Gson gson = new Gson();
        product.setDetails(gson.fromJson(resultSet.getString("details"), Details.class));
        return product;
    }

}
