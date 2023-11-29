/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.services;

/**
 *
 * @author caomi
 */
public class FirebaseServiceSingleton {
    private static FirebaseService instance;

    private FirebaseServiceSingleton() {
        // Khởi tạo WordService nếu chưa có instance
        instance = new FirebaseService();
    }

    public static FirebaseService getInstance() {
        if (instance == null) {
            synchronized (AddressService.class) {
                if (instance == null) {
                    new FirebaseServiceSingleton();
                }
            }
        }
        return instance;
    }
}
