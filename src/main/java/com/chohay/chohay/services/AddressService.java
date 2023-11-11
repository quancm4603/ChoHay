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

    // Thêm địa chỉ mới vào database
    public void addAddress(Address address) throws SQLException {
        String query = "INSERT INTO Addresses (province, city, district, street) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, address.getProvince());
            preparedStatement.setString(2, address.getCity());
            preparedStatement.setString(3, address.getDistrict());
            preparedStatement.setString(4, address.getStreet());
            preparedStatement.executeUpdate();
        }
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
}
