package com.spring.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.dao.IDaoReviewImage;
import com.spring.model.ModelAttachFile;
import com.spring.model.ModelReviewImage;

public interface IServiceReviewImage extends IDaoReviewImage {
    
    int insertPhoto(ModelReviewImage rImage);
    ModelReviewImage getImageByte(int attachfileno);
}
