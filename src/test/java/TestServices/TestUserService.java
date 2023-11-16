/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestServices;

import com.chohay.chohay.models.Address;
import com.chohay.chohay.models.User;
import com.chohay.chohay.services.AddressService;
import com.chohay.chohay.services.UserService;
import java.sql.SQLException;
import java.util.List;
import org.junit.Test;

/**
 *
 * @author caomi
 */
public class TestUserService {
    UserService userService = new UserService();
    
    //Passed
    @Test
    public void testListAll() throws SQLException{
        List<User> users = userService.getAllUsers();
        for(User user : users){
            System.out.println(user);
        }
    }
    
    
    //Passed
    @Test
    public void testAddUser() throws SQLException{
        User user = new User();
        user.setUsername("hunglm");
        user.setEmail("hunglm@gmail.com");
        user.setPassword("12345678");
        user.setPhone("0349782228");
        
        Address address = new Address();
        address.setProvince("Ha Noi");
        address.setCity("Ba Dinh");
        address.setDistrict("Phuc Xa");
        address.setStreet("Phuong 5");
        AddressService addressService = new AddressService();
        int addressId = addressService.addAddress(address);
        user.setAddressId(addressId);
        user.setFullName("Lê Mạnh Hùng");
        user.setRole(2);
        user.setAvatar("/images/1.png");
        System.out.println(userService.addUser(user));
        
    }
    
    //Not pass
    @Test
    public void testDeleteUser()throws SQLException{
        userService.deleteUser(1);
        testListAll();
    }
    
    //Passed
    @Test
    public void testValidateUser()throws SQLException{
        System.out.println(userService.validateUser("hunglm@gmail.com", "12345678"));
    }
    
    
    
    
    
}
