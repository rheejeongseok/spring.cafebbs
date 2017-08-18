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

import com.spring.model.ModelAttachFile;
import com.spring.model.ModelReviewImage;

@Repository("daoupload")
public class DaoReviewImage implements IDaoReviewImage {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(DaoReviewImage.class);
    
    @Autowired
    @Qualifier("sqlSession")
    private SqlSession session;
    
    @Override
    public int insertPhoto(ModelReviewImage attachfile) {
        
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("file", attachfile);
        map.put("result", null);
        session.insert("mapper.mysql.mapperCafe.insertPhoto",map);
        int result = map.get("result") != null ? (int) map.get("result") : -1;
        return result;
    }
    
    @Override
    public ModelReviewImage getImageByte(int attachfileno) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.getImageByte",attachfileno);
    }

    @Override
    public ModelAttachFile getAttachFile(int attachFileno) {
        // TODO Auto-generated method stub
        return session.selectOne("mapper.mysql.mapperCafe.getAttachFile",attachFileno);
    }

    @Override
    public List<ModelAttachFile> getAttachFileList(int articleNo) {
        // TODO Auto-generated method stub
        return session.selectList("mapper.mysql.mapperCafe.getAttachFileList",articleNo);
    }

    @Override
    public int insertAttachFile(ModelAttachFile attachfile) {
        // TODO Auto-generated method stub
        return session.insert("mapper.mysql.mapperCafe.insertAttachFile",attachfile);
    }

    @Override
    public int deleteAttachFile(ModelAttachFile attachfile) {
        // TODO Auto-generated method stub
        return session.insert("mapper.mysql.mapperCafe.deleteAttachFile",attachfile);
    }
}
