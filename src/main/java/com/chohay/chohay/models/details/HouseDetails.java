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
public class HouseDetails extends RealEstateDetails {

    private String type;
    private int bedroom;
    private int bathroom;
    private int numberOfFloor;
    private String legalDocuments;
    private String funiture;
    private double area;
    private double length;
    private double width;

    @Override
    public String toJson() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}
