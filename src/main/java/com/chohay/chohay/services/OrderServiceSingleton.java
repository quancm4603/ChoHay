/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

/**
 *
 * @author caomi
 */
public class OrderServiceSingleton {
    private static OrderService instance;

    private OrderServiceSingleton() {
        // Khởi tạo WordService nếu chưa có instance
        instance = new OrderService();
    }

    public static OrderService getInstance() {
        if (instance == null) {
            synchronized (AddressService.class) {
                if (instance == null) {
                    new OrderServiceSingleton();
                }
            }
        }
        return instance;
    }
}
