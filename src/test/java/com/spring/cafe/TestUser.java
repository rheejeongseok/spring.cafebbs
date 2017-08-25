package com.spring.cafe;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.spring.cafebbs.model.ModelUser;
import com.spring.cafebbs.service.IServiceUser;


public class TestUser {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(TestUser.class);
    
    private static ApplicationContext context = null;
    private static IServiceUser svruser = null; 
    
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        context = new ClassPathXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml");
        svruser   = context.getBean("serviceuser", IServiceUser.class);
        
    }
    
    @Test
    public void testlogin() {
        
      
        
    }
    
    @Test
    public void testinsertUser() {
        
        ModelUser user = new ModelUser();
        user.setEmail("abcdefg");
        user.setPasswd("aaaa");
        user.setUserphone("ababaab");
        user.setSex("sex");
        user.setUseraddr("bababa");
        user.setUsernickname("asdf");
        
        int result = svruser.insertUser(user);
        
        assertEquals(result,1);
        
    }
    
    @Test
    public void testupdateUser() {
        
        ModelUser update = new ModelUser();
        ModelUser search = new ModelUser();
        
        update.setUserphone("바아꿈");
        update.setUseraddr("바아꾸움");
        
        search.setEmail("abcdefg");
        
        int result = svruser.updateUser(update, search);
        
        assertEquals(result, 1);
        
    }
    
    
    @Test
    public void testdeleteUser() {
        
        int result = svruser.deleteUser("abcdefg");
        assertEquals(result, 1);
        
    }
}
