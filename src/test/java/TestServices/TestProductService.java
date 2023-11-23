/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestServices;

import com.chohay.chohay.models.Address;
import com.chohay.chohay.models.Product;
import com.chohay.chohay.models.details.ApartmentDetails;
import com.chohay.chohay.models.details.Details;
import com.chohay.chohay.models.details.DogDetails;
import com.chohay.chohay.models.details.PhoneDetails;
import com.chohay.chohay.models.details.VehicleDetails;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.ProductService;
import com.google.gson.Gson;
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
    
    @Test
    public void testAddNew() throws SQLException{
        Product product = new Product();
        String category = "Dog";
        Details details = null;
        String json = null;
        
        product.setUserId(1);
        product.setName("Ihpne 17");
        product.setPrice(200000);
        product.setDescription("Rất đẹp ok nha ");
        product.setImage("/images/products/1.png");
        product.setPhone("0349782229");
        product.setAddressId(2);
        product.setCategory(category);
//        if (category != null && category.equals("Apartment")) {
//            details = new ApartmentDetails(
//                    2, 
//                    "Căn hộ", 
//                    2, 
//                    1, 
//                    "co phap ly", 
//                    "khong noi that", 
//                    20);
//        }else if(category != null && category.equals("Phone")){
//            details = new PhoneDetails(
//                    "new", 
//                    "apple", 
//                    "đen hồng", 
//                    64, 
//                    "vcl", 
//                    "abc");
//        }else if(category != null && category.equals("Phone")){
//            details = new DogDetails(
//                    "ChiHuahua", 
//                    1, 
//                    1);
//        }
        details = new ApartmentDetails(
                    2, 
                    "Căn hộ", 
                    2, 
                    1, 
                    "co phap ly", 
                    "khong noi that", 
                    20);
        product.setDetails(details);
        
        productService.addProduct(product);
        
        
    }
    

    
    
    
}
