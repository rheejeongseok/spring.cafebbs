package com.spring.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelUser {
    

    private Integer userno = 0; //`userno` INT(11) NOT NULL AUTO_INCREMENT,
    private Integer userlevel = 0; //`userlevel` INT(11) NULL DEFAULT '1',
    private String email = ""; //`email` VARCHAR(40) NOT NULL,
    private String passwd = ""; //`passwd` VARCHAR(30) NOT NULL,
    private String userphone = ""; //`userphone` VARCHAR(30) NOT NULL,
    private String useraddr = ""; //`useraddr` VARCHAR(100) NULL DEFAULT NULL,
    private String sex = ""; //`sex` VARCHAR(30) NULL DEFAULT NULL,
    private Integer emailselect  = 0; //`emailselect` VARCHAR(30) NULL DEFAULT '0',
    private String usernickname = ""; //`usernickname` VARCHAR(30) NOT NULL,
    public Integer getUserno() {
        return userno;
    }
    public void setUserno(Integer userno) {
        this.userno = userno;
    }
    public Integer getUserlevel() {
        return userlevel;
    }
    public void setUserlevel(Integer userlevel) {
        this.userlevel = userlevel;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPasswd() {
        return passwd;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    public String getUserphone() {
        return userphone;
    }
    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }
    public String getUseraddr() {
        return useraddr;
    }
    public void setUseraddr(String useraddr) {
        this.useraddr = useraddr;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public Integer getEmailselect() {
        return emailselect;
    }
    public void setEmailselect(Integer emailselect) {
        this.emailselect = emailselect;
    }
    public String getUsernickname() {
        return usernickname;
    }
    public void setUsernickname(String usernickname) {
        this.usernickname = usernickname;
    }
    public ModelUser(Integer userno, Integer userlevel, String email,
            String passwd, String userphone, String useraddr, String sex,
            Integer emailselect, String usernickname) {
        super();
        this.userno = userno;
        this.userlevel = userlevel;
        this.email = email;
        this.passwd = passwd;
        this.userphone = userphone;
        this.useraddr = useraddr;
        this.sex = sex;
        this.emailselect = emailselect;
        this.usernickname = usernickname;
    }
    public ModelUser() {
        super();
    }
    
    
}
