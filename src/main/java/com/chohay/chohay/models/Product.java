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
    
    public String getPriceToString() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###");
        return decimalFormat.format(price);
    }
    
}
