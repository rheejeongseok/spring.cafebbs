package com.spring.cafebbs.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring.cafebbs.dao.IDaoUpload;
import com.spring.cafebbs.model.ModelUploadFile;
import com.spring.cafebbs.model.ModelUploadImage;


@Service("serviceupload")
public class ServiceUpload implements IServiceUpload {

    // SLF4J Logging
    private Logger logger = LoggerFactory.getLogger(this.getClass());
   
    @Autowired
    @Qualifier("daoupload")
    private IDaoUpload uploaddao;

    @Override
    public int insertAttachFile(ModelUploadFile attachfile) {
        
        int result = -1;
        try {
            result = uploaddao.insertAttachFile(attachfile);
        } catch (Exception e) {
            logger.error("insertAttachFile " + e.getMessage() );
        }
        
        return result;
    }


    @Override
    public int insertPhoto(ModelUploadImage attachfile) {
        
        int result = -1;
        try {
            result = uploaddao.insertPhoto(attachfile);
        } catch (Exception e) {
            logger.error("insertAttachFile " + e.getMessage() );
        }
        
        return result;
    }
    
    @Override
    public ModelUploadImage getImageByte(int attachfileno) {
        ModelUploadImage result = null;
        try {
            result = uploaddao.getImageByte(attachfileno);
        } catch (Exception e) {
            logger.error("insertAttachFile " + e.getMessage() );
        }
        
        return result;
    }    
}
