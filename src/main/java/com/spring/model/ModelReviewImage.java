package com.spring.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ModelReviewImage {
    

    private Integer reviewfileno = 0; //`reviewfileno` INT(11) NOT NULL AUTO_INCREMENT,
    private String filename = ""; //`filename` VARCHAR(50) NULL DEFAULT NULL,
    private String imagetype = ""; //`imagetype` VARCHAR(30) NULL DEFAULT NULL,
    private Integer filesize = 0; //`filesize` INT(11) NULL DEFAULT NULL,
    private Integer commentno = 0; //`commentno` INT(11) NULL DEFAULT NULL,
    private String tempfilename = ""; //`tempfilename` VARCHAR(40) NULL DEFAULT NULL,
    private String imageBase64  = ""; //`imageBase64` VARCHAR(50) NULL DEFAULT NULL,
    private Byte[] imageData = null; //`imageData` BLOB NULL,
    private CommonsMultipartFile image;
    public Integer getReviewfileno() {
        return reviewfileno;
    }
    public void setReviewfileno(Integer reviewfileno) {
        this.reviewfileno = reviewfileno;
    }
    public String getFilename() {
        return filename;
    }
    public void setFilename(String filename) {
        this.filename = filename;
    }
    public String getImagetype() {
        return imagetype;
    }
    public void setImagetype(String imagetype) {
        this.imagetype = imagetype;
    }
    public Integer getFilesize() {
        return filesize;
    }
    public void setFilesize(Integer filesize) {
        this.filesize = filesize;
    }
    public Integer getCommentno() {
        return commentno;
    }
    public void setCommentno(Integer commentno) {
        this.commentno = commentno;
    }
    public String getTempfilename() {
        return tempfilename;
    }
    public void setTempfilename(String tempfilename) {
        this.tempfilename = tempfilename;
    }
    public String getImageBase64() {
        return imageBase64;
    }
    public void setImageBase64(String imageBase64) {
        this.imageBase64 = imageBase64;
    }
    public Byte[] getImageData() {
        return imageData;
    }
    public void setImageData(Byte[] imageData) {
        this.imageData = imageData;
    }
    public CommonsMultipartFile getImage() {
        return image;
    }
    public void setImage(CommonsMultipartFile image) {
        this.image = image;
    }
    public ModelReviewImage(Integer reviewfileno, String filename,
            String imagetype, Integer filesize, Integer commentno,
            String tempfilename, String imageBase64, Byte[] imageData,
            CommonsMultipartFile image) {
        super();
        this.reviewfileno = reviewfileno;
        this.filename = filename;
        this.imagetype = imagetype;
        this.filesize = filesize;
        this.commentno = commentno;
        this.tempfilename = tempfilename;
        this.imageBase64 = imageBase64;
        this.imageData = imageData;
        this.image = image;
    }
    
    

}
