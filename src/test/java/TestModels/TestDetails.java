/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestModels;

import com.chohay.chohay.models.details.ApartmentDetails;
import com.chohay.chohay.models.details.CatDetails;
import com.chohay.chohay.models.details.Details;
import com.chohay.chohay.models.details.DogDetails;
import com.chohay.chohay.models.details.LaptopDetails;
import com.chohay.chohay.models.details.PhoneDetails;
import com.google.gson.Gson;
import org.junit.Test;

/**
 *
 * @author LINH
 */
public class TestDetails {
    
    @Test
    public void testApartmentDetails(){
        Details details = new ApartmentDetails();
        
        Gson gson = new Gson();
        
        String json = gson.toJson(details);
        System.out.println(json);
        System.out.println("=================");
        Details reverseDetails = gson.fromJson(json, ApartmentDetails.class);
        
        System.out.println(reverseDetails);
        
        
    }
    
    @Test
    public void testDogDetails(){
        Details details = new DogDetails("", 0, 0);
        
        Gson gson = new Gson();
        
        String json = gson.toJson(details);
        System.out.println(json);
        System.out.println("=================");
        Details reverseDetails = gson.fromJson(json, DogDetails.class);
        
        System.out.println(reverseDetails);
        
        
    }
    
    @Test
    public void testCatDetails(){
        Details details = new CatDetails("", 0, 0);
        
        Gson gson = new Gson();
        
        String json = gson.toJson(details);
        System.out.println(json);
        System.out.println("=================");
        Details reverseDetails = gson.fromJson(json, CatDetails.class);
        
        System.out.println(reverseDetails);
        
        
    }
    
    @Test
    public void testPhoneDetails(){
        Details details = new PhoneDetails("", "", "", 0, "", "");
        
        Gson gson = new Gson();
        
        String json = gson.toJson(details);
        System.out.println(json);
        System.out.println("=================");
        Details reverseDetails = gson.fromJson(json, PhoneDetails.class);
        
        System.out.println(reverseDetails);
        
        
    }
    @Test
    public void testLaptopDetails(){
        Details details = new LaptopDetails("", "", "",0, 0, "", "",0, "", "");
        
        Gson gson = new Gson();
        
        String json = gson.toJson(details);
        System.out.println(json);
        System.out.println("=================");
        Details reverseDetails = gson.fromJson(json, LaptopDetails.class);
        
        System.out.println(reverseDetails);
        
        
    }
    
    
    
}
