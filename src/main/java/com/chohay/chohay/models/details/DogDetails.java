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
public class DogDetails extends PetDetails {

    private String breed;
    private int age;
    private int size;

    @Override
    public String toJson() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }

    public String ageToString() {
        switch (age) {
            case 0:
                return "Chó con (dưới 3 tháng tuổi)";
            case 1:
                return "Chó nhỏ (dưới 1 năm tuổi)";
            case 2:
                return "Chó lớn (hơn 1 tuổi)";
            case -1:
                return "Không xác định được";
            default:
                return "Không xác định";
        }
    }

    public String sizeToString() {
        switch (size) {
            case 1:
                return "Siêu nhỏ";
            case 2:
                return "Nhỏ";
            case 3:
                return "Trung bình";
            case 4:
                return "Lớn";
            default:
                return "Không xác định";
        }
    }
}
