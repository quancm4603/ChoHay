/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.models;

/**
 *
 * @author caomi
 */
import java.text.DecimalFormat;
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
public class Order {
    private int id;
    private int productId;
    private int sellerId;
    private int customerId;
    private String receiverName;
    private String receiverPhone;
    private String receiverEmail;
    private String receiverProvince;
    private String receiverCity;
    private String receiverDistrict;
    private String receiverStreet;
    private int status;
    private String customerComment;
    
    //more details
    
    private String sellerName;
    private String sellerPhone;
    private String sellerAddress;
    private String productName;
    private String productImage;
    private long price;

    public Order(int id, int productId, int sellerId, int customerId, String receiverName, String receiverPhone, String receiverEmail, String receiverProvince, String receiverCity, String receiverDistrict, String receiverStreet, int status, String customerComment) {
        this.id = id;
        this.productId = productId;
        this.sellerId = sellerId;
        this.customerId = customerId;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.receiverEmail = receiverEmail;
        this.receiverProvince = receiverProvince;
        this.receiverCity = receiverCity;
        this.receiverDistrict = receiverDistrict;
        this.receiverStreet = receiverStreet;
        this.status = status;
        this.customerComment = customerComment;
    }
    
    public String getAddressToString(){
        return receiverProvince + ", " + receiverCity + ", " + receiverDistrict;
    }
    
    public String getPriceToString() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###");
        return decimalFormat.format(price);
    }
    
}
