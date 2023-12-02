/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.models;

/**
 *
 * @author caomi
 */
import com.chohay.chohay.models.details.Details;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author caomi
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Product {

    private int id;
    private int userId;
    private String name;
    private long price;
    private String description;
    private String image;
    private String phone;
    private int addressId;
    private String category;
    private Details details;
    private int status;

    //other details
    private String username;
    private Timestamp updatedAt;
    private String address;

    public Product(int id, int userId, String name, long price, String description, String image, String phone, int addressId, String category, Details details) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.phone = phone;
        this.addressId = addressId;
        this.category = category;
        this.details = details;
    }

    public String getPriceToString() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###");
        return decimalFormat.format(price);
    }

    // Định nghĩa phương thức để lấy thời gian đã trôi qua dựa trên updatedAt
    public String getTimeDifference() {
        LocalDateTime currentTime = LocalDateTime.now();
        LocalDateTime updatedTime = updatedAt.toLocalDateTime();

        Duration duration = Duration.between(updatedTime, currentTime);
        long hours = duration.toHours();

        return hours + " giờ trước";
    }

}
