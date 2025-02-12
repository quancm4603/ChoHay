/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

import com.chohay.chohay.models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/chohay";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    public UserService() {
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

    // Thêm người dùng mới vào database
    public int addUser(User user) throws SQLException {
        int generatedId = -1; // Giá trị mặc định trả về nếu không có ID được sinh ra
        String query = "INSERT INTO Users (username, email, password, phone, address_id, full_name, role, avatar) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setInt(5, user.getAddressId());
            preparedStatement.setString(6, user.getFullName());
            preparedStatement.setInt(7, user.getRole());
            preparedStatement.setString(8, user.getAvatar());

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

    // Sửa thông tin người dùng trong database
    public void updateUser(User user) throws SQLException {
        String query = "UPDATE Users SET username=?, email=?, password=?, phone=?, address_id=?, full_name=?, role=?, avatar=? WHERE id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setInt(5, user.getAddressId());
            preparedStatement.setString(6, user.getFullName());
            preparedStatement.setInt(7, user.getRole());
            preparedStatement.setString(8, user.getAvatar());
            preparedStatement.setInt(9, user.getId());
            preparedStatement.executeUpdate();
        }
    }

    // Xóa người dùng từ database dựa trên id
    //Not pass
    public void deleteUser(int userId) throws SQLException {

        //Delete User
        String queryUser = "DELETE FROM Users WHERE id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(queryUser)) {
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        }
    }

    // Lấy danh sách tất cả người dùng từ database
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                User user = extractUserFromResultSet(resultSet);
                users.add(user);
            }
        }
        return users;
    }

    // Lấy người dùng từ database dựa trên id
    public User getUserById(int userId) throws SQLException {
        User user = null;
        String query = "SELECT * FROM Users WHERE id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = extractUserFromResultSet(resultSet);
                }
            }
        }
        return user;
    }

    // Lấy shop details
    public User getUserDetailsById(int userId) throws SQLException {
        User user = null;
        String query = "SELECT * FROM Users WHERE id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = extractUserFromResultSet(resultSet);
                    user.setUsername(null);
                    user.setPassword(null);
                    user.setEmail(null);
                }
            }
        }
        return user;
    }

    public String getFullNameById(int userId) throws SQLException {
        String fullName = null;
        String query = "SELECT full_name FROM Users WHERE id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    fullName = resultSet.getString("full_name");
                }
            }
        }
        return fullName;
    }

    // Lấy người dùng từ database dựa trên username OR email
    public User getUserByUserNameOrEmail(String username) throws SQLException {
        User user = null;
        String query = "SELECT * FROM Users WHERE username=? OR email=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    user = extractUserFromResultSet(resultSet);
                }
            }
        }
        return user;
    }

    // Hàm validate đăng nhập người dùng
    public boolean validateUser(String username, String password) throws SQLException {
        boolean isValid = false;
        String query = "SELECT * FROM Users WHERE username=? OR email=? AND password=?";

        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // Nếu tồn tại người dùng với username và password tương ứng
                // thì isValid sẽ được set thành true
                if (resultSet.next()) {
                    isValid = true;
                }
            }
        }

        return isValid;
    }

    // Phương thức hỗ trợ để chuyển dữ liệu từ ResultSet thành đối tượng User
    private User extractUserFromResultSet(ResultSet resultSet) throws SQLException {
        User user = new User();
        user.setId(resultSet.getInt("id"));
        user.setUsername(resultSet.getString("username"));
        user.setEmail(resultSet.getString("email"));
        user.setPassword(resultSet.getString("password"));
        user.setPhone(resultSet.getString("phone"));
        user.setAddressId(resultSet.getInt("address_id"));
        user.setFullName(resultSet.getString("full_name"));
        user.setRole(resultSet.getInt("role"));
        user.setAvatar(resultSet.getString("avatar"));
        return user;
    }

    public void editUserAvatarById(int userId, String newAvatar) throws SQLException {
        String query = "UPDATE Users SET avatar=? WHERE id=?";
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, newAvatar);
            preparedStatement.setInt(2, userId);
            preparedStatement.executeUpdate();
        }
    }

}
