/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.chohay.chohay.models.details;

import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author caomi
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class RealEstateDetails extends Details{
    private double area;
    private String legit;
    
    @Override
    public String toJson(){
        Gson gson = new Gson();
        return gson.toJson(this);
    }

    
}
