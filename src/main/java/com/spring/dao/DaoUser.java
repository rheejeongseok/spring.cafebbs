package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.spring.model.ModelUser;


@Repository("daouser")
public class DaoUser implements IDaoUser {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(DaoUser.class);
    
    @Autowired
    @Qualifier("sqlSession")
    private SqlSession session;
    
    
    @Override
    public ModelUser login(String email,String passwd) {
        // TODO Auto-generated method stub
        Map<String,String> map = new HashMap<String,String>();
        map.put("email", email);
        map.put("passwd", passwd);
        return session.selectOne("mapper.mysql.mapperCafe.login",map);
    }
    
    @Override
    public int insertUser(ModelUser user) {
        // TODO Auto-generated method stub
        return session.insert("mapper.mysql.mapperCafe.insertUser",user);
    }
    
    @Override
    public ModelUser selectUser(int userno) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.selectUser",userno);
    }
    
    @Override
    public List<ModelUser> selectUserList(ModelUser user) {
        // TODO Auto-generated method stub
        return session.selectList("mapper.mysql.mapperCafe.selectUserList",user);
    }
    
    @Override
    public int updateUser(ModelUser update, ModelUser search) {
        // TODO Auto-generated method stub
        Map<String,ModelUser> map = new HashMap<String,ModelUser>();
        map.put("update", update);
        map.put("search", search);
        return session.update("mapper.mysql.mapperCafe.updateUser",map);
    }
    
    @Override
    public int deleteUser(String email) {
        // TODO Auto-generated method stub
        return session.delete("mapper.mysql.mapperCafe.deleteUser",email);
    }

    @Override
    public int checkemail(String email) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.checkemail",email);
    }

    @Override
    public int checknickname(String usernickname) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.checknickname",usernickname);
    }
}
