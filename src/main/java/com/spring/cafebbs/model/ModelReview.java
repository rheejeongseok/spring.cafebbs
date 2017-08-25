package com.spring.cafebbs.model;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ModelReview {
    

   private Integer commentno  = 0; // `commentno` INT(11) NOT NULL AUTO_INCREMENT,
   private String usernickname = ""; // `usernickname` VARCHAR(30) NOT NULL,
   private Integer cafeno = 0; // `cafeno` INT(11) NULL DEFAULT NULL,
   private String content = ""; // `content` VARCHAR(40) NOT NULL,
   private Double grade = 0.0; // `grade` DOUBLE NOT NULL,
   private Date regdate = null; // `regdate` DATETIME NULL DEFAULT NULL,
   private Date updateDate = null; // `updateDate` DATETIME NULL DEFAULT NULL,
public Integer getCommentno() {
    return commentno;
}
public void setCommentno(Integer commentno) {
    this.commentno = commentno;
}
public String getUsernickname() {
    return usernickname;
}
public void setUsernickname(String usernickname) {
    this.usernickname = usernickname;
}
public Integer getCafeno() {
    return cafeno;
}
public void setCafeno(Integer cafeno) {
    this.cafeno = cafeno;
}
public String getContent() {
    return content;
}
public void setContent(String content) {
    this.content = content;
}
public Double getGrade() {
    return grade;
}
public void setGrade(Double grade) {
    this.grade = grade;
}
public Date getRegdate() {
    return regdate;
}
public void setRegdate(Date regdate) {
    this.regdate = regdate;
}
public Date getUpdateDate() {
    return updateDate;
}
public void setUpdateDate(Date updateDate) {
    this.updateDate = updateDate;
}
public ModelReview(Integer commentno, String usernickname, Integer cafeno,
        String content, Double grade, Date regdate, Date updateDate) {
    super();
    this.commentno = commentno;
    this.usernickname = usernickname;
    this.cafeno = cafeno;
    this.content = content;
    this.grade = grade;
    this.regdate = regdate;
    this.updateDate = updateDate;
}
public ModelReview() {
    super();
}
public ModelReview(Integer cafeno, String content) {
    // TODO Auto-generated constructor stub
    this.cafeno = cafeno;
    this.content = content;
}
   
   

}
