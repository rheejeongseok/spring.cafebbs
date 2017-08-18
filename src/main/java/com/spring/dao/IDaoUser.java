package com.spring.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.model.ModelUser;

public interface IDaoUser {
    
    ModelUser login(String email,String passwd);
    int insertUser(ModelUser user);
    ModelUser selectUser(int userno);
    List<ModelUser> selectUserList(ModelUser user);
    int updateUser(ModelUser update, ModelUser search);
    int deleteUser(String email);
    int checkemail(String email);
    int checknickname(String usernickname);
}
