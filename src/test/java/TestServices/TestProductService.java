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
    
    @Test
    public void testAddProduct()throws SQLException{
        Product product = new Product();
        product.setUserId(7);
        product.setName("Exciter 155000");
        product.setDescription("Nguyen zin");
        product.setPrice(50000000);
        product.setImage("/images/products/exciter.png");
        product.setPhone("0123456789");
        //create new address
        Address address = new Address();
        address.setProvince("Binh DInh");
        address.setCity("Quy Nhon");
        address.setDistrict("Nhon Binh");
        address.setStreet("Phuong 5");
        AddressService addressService = new AddressService();
        //add new address to db
        int addressId = addressService.addAddress(address);
        
        product.setAddressId(addressId);
        product.setCategory("Vehicle");
        
        Details details = new VehicleDetails("Sport", 2020);
        product.setDetails(details);
        
        //add product
        System.out.println(productService.addProduct(product));
        
        
    }
    
    
}
