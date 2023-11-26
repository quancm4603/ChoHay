/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

/**
 *
 * @author caomi
 */
public class ProductServiceSingleton {
    private static ProductService instance;

    private ProductServiceSingleton() {
        // Khởi tạo WordService nếu chưa có instance
        instance = new ProductService();
    }

    public static ProductService getInstance() {
        if (instance == null) {
            synchronized (AddressService.class) {
                if (instance == null) {
                    new ProductServiceSingleton();
                }
            }
        }
        return instance;
    }
}
