/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

import com.chohay.chohay.models.Address;
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
public class AddressService {

    private Connection connection;

    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/chohay";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";

    public AddressService() {
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

    // Thêm địa chỉ mới vào database và trả về ID của địa chỉ vừa thêm
    public int addAddress(Address address) throws SQLException {
        int generatedId = -1; // Giá trị mặc định trả về nếu không có ID được sinh ra

        String query = "INSERT INTO Addresses (province, city, district, street) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, address.getProvince());
            preparedStatement.setString(2, address.getCity());
            preparedStatement.setString(3, address.getDistrict());
            preparedStatement.setString(4, address.getStreet());

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

    // Sửa thông tin địa chỉ trong database
    public void updateAddress(Address address) throws SQLException {
        String query = "UPDATE Addresses SET province=?, city=?, district=?, street=? WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, address.getProvince());
            preparedStatement.setString(2, address.getCity());
            preparedStatement.setString(3, address.getDistrict());
            preparedStatement.setString(4, address.getStreet());
            preparedStatement.setLong(5, address.getId());
            preparedStatement.executeUpdate();
        }
    }

    // Xóa địa chỉ từ database
    public void deleteAddress(long addressId) throws SQLException {
        String query = "DELETE FROM Addresses WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setLong(1, addressId);
            preparedStatement.executeUpdate();
        }
    }

    // Lấy danh sách địa chỉ từ database
    public List<Address> getAllAddresses() throws SQLException {
        List<Address> addresses = new ArrayList<>();
        String query = "SELECT * FROM Addresses";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Address address = new Address();
                address.setId(resultSet.getInt("id"));
                address.setProvince(resultSet.getString("province"));
                address.setCity(resultSet.getString("city"));
                address.setDistrict(resultSet.getString("district"));
                address.setStreet(resultSet.getString("street"));
                addresses.add(address);
            }
        }
        return addresses;
    }

    // Lấy địa chỉ từ database dựa trên id
    public Address getAddressById(int addressId) throws SQLException {
        Address address = null;
        String query = "SELECT * FROM Addresses WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setLong(1, addressId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    address = new Address();
                    address.setId(resultSet.getInt("id"));
                    address.setProvince(resultSet.getString("province"));
                    address.setCity(resultSet.getString("city"));
                    address.setDistrict(resultSet.getString("district"));
                    address.setStreet(resultSet.getString("street"));
                }
            }
        }
        return address;
    }

}
