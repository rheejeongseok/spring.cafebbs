package com.spring.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring.dao.IDaoUser;
import com.spring.model.ModelUser;

@Service("serviceuser")
public class ServiceUser implements IServiceUser {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(ServiceUser.class);
    
    @Autowired
    @Qualifier("daouser")
    private IDaoUser daouser;
    
    @Override
    public ModelUser login(String email,String passwd) {
        ModelUser result = null;
        try {
            result = daouser.login(email,passwd);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("login" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int insertUser(ModelUser user) {
        
        int result = 0;
        try {
            result = daouser.insertUser(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("insertUser" + e.getMessage() );
            throw e;
        }
        
        return result;
    }
    
    @Override
    public ModelUser selectUser(String email) {
        ModelUser result = null;
        try {
            result = daouser.selectUser(email);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("selectUser" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public List<ModelUser> selectUserList(ModelUser user) {
        List<ModelUser> result = null;
        try {
            result = daouser.selectUserList(user);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("selectUserList" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int updateUser(ModelUser update, ModelUser search) {
        int result = 0;
        try {
            result = daouser.updateUser(update, search);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("updateUser" + e.getMessage() );
            throw e;
        }
        return result;
    }
    
    @Override
    public int deleteUser(String email) {
        int result = 0;
        try {
            result = daouser.deleteUser(email);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("deleteUser" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int checkemail(String email) {
        int result = 0;
        try {
            result = daouser.checkemail(email);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("checkemail" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int checknickname(String usernickname) {
        int result = 0;
        try {
            result = daouser.checknickname(usernickname);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("checkemail" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public int loginajax(String email, String passwd) {
        int result = 0;
        try {
            result = daouser.loginajax(email, passwd);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("loginajax" + e.getMessage() );
            throw e;
        }
        return result;
    }

    @Override
    public String findpwd(String email, String userphone) {
        String result = null;
        try {
            result = daouser.findpwd(email, userphone);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            // e.printStackTrace();
            logger.error("findpwd" + e.getMessage() );
            throw e;
        }
        return result;
    }
}
