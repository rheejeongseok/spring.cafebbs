package com.spring.cafebbs.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelMenu {
   
   private String brand = ""; //`brand` VARCHAR(50) NULL DEFAULT NULL,
   private Integer menu_id = 0; //`menu_id` INT(11) NOT NULL AUTO_INCREMENT,
   private String menucd = ""; //`menucd` VARCHAR(50) NULL DEFAULT NULL,
   private String menu_name = ""; //`menu_name` VARCHAR(50) NULL DEFAULT NULL,
   private Integer price = 0; //`price` INT(11) NULL DEFAULT NULL,
   private String description = ""; //`description` VARCHAR(50) NULL DEFAULT NULL,
   
   public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public Integer getMenu_id() {
        return menu_id;
    }
    public void setMenu_id(Integer menu_id) {
        this.menu_id = menu_id;
    }
    public String getMenucd() {
        return menucd;
    }
    public void setMenucd(String menucd) {
        this.menucd = menucd;
    }
    public String getMenu_name() {
        return menu_name;
    }
    public void setMenu_name(String menu_name) {
        this.menu_name = menu_name;
    }
    public Integer getPrice() {
        return price;
    }
    public void setPrice(Integer price) {
        this.price = price;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public ModelMenu(String brand, Integer menu_id, String menucd,
            String menu_name, Integer price, String description) {
        super();
        this.brand = brand;
        this.menu_id = menu_id;
        this.menucd = menucd;
        this.menu_name = menu_name;
        this.price = price;
        this.description = description;
    }
    public ModelMenu() {
        super();
    }
   
    
   
    
}
