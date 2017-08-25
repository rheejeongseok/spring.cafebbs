package com.spring.cafe;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.spring.cafebbs.model.ModelCafe;
import com.spring.cafebbs.model.ModelMenu;
import com.spring.cafebbs.model.ModelReview;
import com.spring.cafebbs.service.IServiceCafe;

public class TestCafe {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(TestCafe.class);
    
    private static ApplicationContext context = null;
    private static IServiceCafe svrcafe = null; 
    
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        context = new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml");
        svrcafe   = context.getBean("servicecafe", IServiceCafe.class);
        
    }
    
    
    
    @Test
    public void testgetNewReview() {
        
        List<ModelReview> result = svrcafe.getNewReview();
        assertEquals(result.size(), 5);
       
    }
    
    @Test
    public void testgetCafeBigTypeList() {
        
        List<ModelCafe> result = svrcafe.getCafeBigTypeList("펫");
        assertEquals(result.size(), 60);
       
    }
    
    @Test
    public void testgetCafeBrandList() {
        
        List<ModelCafe> result = svrcafe.getCafeBrandList("카페", "스타벅스");
        assertEquals(result.size(), 20);
       
    }
    
    @Test
    public void testgetCafeOne() {
        
        ModelCafe result = svrcafe.getCafeOne(251);
        assertEquals(result.getBrand(), "스타벅스");
       
    }
    
    @Test
    public void testgetMenuMain() {
        
        List<ModelMenu> result = svrcafe.getMenuMain("스타벅스");
        assertEquals(result.size(), 4);
       
    }
    
    @Test
    public void testgetMenuSub() {
        
        List<ModelMenu> result = svrcafe.getMenuSub("스타벅스");
        assertEquals(result.size(), 3);
       
    }
    
    @Test
    public void testgetReviewList() {
        
        List<ModelReview> result = svrcafe.getReviewList(442);
        assertEquals(result.size(), 4);
       
    }
    
    @Test
    public void testgetReviewOne() {
        
        ModelReview result = svrcafe.getReviewOne(442, 25);
        assertEquals(result.getContent(), "aaa");
       
    }
    
    @Test
    public void testgetCafeGrade() {
        
        Double result = svrcafe.getCafeGrade(442);
        assertEquals(result.intValue(), 3);
       
    }
    
    @Test
    public void testgetReviewCount() {
        
        int result = svrcafe.getReviewCount(442);
        assertEquals(result, 4);
       
    }
    
    @Test
    public void testgetLikeCount() {
        
        int result = svrcafe.getLikeCount(251);
        assertEquals(result, 0);
       
    }
    
    @Test
    public void testincreaseLike() {
        
        int result = svrcafe.increaseLike(251);
        assertEquals(result, 1);
       
    }
    
    @Test
    public void testincreaseReview() {
        
        int result = svrcafe.increaseReview(251);
        assertEquals(result, 1);
       
    }
    
    @Test
    public void testincreaseAvg() {
        
        int result = svrcafe.increaseAvg(251);
        assertEquals(result, 1);
       
    }
    
    @Test
    public void testinsertReview() {
        
        ModelReview review = new ModelReview();
        review.setContent("sssss");
        review.setGrade(3.3);
        review.setUsernickname("abcd");
        review.setCafeno(260);
        
        int result = svrcafe.insertReview(review); 
        assertEquals(result, 1);
        
       
    }
    
    @Test
    public void testupdateReview() {
        
       ModelReview update = new ModelReview();
       update.setContent("바꾸움");
       
       ModelReview search = new ModelReview();
       search.setCommentno(37);
       search.setCafeno(260);
       
       int result = svrcafe.updateReview(update, search);
       assertEquals(result, 1);
       
    }
    
    @Test
    public void testdeleteReview() {
        
        ModelReview re = svrcafe.getReviewOne(260, 37);
        
        int result = svrcafe.deleteReview(re.getCommentno());
        
        assertEquals(result, result);
        
    }
    
}
