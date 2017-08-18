package com.spring.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.model.ModelAttachFile;
import com.spring.model.ModelReviewImage;

public interface IDaoReviewImage {
    
    ModelAttachFile getAttachFile(int attachFileno);
    List<ModelAttachFile> getAttachFileList(int articleNo);
    int insertAttachFile(ModelAttachFile attachfile);
    int deleteAttachFile(ModelAttachFile attachfile);
    int insertPhoto(ModelReviewImage attachfile);
    ModelReviewImage getImageByte(int attachfileno);

}
