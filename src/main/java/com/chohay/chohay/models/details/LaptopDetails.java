/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.models.details;

/**
 *
 * @author LINH
 */
import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LaptopDetails extends ElectroniceDeviceDetails{
    private String status;
    private String brand;
    private String microprocessor;
    private String RAM;
    private int hardDrive;
    private String typeOfHardDrive;
    private String card;
    private String screenSize;
    private String guarantee;
    private String original;
    private String role;
    
    
    
    @Override
    public String toJson() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}
