/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.details.ApartmentDetails;
import com.chohay.chohay.models.details.Details;
import com.chohay.chohay.models.details.DogDetails;
import com.chohay.chohay.models.details.PhoneDetails;
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

    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/chohay";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    public ProductService() {
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

    public int addProduct(Product product) throws SQLException {
        int generatedId = -1; // Giá trị mặc định trả về nếu không có ID được sinh ra
        String query = "INSERT INTO Products (user_id, name, price, description, image, phone, address_id, category, details) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
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
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Product product = extractProductFromResultSet(resultSet);
                products.add(product);
            }
        }
        return products;
    }

    public Product getProductById(int productId) throws SQLException {
        Product product = null;
        String query = "SELECT * FROM Products WHERE id = ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, productId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    product = extractProductFromResultSet(resultSet);
                }
            }
        }
        return product;
    }

    public List<Product> getProductsByKeyword(String keyword) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE name LIKE ? AND status = 0";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, "%" + keyword + "%");
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Product> getProductsByKeywordWithPagination(String keyword, int startIndex, int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE name LIKE ? AND status = 0 ORDER BY updated_at DESC LIMIT ? OFFSET ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setInt(2, limit);
            preparedStatement.setInt(3, startIndex);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
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
        product.setUpdatedAt(resultSet.getTimestamp("updated_at"));
        product.setStatus(resultSet.getInt("status"));
        Gson gson = new Gson();
        if (product.getCategory().equals("Phone")) {
            product.setDetails(gson.fromJson(resultSet.getString("details"), PhoneDetails.class));
        }
        if (product.getCategory().equals("Apartment")) {
            product.setDetails(gson.fromJson(resultSet.getString("details"), ApartmentDetails.class));
        }
        if (product.getCategory().equals("Dog")) {
            product.setDetails(gson.fromJson(resultSet.getString("details"), DogDetails.class));
        }
        return product;
    }

    public List<Product> getNumberOfProducts(int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE status = 0  LIMIT ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, limit);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Product> getLatestProductsStartingFromN(int n, int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE status = 0 ORDER BY updated_at DESC LIMIT ? OFFSET ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, n);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Product> getCheapestProductsStartingFromN(int n, int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE status = 0 ORDER BY price ASC LIMIT ? OFFSET ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, n);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Product> getMostExpensiveProductsStartingFromN(int n, int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE status = 0 ORDER BY price DESC LIMIT ? OFFSET ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, n);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Product> getProductsByKeywordAndCategoryWithPagination(String keyword, String category, int startIndex, int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE name LIKE ? AND category = ? AND status = 0 ORDER BY updated_at DESC LIMIT ? OFFSET ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setString(2, category);
            preparedStatement.setInt(3, limit);
            preparedStatement.setInt(4, startIndex);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Product> getProductsByCategoryWithPagination(String category, int startIndex, int limit) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE category = ?  AND status = 0 ORDER BY updated_at DESC LIMIT ? OFFSET ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, category);
            preparedStatement.setInt(2, limit);
            preparedStatement.setInt(3, startIndex);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public List<Product> getProductsByUserId(int userId) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE user_id = ? AND status = 0";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = extractProductFromResultSet(resultSet);
                    products.add(product);
                }
            }
        }
        return products;
    }

    public boolean deleteProductById(int productId) throws SQLException {
        String query = "UPDATE Products SET status = -1 WHERE id = ?";
        try (Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, productId);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        }
    }

}
