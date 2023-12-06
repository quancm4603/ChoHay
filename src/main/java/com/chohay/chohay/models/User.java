/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.models;

/**
 *
 * @author caomi
 */
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
public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private String phone;
    private int addressId;
    private String fullName;
    private int role;
    private String avatar;
    
    //other details
    private String address;

    public User(int id, String username, String email, String password, String phone, int addressId, String fullName, int role, String avatar) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.addressId = addressId;
        this.fullName = fullName;
        this.role = role;
        this.avatar = avatar;
    }
    
    
    
}
