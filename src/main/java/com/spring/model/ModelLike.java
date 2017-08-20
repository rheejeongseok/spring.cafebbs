package com.spring.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelLike {
   
    private Integer cafeno = 0; //`cafeno` INT(11) NOT NULL,
    private Integer userno = 0; //`userno` INT(11) NOT NULL,
    
    public Integer getCafeno() {
        return cafeno;
    }
    public void setCafeno(Integer cafeno) {
        this.cafeno = cafeno;
    }
    public Integer getUserno() {
        return userno;
    }
    public void setUserno(Integer userno) {
        this.userno = userno;
    }
    public ModelLike(Integer cafeno, Integer userno) {
        super();
        this.cafeno = cafeno;
        this.userno = userno;
    }
    public ModelLike() {
        super();
    }
    
    
}
