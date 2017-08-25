package com.spring.cafebbs.dao;

import com.spring.cafebbs.model.ModelUploadFile;
import com.spring.cafebbs.model.ModelUploadImage;

public interface IDaoUpload {
    int insertAttachFile(ModelUploadFile attachfile);
    
    int insertPhoto(ModelUploadImage attachfile);    
    ModelUploadImage getImageByte(int attachfileno);
}
