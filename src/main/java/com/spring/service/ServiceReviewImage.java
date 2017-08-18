package com.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.model.ModelAttachFile;
import com.spring.model.ModelReviewImage;

public class ServiceReviewImage implements IServiceReviewImage {
    // SLF4J Logging
    private static Logger logger = LoggerFactory.getLogger(ServiceReviewImage.class);
    
    @Override
    public int insertPhoto(ModelReviewImage attachfile) {
        // TODO Auto-generated method stub
        return 0;
    }
    
    @Override
    public ModelReviewImage getImageByte(int attachfileno) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ModelAttachFile getAttachFile(int attachFileno) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<ModelAttachFile> getAttachFileList(int articleNo) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int deleteAttachFile(ModelAttachFile attachfile) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertAttachFile(ModelAttachFile upload) {
        // TODO Auto-generated method stub
        return 0;
    }
}
