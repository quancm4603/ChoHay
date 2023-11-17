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
public class CarDetails extends VehicleDetails{
    
    private String brand;
    private String version;
    private String gearbox;
    private String fuel;
    private String original;
    private int numberOfSeat;
    private String color;
    private String lisencePlate;
    private double km;
    private String role;
    
    
    @Override
    public String toJson() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}
