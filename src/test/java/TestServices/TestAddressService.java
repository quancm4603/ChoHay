/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestServices;

import com.chohay.chohay.models.Address;
import com.chohay.chohay.services.AddressService;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.junit.Test;

/**
 *
 * @author caomi
 */
public class TestAddressService {
    private AddressService addressService = new AddressService();
    
    @Test
    public void testAddAddress() throws SQLException{
        Address address = new Address();
        address.setProvince("Phu Yen");
        address.setCity("Dong Hoa");
        address.setDistrict("Hoa Thanh");
        address.setStreet("Hoa Thanh");
        
        System.out.println(addressService.addAddress(address));
        
    }
    
    @Test
    public void testUpdateAddress() throws SQLException{
        Address address = new Address();
        address.setProvince("Phu Yen");
        address.setCity("Dong Hoa");
        address.setDistrict("Hoa Thanh");
        address.setStreet("Hoa Thanh");       
        addressService.addAddress(address);
        
    }
    
    @Test
    public void testGetAddress() throws SQLException{
        Address address = addressService.getAddressById(1);
        System.out.println(address);
        
    }
    
    
    
    
}
