/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

/**
 *
 * @author caomi
 */
public class AddressServiceSingleton {
    private static AddressService instance;

    private AddressServiceSingleton() {
        // Khởi tạo WordService nếu chưa có instance
        instance = new AddressService();
    }

    public static AddressService getInstance() {
        if (instance == null) {
            synchronized (AddressService.class) {
                if (instance == null) {
                    new AddressServiceSingleton();
                }
            }
        }
        return instance;
    }
}
