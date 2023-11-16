/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestModels;

import com.chohay.chohay.models.details.Details;
import com.chohay.chohay.models.details.RealEstateDetails;
import org.junit.Test;

/**
 *
 * @author caomi
 */
public class TestDetails {
    
    @Test
    public void testDetails(){
        Details details = new RealEstateDetails(200, "Co giay to");
        System.out.println(details.toJson());
        
    }
        
    
}
