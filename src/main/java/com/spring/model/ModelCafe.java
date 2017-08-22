package com.spring.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelCafe {
    
    private Integer cafeno = 0; //`cafeno` INT(11) NOT NULL AUTO_INCREMENT,
    private String brand = ""; //`brand` VARCHAR(50) NOT NULL,
    private String cafename = ""; //`cafename` VARCHAR(30) NOT NULL,
    private String cafeaddr = ""; //`cafeaddr` VARCHAR(30) NOT NULL,
    private String cafephone = ""; //`cafephone` VARCHAR(30) NULL DEFAULT NULL,
    private Double avg_grade = 0.0; //`avg_grade` FLOAT NULL DEFAULT '0',
    private Integer review_count  = 0; //`review_count` INT(11) NULL DEFAULT '0',
    private Integer like_count = 0; //`like_count` INT(11) NULL DEFAULT '0',
    private String cafebigtype = ""; //`cafebigtype` VARCHAR(50) NOT NULL DEFAULT '카페',
    private String cafesmalltype = ""; //`cafesmalltype` VARCHAR(50) NOT NULL DEFAULT '프렌차이즈',
    private String businessnum = "";
    private String deliveryloc = "";
    private String opentime = "";
    
    public Integer getCafeno() {
        return cafeno;
    }
    public void setCafeno(Integer cafeno) {
        this.cafeno = cafeno;
    }
    public String getBrand() {
        return brand;
    }
    public void setBrand(String brand) {
        this.brand = brand;
    }
    public String getCafename() {
        return cafename;
    }
    public void setCafename(String cafename) {
        this.cafename = cafename;
    }
    public String getCafeaddr() {
        return cafeaddr;
    }
    public void setCafeaddr(String cafeaddr) {
        this.cafeaddr = cafeaddr;
    }
    public String getCafephone() {
        return cafephone;
    }
    public void setCafephone(String cafephone) {
        this.cafephone = cafephone;
    }
    public Double getAvg_grade() {
        return avg_grade;
    }
    public void setAvg_grade(Double avg_grade) {
        this.avg_grade = avg_grade;
    }
    public Integer getReview_count() {
        return review_count;
    }
    public void setReview_count(Integer review_count) {
        this.review_count = review_count;
    }
    public Integer getLike_count() {
        return like_count;
    }
    public void setLike_count(Integer like_count) {
        this.like_count = like_count;
    }
    public String getCafebigtype() {
        return cafebigtype;
    }
    public void setCafebigtype(String cafebigtype) {
        this.cafebigtype = cafebigtype;
    }
    public String getCafesmalltype() {
        return cafesmalltype;
    }
    public void setCafesmalltype(String cafesmalltype) {
        this.cafesmalltype = cafesmalltype;
    }
    public ModelCafe(Integer cafeno, String brand, String cafename,
            String cafeaddr, String cafephone, Double avg_grade,
            Integer review_count, Integer like_count, String cafebigtype,
            String cafesmalltype) {
        super();
        this.cafeno = cafeno;
        this.brand = brand;
        this.cafename = cafename;
        this.cafeaddr = cafeaddr;
        this.cafephone = cafephone;
        this.avg_grade = avg_grade;
        this.review_count = review_count;
        this.like_count = like_count;
        this.cafebigtype = cafebigtype;
        this.cafesmalltype = cafesmalltype;
    }
    public ModelCafe() {
        super();
    }
    public String getBusinessnum() {
        return businessnum;
    }
    public void setBusinessnum(String businessnum) {
        this.businessnum = businessnum;
    }
    public String getDeliveryloc() {
        return deliveryloc;
    }
    public void setDeliveryloc(String deliveryloc) {
        this.deliveryloc = deliveryloc;
    }
    public String getOpentime() {
        return opentime;
    }
    public void setOpentime(String opentime) {
        this.opentime = opentime;
    }
    public ModelCafe(Integer cafeno, String brand, String cafename,
            String cafeaddr, String cafephone, Double avg_grade,
            Integer review_count, Integer like_count, String cafebigtype,
            String cafesmalltype, String businessnum, String deliveryloc,
            String opentime) {
        super();
        this.cafeno = cafeno;
        this.brand = brand;
        this.cafename = cafename;
        this.cafeaddr = cafeaddr;
        this.cafephone = cafephone;
        this.avg_grade = avg_grade;
        this.review_count = review_count;
        this.like_count = like_count;
        this.cafebigtype = cafebigtype;
        this.cafesmalltype = cafesmalltype;
        this.businessnum = businessnum;
        this.deliveryloc = deliveryloc;
        this.opentime = opentime;
    }
    
    
    
}
