/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TestModels;

import com.google.gson.Gson;
import org.junit.Test;

/**
 *
 * @author caomi
 */
public class TestAddress {
    
    class Person{
        int id;
        String name;
      
    }
    
    
    @Test
    public void testGson(){
        Person person = new Person();
        person.id = 1;
        person.name = "quan";
        
        Gson gson = new Gson();
        String out = gson.toJson(person);
        System.out.println(out);
        Person another = gson.fromJson(out, Person.class);
        System.out.println(another.id);
        System.out.println(another.name);
        
        
    }
    
    
    
}
