/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestServices;

import com.chohay.chohay.models.Address;
import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.details.Details;
import com.chohay.chohay.models.details.VehicleDetails;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.ProductService;
import java.sql.SQLException;
import java.util.List;
import org.junit.Test;

/**
 *
 * @author caomi
 */
public class TestProductService {
    ProductService productService = new ProductService();
    
    @Test
    public void testListAllProduct() throws SQLException{
        
        List<Product> products = productService.getAllProducts();
        for(Product product : products){
            System.out.println(product);
        }
        
    }
    

    
    
    
}
