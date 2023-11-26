/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

/**
 *
 * @author caomi
 */
public class UserServiceSingleton {
    private static UserService instance;

    private UserServiceSingleton() {
        // Khởi tạo WordService nếu chưa có instance
        instance = new UserService();
    }

    public static UserService getInstance() {
        if (instance == null) {
            synchronized (AddressService.class) {
                if (instance == null) {
                    new UserServiceSingleton();
                }
            }
        }
        return instance;
    }
}
